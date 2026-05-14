#!/usr/bin/env bash
# new-plugin.sh — scaffold a new plugin so adding the 61st takes one command.
#
# Usage:
#   scripts/new-plugin.sh <plugin-name> <category> [--agent] [--hook] [--skill] [--description "..."]
#
# Effects (all idempotent):
#   1. Creates plugins/<name>/{commands,.claude-plugin}
#      (and agents/, hooks/, scripts/ if the matching flag is set)
#   2. Writes commands/<name>.md, .claude-plugin/plugin.json, CHANGELOG.md
#   3. Adds <name> to get_category_plugins() in install.sh (via sentinel)
#   4. Runs regenerate-marketplace.sh, regenerate-readme-table.sh,
#      regenerate-workflows.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PLUGINS_DIR="$REPO_ROOT/plugins"
INSTALL_SH="$REPO_ROOT/install.sh"

usage() {
    cat <<'EOF'
Usage: scripts/new-plugin.sh <plugin-name> <category> [options]

Options:
  --agent              Create an agents/<name>.md stub
  --hook               Create a hooks/hooks.json stub
  --skill              Create a SKILL.md alongside commands/ (skill-rooted layout)
  --description STR    One-line description for plugin.json (default: TODO)
  --domain STR         Domain phrase used inside the command template (default: <name>)
  -h | --help          Show this help

Valid categories: backend frontend gamedev security blueteam reverse productivity systems compliance
EOF
}

NAME="" CATEGORY="" WITH_AGENT=0 WITH_HOOK=0 WITH_SKILL=0
DESC="TODO" DOMAIN=""

while [ $# -gt 0 ]; do
    case "$1" in
        --agent)        WITH_AGENT=1 ;;
        --hook)         WITH_HOOK=1 ;;
        --skill)        WITH_SKILL=1 ;;
        --description)  DESC="$2"; shift ;;
        --domain)       DOMAIN="$2"; shift ;;
        -h|--help)      usage; exit 0 ;;
        -*)             echo "Unknown flag: $1" >&2; usage >&2; exit 2 ;;
        *)
            if [ -z "$NAME" ];     then NAME="$1"
            elif [ -z "$CATEGORY" ]; then CATEGORY="$1"
            else echo "Unexpected arg: $1" >&2; usage >&2; exit 2
            fi ;;
    esac
    shift
done

[ -z "$NAME" ] || [ -z "$CATEGORY" ] && { usage >&2; exit 2; }
case "$CATEGORY" in
    backend|frontend|gamedev|security|blueteam|reverse|productivity|systems|compliance) ;;
    *) echo "Invalid category: $CATEGORY" >&2; exit 2 ;;
esac
[ -z "$DOMAIN" ] && DOMAIN="$NAME"

PLUGIN_DIR="$PLUGINS_DIR/$NAME"
if [ -d "$PLUGIN_DIR" ]; then
    echo "Plugin already exists: $NAME (skipping scaffolding, will still regenerate manifests)" >&2
else
    mkdir -p "$PLUGIN_DIR/commands" "$PLUGIN_DIR/.claude-plugin"
    [ $WITH_AGENT -eq 1 ] && mkdir -p "$PLUGIN_DIR/agents"
    [ $WITH_HOOK  -eq 1 ] && mkdir -p "$PLUGIN_DIR/hooks" "$PLUGIN_DIR/scripts"

    # commands/<name>.md
    sed -e "s/__TITLE__/${NAME//-/ }/g" \
        -e "s/__NAME__/$NAME/g" \
        -e "s/__DOMAIN__/$DOMAIN/g" \
        "$SCRIPT_DIR/templates/command.md.tmpl" > "$PLUGIN_DIR/commands/$NAME.md"

    # SKILL.md (only when --skill)
    if [ $WITH_SKILL -eq 1 ]; then
        cat > "$PLUGIN_DIR/SKILL.md" <<EOF
---
name: $NAME
description: $DESC
---

# $NAME

$DESC

## Capabilities

- TODO
EOF
    fi

    # plugin.json
    cat > "$PLUGIN_DIR/.claude-plugin/plugin.json" <<EOF
{
  "name": "$NAME",
  "version": "1.0.0",
  "description": "$DESC",
  "author": { "name": "Austin Songer" },
  "homepage": "https://github.com/austinsonger/ClaudeAdvancedPlugins",
  "repository": "https://github.com/austinsonger/ClaudeAdvancedPlugins",
  "license": "MIT",
  "category": "$CATEGORY",
  "commands": "./commands",
  "metadata": {
    "badges": [],
    "chains_to": []
  }
}
EOF

    # CHANGELOG.md
    today="$(date +%Y-%m-%d)"
    cat > "$PLUGIN_DIR/CHANGELOG.md" <<EOF
# Changelog

All notable changes to this plugin will be documented in this file.

## [1.0.0] - $today

### Added
- Initial release.
EOF

    # Agent stub
    if [ $WITH_AGENT -eq 1 ]; then
        sed -e "s/__NAME__/$NAME/g" \
            -e "s/__DOMAIN__/$DOMAIN/g" \
            -e "s|__DESCRIPTION__|$DESC|g" \
            "$SCRIPT_DIR/templates/agent.md.tmpl" > "$PLUGIN_DIR/agents/$NAME.md"
    fi

    # Hook stub
    if [ $WITH_HOOK -eq 1 ]; then
        sed -e "s/__SCRIPT__/${NAME}-hook.sh/g" \
            "$SCRIPT_DIR/templates/hooks.json.tmpl" > "$PLUGIN_DIR/hooks/hooks.json"
        cat > "$PLUGIN_DIR/scripts/${NAME}-hook.sh" <<'EOF'
#!/usr/bin/env bash
# TODO: implement hook behavior.
set -uo pipefail
exit 0
EOF
        chmod +x "$PLUGIN_DIR/scripts/${NAME}-hook.sh"
    fi
fi

# Register in install.sh category list if not already present.
if ! grep -E "^\s+$CATEGORY\)" "$INSTALL_SH" | grep -q "\\b$NAME\\b"; then
    tmp="$(mktemp)"
    awk -v cat="$CATEGORY" -v name="$NAME" '
        $0 ~ "^[[:space:]]*"cat"\\)" {
            # Append the new plugin to the existing list before the closing quote+semicolons.
            sub(/"[[:space:]]*;;[[:space:]]*$/, " "name"\" ;;")
        }
        { print }
    ' "$INSTALL_SH" > "$tmp"
    mv "$tmp" "$INSTALL_SH"
    echo "  [+] Registered $NAME in install.sh ($CATEGORY)"
fi

# Regenerate marketplace, README table, workflows.
"$SCRIPT_DIR/regenerate-marketplace.sh"
"$SCRIPT_DIR/regenerate-readme-table.sh"
"$SCRIPT_DIR/regenerate-workflows.sh"

echo ""
echo "✓ Plugin scaffolded: plugins/$NAME"
echo ""
echo "Next steps:"
echo "  1. Edit plugins/$NAME/commands/$NAME.md with the real prompt body."
echo "  2. Update description in plugins/$NAME/.claude-plugin/plugin.json."
[ $WITH_AGENT -eq 1 ] && echo "  3. Fill in plugins/$NAME/agents/$NAME.md."
[ $WITH_HOOK  -eq 1 ] && echo "  4. Implement plugins/$NAME/scripts/${NAME}-hook.sh."
echo "  → Test install: ./install.sh -p $NAME"
