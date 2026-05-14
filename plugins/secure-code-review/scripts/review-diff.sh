#!/usr/bin/env bash
# secure-code-review PostToolUse hook.
# Reads the file path from the hook payload (stdin JSON), produces a quick
# security-focused diff review, and prints findings to stderr (visible in the
# Claude Code transcript). Exits 0 always — this hook is informational.
set -uo pipefail

# Hook payload arrives on stdin as JSON. We pull the file path from
# tool_input.file_path (Edit/Write). If jq is missing, we fall back to a grep.
payload="$(cat || true)"
file_path=""
if command -v jq >/dev/null 2>&1; then
    file_path="$(echo "$payload" | jq -r '.tool_input.file_path // empty' 2>/dev/null || true)"
fi
if [ -z "$file_path" ]; then
    file_path="$(echo "$payload" | grep -oE '"file_path"[[:space:]]*:[[:space:]]*"[^"]+"' \
        | head -1 | sed -E 's/.*"file_path"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')"
fi
[ -z "$file_path" ] && exit 0
[ -f "$file_path" ] || exit 0

# Cheap heuristic scan. Mirrors the categories the /secure-code-review prompt
# emphasizes — full LLM review still happens when the user invokes the slash
# command on demand.
findings=""
add() { findings="${findings}\n  • $1"; }

grep -nE '\b(eval|exec)\b\s*\(' "$file_path" >/dev/null 2>&1 \
    && add "Dynamic eval/exec detected — CWE-94"
grep -nE 'subprocess\.(call|Popen|run)\([^)]*shell\s*=\s*True' "$file_path" >/dev/null 2>&1 \
    && add "subprocess with shell=True — CWE-78 (command injection)"
grep -nE '(password|api_key|secret|token)\s*=\s*"[^"]+"' "$file_path" >/dev/null 2>&1 \
    && add "Possible hardcoded credential — CWE-798"
grep -nE 'SELECT.*\+.*\+|f"SELECT' "$file_path" >/dev/null 2>&1 \
    && add "String-concatenated SQL — CWE-89 (SQL injection)"
grep -nE 'md5\(|sha1\(' "$file_path" >/dev/null 2>&1 \
    && add "Weak hash function (md5/sha1) — CWE-327"

if [ -n "$findings" ]; then
    echo -e "🔒 [secure-code-review] findings in $file_path:$findings" >&2
fi
exit 0
