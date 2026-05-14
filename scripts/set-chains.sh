#!/usr/bin/env bash
# Sets metadata.chains_to in each plugin.json based on the table in this file.
# Idempotent: re-running rewrites the field. Run after seed-plugin-meta.sh.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PLUGINS_DIR="$REPO_ROOT/plugins"

# plugin|comma,separated,next,plugins
CHAINS="$(cat <<'EOF'
pentest-network|pentest-ad,pentest-report
pentest-ad|pentest-report
pentest-cloud|pentest-report
pentest-web|pentest-report
pentest-mobile|pentest-report
pentest-wireless|pentest-report
pentest-social|pentest-report
red-team-ops|pentest-report
blue-team-dfir|blue-team-malware-analysis
blue-team-malware-analysis|blue-team-threat-intel
threat-modeler|secure-code-review
reverse-binary|reverse-obfuscation
reverse-firmware|reverse-binary
security-compliance-scrms|security-compliance-control-narrative-writer
security-compliance-control-narrative-writer|security-compliance-control-testing-worksheet
security-compliance-control-testing-worksheet|security-compliance-compliance-evidence-gen
security-compliance-soc2-internal-audit|security-compliance-control-testing-worksheet
security-compliance-iso27001-audit-findings|security-compliance-control-testing-worksheet
EOF
)"

set_chain() {
    local plugin="$1" csv="$2"
    local manifest="$PLUGINS_DIR/$plugin/.claude-plugin/plugin.json"
    [ -f "$manifest" ] || { echo "  [!] missing manifest: $plugin" >&2; return; }

    # Build JSON array literal from CSV.
    local arr=""
    local first=1
    IFS=',' read -ra parts <<< "$csv"
    for p in "${parts[@]}"; do
        if [ $first -eq 1 ]; then arr="\"$p\""; first=0; else arr="$arr, \"$p\""; fi
    done

    # Replace the chains_to array using awk for portability (no jq dep).
    local tmp
    tmp="$(mktemp)"
    awk -v new_arr="[$arr]" '
        /"chains_to"[[:space:]]*:/ {
            sub(/"chains_to"[[:space:]]*:[[:space:]]*\[[^]]*\]/, "\"chains_to\": " new_arr)
        }
        { print }
    ' "$manifest" > "$tmp"
    mv "$tmp" "$manifest"
}

count=0
while IFS='|' read -r plugin chain; do
    [ -z "$plugin" ] && continue
    set_chain "$plugin" "$chain"
    count=$((count + 1))
done <<< "$CHAINS"

echo "Updated chains_to in $count plugin.json file(s)."
