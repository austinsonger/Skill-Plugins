#!/usr/bin/env bash
# hallucination-guard PreToolUse hook for Bash.
# Looks at the proposed command and flags references to absolute paths that
# don't exist on disk and aren't being created by the command itself. Exits 2
# with a reason to block the call; exits 0 to allow.
set -uo pipefail

payload="$(cat || true)"
cmd=""
if command -v jq >/dev/null 2>&1; then
    cmd="$(echo "$payload" | jq -r '.tool_input.command // empty' 2>/dev/null || true)"
fi
if [ -z "$cmd" ]; then
    cmd="$(echo "$payload" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]+"' \
        | head -1 | sed -E 's/.*"command"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
fi
[ -z "$cmd" ] && exit 0

# Heuristic: extract absolute paths and check existence. Skip paths that look
# like they're being created (mkdir/touch/git init/etc.) or written to via >.
creating_pattern='(mkdir|touch|cp|mv|git init|git clone|wget|curl -o|tee|>|>>)'
if echo "$cmd" | grep -qE "$creating_pattern"; then
    exit 0
fi

# Extract /-rooted paths up to a whitespace/quote boundary. Limit to first 5.
missing=""
for path in $(echo "$cmd" | grep -oE '/[A-Za-z0-9_./-]+' | sort -u | head -5); do
    case "$path" in
        /tmp/*|/dev/*|/proc/*|/sys/*|/var/run/*|/etc/passwd) continue ;;
    esac
    if [ ! -e "$path" ]; then
        missing="${missing}\n  • $path"
    fi
done

if [ -n "$missing" ]; then
    echo -e "🛡 [hallucination-guard] command references paths that don't exist:$missing" >&2
    echo "Pass --no-guard or use 'mkdir -p' first to create them." >&2
    exit 2
fi
exit 0
