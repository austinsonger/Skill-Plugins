#!/usr/bin/env bash
# context-keeper SessionStart hook.
# Echoes the most recent memory-vault daily file to stdout. Claude Code
# includes the hook's stdout in the session's context, giving Claude a short
# recap of what happened in the previous session.
set -uo pipefail

VAULT="$HOME/.claude/memory-vault"
[ -d "$VAULT" ] || exit 0

last="$(ls -1t "$VAULT"/*.md 2>/dev/null | head -1)"
[ -z "$last" ] && exit 0
[ ! -f "$last" ] && exit 0

echo "## Previous session context (from $(basename "$last"))"
echo ""
# Show only the last 20 lines to keep the prelude short.
tail -20 "$last"
exit 0
