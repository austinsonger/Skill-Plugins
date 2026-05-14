#!/usr/bin/env bash
# memory-vault Stop hook.
# Snapshots a one-line session marker into ~/.claude/memory-vault/<date>.md.
# Heavier summarization is left to the /memory-vault slash command when the
# user explicitly invokes it.
set -uo pipefail

VAULT="$HOME/.claude/memory-vault"
mkdir -p "$VAULT"

ts="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
day="$(date -u +%Y-%m-%d)"
out="$VAULT/$day.md"

payload="$(cat || true)"
cwd=""
session=""
if command -v jq >/dev/null 2>&1; then
    cwd="$(echo "$payload"     | jq -r '.cwd // ""'        2>/dev/null || echo "")"
    session="$(echo "$payload" | jq -r '.session_id // ""' 2>/dev/null || echo "")"
fi
[ -z "$cwd" ] && cwd="$(pwd)"

if [ ! -f "$out" ]; then
    echo "# Memory Vault — $day" > "$out"
    echo "" >> "$out"
fi
printf '- %s · cwd=`%s` · session=%s\n' "$ts" "$cwd" "${session:-unknown}" >> "$out"
exit 0
