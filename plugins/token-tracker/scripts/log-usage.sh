#!/usr/bin/env bash
# token-tracker Stop hook.
# Appends the session's token usage to ~/.claude/.token-log so the
# /token-tracker slash command can summarize trends.
set -uo pipefail

LOG="$HOME/.claude/.token-log"
mkdir -p "$(dirname "$LOG")"
touch "$LOG"

payload="$(cat || true)"
ts="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

input=0
output=0
model=""
if command -v jq >/dev/null 2>&1; then
    input="$(echo "$payload"  | jq -r '.usage.input_tokens  // 0' 2>/dev/null || echo 0)"
    output="$(echo "$payload" | jq -r '.usage.output_tokens // 0' 2>/dev/null || echo 0)"
    model="$(echo "$payload"  | jq -r '.model // ""'             2>/dev/null || echo "")"
fi

printf '%s\t%s\tin=%s\tout=%s\n' "$ts" "${model:-unknown}" "$input" "$output" >> "$LOG"
exit 0
