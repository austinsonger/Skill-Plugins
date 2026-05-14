#!/usr/bin/env bash
# SessionStart hook: scan compliance evidence artifacts once per day and flag stale items.
# Never blocks startup. Emits a one-line banner to stderr only when stale items exist.

set -u

STATE_DIR="${HOME}/.claude/.evidence-freshness"
CONFIG_DEFAULT="${HOME}/.config/evidence-freshness/config.json"
mkdir -p "$STATE_DIR" 2>/dev/null || true

today="$(date -u +%Y-%m-%d)"
guard="$STATE_DIR/last-run-$today"
report="$STATE_DIR/report.json"

# Daily idempotence guard.
if [ -e "$guard" ]; then
  exit 0
fi

# Resolve evidence root.
root="${EVIDENCE_ROOT:-}"
if [ -z "$root" ] && [ -f "$CONFIG_DEFAULT" ]; then
  root="$(python3 -c 'import json,sys
try:
  print(json.load(open(sys.argv[1])).get("root",""))
except Exception:
  pass' "$CONFIG_DEFAULT" 2>/dev/null)"
fi
if [ -z "$root" ] && [ -d "$PWD/evidence" ]; then
  root="$PWD/evidence"
fi

# Nothing to scan — silently no-op (still mark guard so we don't retry all day).
if [ -z "$root" ] || [ ! -d "$root" ]; then
  : > "$guard"
  exit 0
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run scanner. Capture banner from stdout, ignore failures.
banner="$(python3 "$script_dir/watchdog.py" --root "$root" --report "$report" --config "$CONFIG_DEFAULT" --banner 2>/dev/null)" || banner=""

: > "$guard"

if [ -n "$banner" ]; then
  printf '%s\n' "$banner" >&2
fi

exit 0
