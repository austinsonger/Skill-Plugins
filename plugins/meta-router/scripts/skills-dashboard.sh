#!/usr/bin/env bash
# /skills dashboard — introspects installed plugins, chains, hooks, and last-used.
# Pure bash 3.2+ / grep / sed. No jq, no node.

set -u

usage() {
  cat <<'EOF'
Usage: skills-dashboard.sh [<category> | --unused | --hooks | --help]

  <category>   Filter the per-plugin table to one category (security, blueteam, ...).
  --unused     Only show plugins with no entry in the usage log.
  --hooks      Only show plugins that ship a hooks/hooks.json.
  --help       Show this help.
EOF
}

# ---- locate repo root (the dir that contains .claude-plugin/marketplace.json) ----
find_repo_root() {
  # Prefer CLAUDE_PLUGIN_ROOT's grandparent (plugins/<name>/..)
  if [ -n "${CLAUDE_PLUGIN_ROOT:-}" ]; then
    local candidate="$CLAUDE_PLUGIN_ROOT/../.."
    [ -f "$candidate/.claude-plugin/marketplace.json" ] && { (cd "$candidate" && pwd); return; }
  fi
  if [ -n "${CLAUDE_PROJECT_DIR:-}" ] && [ -f "$CLAUDE_PROJECT_DIR/.claude-plugin/marketplace.json" ]; then
    echo "$CLAUDE_PROJECT_DIR"; return
  fi
  # Walk up from CWD.
  local d
  d="$(pwd)"
  while [ "$d" != "/" ]; do
    [ -f "$d/.claude-plugin/marketplace.json" ] && { echo "$d"; return; }
    d="$(dirname "$d")"
  done
  return 1
}

MODE="full"
CATEGORY=""
case "${1:-}" in
  "")           ;;
  --help|-h)    usage; exit 0 ;;
  --unused)     MODE="unused" ;;
  --hooks)      MODE="hooks" ;;
  --*)          echo "unknown flag: $1" >&2; usage >&2; exit 2 ;;
  *)            MODE="category"; CATEGORY="$1" ;;
esac

REPO_ROOT="$(find_repo_root || true)"
if [ -z "$REPO_ROOT" ]; then
  echo "error: could not locate the marketplace repo (no .claude-plugin/marketplace.json on the path)" >&2
  exit 1
fi

MARKETPLACE="$REPO_ROOT/.claude-plugin/marketplace.json"
PLUGINS_DIR="$REPO_ROOT/plugins"
STATE_FILE="$HOME/.claude/.skills-plugins-state"
USAGE_LOG="$HOME/.claude/.skills-plugins-usage.log"

# ---- parse marketplace.json into a flat TSV: name<TAB>category<TAB>chains_to ----
# chains_to is a comma-joined list, no spaces. Empty if none.
parse_catalog() {
  # Squash to one line, then split on plugin objects.
  tr '\n' ' ' < "$MARKETPLACE" \
    | sed -E 's/\}[[:space:]]*,[[:space:]]*\{/}\n{/g' \
    | grep -E '"name"[[:space:]]*:' \
    | while read -r obj; do
        local name category chains
        name="$(printf '%s' "$obj" | sed -nE 's/.*"name"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/p')"
        category="$(printf '%s' "$obj" | sed -nE 's/.*"category"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/p')"
        chains="$(printf '%s' "$obj" | sed -nE 's/.*"chains_to"[[:space:]]*:[[:space:]]*\[([^]]*)\].*/\1/p' \
          | sed -E 's/"//g; s/[[:space:]]+//g')"
        [ -z "$name" ] && continue
        # Skip the marketplace-level top entry (no source field path) by requiring category.
        printf '%s\t%s\t%s\n' "$name" "${category:-unknown}" "$chains"
      done
}

CATALOG_TSV="$(parse_catalog)"
TOTAL_AVAILABLE="$(printf '%s\n' "$CATALOG_TSV" | grep -c .)"

# ---- installed set ----
INSTALLED_SET=""
if [ -f "$STATE_FILE" ]; then
  INSTALLED_SET="$(awk -F= '{print $1}' "$STATE_FILE" | sort -u)"
fi
TOTAL_INSTALLED="$(printf '%s\n' "$INSTALLED_SET" | grep -c .)"

is_installed() {
  [ -z "$INSTALLED_SET" ] && return 1
  printf '%s\n' "$INSTALLED_SET" | grep -qx "$1"
}

# ---- hooks per plugin ----
plugin_hooks_events() {
  local name="$1"
  local hf="$PLUGINS_DIR/$name/hooks/hooks.json"
  [ -f "$hf" ] || { echo ""; return; }
  grep -oE '"(SessionStart|UserPromptSubmit|PreToolUse|PostToolUse|Stop|SubagentStop|Notification|PreCompact|SessionEnd)"' "$hf" \
    | tr -d '"' | sort -u | tr '\n' ',' | sed 's/,$//'
}

# ---- last-used per command, joined to plugin via commands/<file>.md ownership ----
# command_owner: prints the plugin that ships /<cmd>, or empty.
declare_owners() {
  # Build a static map: command -> plugin, by listing commands/*.md per plugin.
  if [ ! -d "$PLUGINS_DIR" ]; then return; fi
  for d in "$PLUGINS_DIR"/*/; do
    [ -d "${d}commands" ] || continue
    local p
    p="$(basename "$d")"
    for f in "${d}commands"/*.md; do
      [ -f "$f" ] || continue
      printf '%s\t%s\n' "$(basename "$f" .md)" "$p"
    done
  done
}
OWNERS_TSV="$(declare_owners)"

plugin_last_used() {
  local name="$1"
  [ -f "$USAGE_LOG" ] || { echo ""; return; }
  # Find commands owned by this plugin.
  local cmds
  cmds="$(printf '%s\n' "$OWNERS_TSV" | awk -F'\t' -v p="$name" '$2==p {print $1}')"
  [ -z "$cmds" ] && { echo ""; return; }
  # Grep the usage log for any of those commands; take the last (highest) timestamp.
  local pattern
  pattern="$(printf '%s' "$cmds" | tr '\n' '|' | sed 's/|$//')"
  [ -z "$pattern" ] && { echo ""; return; }
  grep -E "	($pattern)\$" "$USAGE_LOG" 2>/dev/null \
    | awk -F'\t' '{print $1}' | sort | tail -1
}

# ---- header ----
echo "ClaudeAdvancedPlugins — /skills dashboard"
echo "Repo:       $REPO_ROOT"
echo "Available:  $TOTAL_AVAILABLE plugin(s) in marketplace.json"
echo "Installed:  $TOTAL_INSTALLED plugin(s) per $STATE_FILE"
if [ -f "$USAGE_LOG" ]; then
  echo "Usage log:  $USAGE_LOG ($(wc -l < "$USAGE_LOG" | tr -d ' ') events)"
else
  echo "Usage log:  (none yet at $USAGE_LOG)"
fi
echo

# ---- per-plugin table ----
echo "Plugins"
printf '  %-44s %-12s %-7s %-30s %s\n' "name" "category" "hooks" "chains_to" "last_used"
printf '  %-44s %-12s %-7s %-30s %s\n' "----" "--------" "-----" "---------" "---------"

printf '%s\n' "$CATALOG_TSV" | while IFS='	' read -r name category chains; do
  [ -z "$name" ] && continue
  case "$MODE" in
    category) [ "$category" = "$CATEGORY" ] || continue ;;
  esac

  events="$(plugin_hooks_events "$name")"
  has_hooks="no"; [ -n "$events" ] && has_hooks="yes"
  case "$MODE" in
    hooks) [ "$has_hooks" = "yes" ] || continue ;;
  esac

  last="$(plugin_last_used "$name")"
  case "$MODE" in
    unused) [ -z "$last" ] || continue ;;
  esac

  inst="*"; is_installed "$name" || inst=" "
  display_chains="${chains:--}"
  display_last="${last:--}"
  printf '  %s%-43s %-12s %-7s %-30s %s\n' "$inst" "$name" "$category" "$has_hooks" "$display_chains" "$display_last"
done
echo "  (* = installed)"
echo

# ---- chain graph ----
if [ "$MODE" = "full" ] || [ "$MODE" = "category" ]; then
  echo "Chains"
  printf '%s\n' "$CATALOG_TSV" | while IFS='	' read -r name category chains; do
    [ -z "$chains" ] && continue
    [ "$MODE" = "category" ] && [ "$category" != "$CATEGORY" ] && continue
    printf '%s' "$chains" | tr ',' '\n' | while read -r target; do
      [ -z "$target" ] && continue
      printf '  %s -> %s\n' "$name" "$target"
    done
  done
  echo
fi

# ---- active hooks ----
if [ "$MODE" = "full" ] || [ "$MODE" = "hooks" ]; then
  echo "Active hooks"
  printf '%s\n' "$CATALOG_TSV" | while IFS='	' read -r name category chains; do
    events="$(plugin_hooks_events "$name")"
    [ -z "$events" ] && continue
    printf '  %-30s %s\n' "$name" "$events"
  done
  echo
fi

# ---- cold (installed but never used) ----
if [ "$MODE" = "full" ] || [ "$MODE" = "unused" ]; then
  echo "Cold plugins (installed, no usage logged)"
  printf '%s\n' "$CATALOG_TSV" | while IFS='	' read -r name category chains; do
    is_installed "$name" || continue
    last="$(plugin_last_used "$name")"
    [ -n "$last" ] && continue
    printf '  %s\n' "$name"
  done
fi
