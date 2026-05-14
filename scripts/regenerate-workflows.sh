#!/usr/bin/env bash
# regenerate-workflows.sh — produces docs/workflows.md listing every chain
# declared via metadata.chains_to in plugin.json files. Plain markdown, no
# graphviz dependency.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PLUGINS_DIR="$REPO_ROOT/plugins"
OUT="$REPO_ROOT/docs/workflows.md"

mkdir -p "$(dirname "$OUT")"

read_str_array() {
    grep -E "\"$2\"[[:space:]]*:[[:space:]]*\[" "$1" \
        | head -1 \
        | sed -E 's/.*"'"$2"'"[[:space:]]*:[[:space:]]*\[([^]]*)\].*/\1/' \
        | tr -d ' "'
}

{
    cat <<'HEAD'
# Plugin Workflows

Auto-generated from `metadata.chains_to` in each plugin's `plugin.json`. Don't edit by hand — run `./scripts/regenerate-workflows.sh`.

Each arrow means "when the source plugin finishes, the suggested next slash command is the target." Use these to chain assessments end-to-end (e.g., `/pentest-network` → `/pentest-ad` → `/pentest-report`).

## Chains

HEAD

    for dir in "$PLUGINS_DIR"/*/; do
        plugin_dir="${dir%/}"
        plugin_name="$(basename "$plugin_dir")"
        manifest="$plugin_dir/.claude-plugin/plugin.json"
        [ -f "$manifest" ] || continue
        chains_csv="$(read_str_array "$manifest" chains_to)"
        [ -z "$chains_csv" ] && continue

        chain_md="$(echo "$chains_csv" | sed 's|,| → /|g; s|^|/|')"
        echo "- \`/$plugin_name\` → $chain_md"
    done

    cat <<'TAIL'

## Reading the table

Chains are advisory — Claude Code does not auto-execute the next plugin. The chain footer that appears at the end of each slash command's body simply suggests the next step so the operator (or Claude itself) can pick it up.

TAIL
} > "$OUT"

echo "Regenerated $OUT"
