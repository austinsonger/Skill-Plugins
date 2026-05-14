#!/usr/bin/env bash
# UserPromptSubmit hook — records slash-command usage to a flat log.
# Reads the Claude Code hook payload (JSON) on stdin, extracts the leading
# /<command> token from the user's prompt, and appends:
#   <ISO8601-UTC>\t<command>
# to ~/.claude/.skills-plugins-usage.log.
#
# Never blocks the prompt: always exits 0.

set -u

LOG="${HOME}/.claude/.skills-plugins-usage.log"
mkdir -p "$(dirname "$LOG")" 2>/dev/null || true

payload="$(cat 2>/dev/null || true)"
[ -z "$payload" ] && exit 0

# Pull "prompt" field out of the JSON payload without requiring jq.
# Tolerates either "prompt":"..." or "user_prompt":"..." shapes.
prompt="$(printf '%s' "$payload" \
  | tr -d '\n' \
  | sed -nE 's/.*"(user_)?prompt"[[:space:]]*:[[:space:]]*"((\\.|[^"\\])*)".*/\2/p' \
  | head -c 2000)"

# Decode the common JSON escapes we care about.
prompt="$(printf '%s' "$prompt" | sed -E 's/\\"/"/g; s/\\\\/\\/g; s/\\n/ /g; s/\\t/ /g; s/\\r/ /g')"

# Trim leading whitespace.
prompt="$(printf '%s' "$prompt" | sed -E 's/^[[:space:]]+//')"

case "$prompt" in
  /*) ;;
  *) exit 0 ;;
esac

# Strip plugin namespace prefixes like "pluginname:" so we record the bare command.
cmd="$(printf '%s' "$prompt" | sed -nE 's|^/([A-Za-z0-9_:.-]+).*|\1|p')"
[ -z "$cmd" ] && exit 0

ts="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
printf '%s\t%s\n' "$ts" "$cmd" >> "$LOG" 2>/dev/null || true

exit 0
