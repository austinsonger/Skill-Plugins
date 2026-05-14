#!/usr/bin/env bash
# threat-modeler UserPromptSubmit hook.
# If the user's prompt mentions threat-modeling keywords, append a one-line
# nudge to run /threat-modeler. Hook stdout is folded into the prompt context.
set -uo pipefail

payload="$(cat || true)"
prompt=""
if command -v jq >/dev/null 2>&1; then
    prompt="$(echo "$payload" | jq -r '.prompt // ""' 2>/dev/null || echo "")"
fi
[ -z "$prompt" ] && exit 0

if echo "$prompt" | grep -qiE 'threat model|stride|pasta|attack tree|dread'; then
    echo ""
    echo "> 🛡 Tip: run /threat-modeler for a structured STRIDE/PASTA/attack-tree walkthrough."
fi
exit 0
