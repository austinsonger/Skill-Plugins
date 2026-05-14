#!/usr/bin/env bash
# ============================================================================
# seed-plugin-meta.sh
# One-time seeder. For each plugins/<name>/, creates:
#   .claude-plugin/plugin.json  (if missing)
#   CHANGELOG.md                (if missing)
#
# Descriptions and categories come from the table below. Keep this script
# around so future plugin imports can reuse it. The plan calls for the
# scaffolder (new-plugin.sh) to be the long-term entry point.
# ============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PLUGINS_DIR="$REPO_ROOT/plugins"

# plugin-name|category|description
META="$(cat <<'EOF'
backend-architect|backend|System architecture, API design, database optimization, scalability patterns
frontend-forge|frontend|Component architecture, accessibility, design systems, TypeScript
frontend-animations|frontend|CSS/GSAP/Framer Motion animations, micro-interactions, scroll effects
frontend-dom|frontend|DOM manipulation, Web Components, Shadow DOM, browser APIs
frontend-3d|frontend|Three.js, React Three Fiber, WebGL, GLSL shaders, 3D scenes
frontend-perf|frontend|Core Web Vitals, bundle optimization, code splitting, rendering performance
frontend-micro|frontend|Micro-frontends, Module Federation, state machines, monorepo architecture
gamedev-unity|gamedev|Unity MonoBehaviour, ScriptableObjects, ECS/DOTS, URP/HDRP, networking, editor tools
gamedev-unreal|gamedev|Unreal Engine UObject system, GAS, Enhanced Input, Nanite/Lumen, Blueprints
gamedev-threejs|gamedev|Three.js browser games, ECS, Rapier physics, R3F, custom shaders
gamedev-godot|gamedev|Godot 4 nodes, GDScript, state machines, physics, scenes
gamedev-design|gamedev|Game design core loops, balancing, ECS patterns, level design, GDD/TDD templates
memory-vault|productivity|Persistent cross-session knowledge management
context-keeper|productivity|Maintains project context across sessions, auto-saves decisions and conventions
context-manager|productivity|Context window optimization, smart file loading
hallucination-guard|productivity|Accuracy verification, confidence signaling, source validation
token-tracker|productivity|Token usage tracking, cost estimation, and optimization tips per task
red-team-ops|security|Adversary simulation, attack chains, MITRE ATT&CK, C2 infrastructure
pentest-toolkit|security|PTES methodology, OWASP Top 10, web/API vulnerability assessment
pentest-network|security|Network infrastructure testing, service enumeration, network exploitation
pentest-mobile|security|Android/iOS app testing, Frida, OWASP MASTG/MASVS
pentest-cloud|security|AWS/Azure/GCP security testing, IAM exploitation, privilege escalation
pentest-wireless|security|Wi-Fi, Bluetooth, BLE, IoT radio, SDR security testing
pentest-ad|security|Active Directory attacks, Kerberos, ADCS, BloodHound, delegation abuse
pentest-social|security|Social engineering campaigns, phishing, vishing, OSINT, physical SE
pentest-report|security|Professional pentest report writing, CVSS scoring, executive summaries
exploit-dev|security|Binary exploitation, ROP chains, heap techniques, CTF solving
api-security|security|OWASP API Top 10, GraphQL/gRPC/WebSocket testing
blue-team-soc|blueteam|SOC operations, alert triage, Tier 1-3 analysis, incident investigation
blue-team-dfir|blueteam|Digital forensics, incident response, evidence handling, NIST SP 800-61
blue-team-malware-analysis|blueteam|Static/dynamic malware analysis, YARA rules, behavioral analysis
blue-team-siem|blueteam|Sigma rules, Splunk SPL, Elastic KQL/EQL, Sentinel KQL, detection engineering
blue-team-threat-intel|blueteam|CTI lifecycle, OSINT, actor profiling, STIX/TAXII, TLP classification
blue-team-hardening|blueteam|CIS Benchmarks, STIGs, Windows/Linux/container/cloud hardening
blue-team-network-defense|blueteam|IDS/IPS, firewall management, network monitoring, Suricata/Zeek rules
blue-team-edr|blueteam|EDR/XDR analysis, Sysmon configuration, endpoint threat hunting
reverse-binary|reverse|PE/ELF/Mach-O analysis, disassembly, decompilation, Ghidra/IDA
reverse-malware|reverse|Malware reverse engineering, unpacking, C2 protocol analysis, config extraction
reverse-protocol|reverse|Network protocol RE, binary format analysis, Wireshark dissectors
reverse-firmware|reverse|Firmware extraction, embedded systems, UART/JTAG, emulation
reverse-obfuscation|reverse|Deobfuscation, anti-debug bypass, anti-VM bypass, unpacking
secure-code-review|security|SAST-style code review, CWE mapping, vulnerability patterns
threat-modeler|security|STRIDE, DREAD, PASTA, attack trees, risk matrices
crypto-analysis|security|Cryptographic auditing, RSA/ECC attacks, TLS analysis, key management
vuln-research|security|Vulnerability discovery, fuzzing, CodeQL, responsible disclosure
supply-chain-sec|security|Dependency attacks, SBOM, SLSA framework, build pipeline security
cloud-security|systems|Cloud security architecture, landing zones, IAM, multi-cloud design
devsecops|security|CI/CD security, SAST/DAST/SCA integration, security pipeline design
os-internals|systems|Linux/Windows/macOS kernel internals, system debugging
security-compliance-scrms|compliance|SCF Security, Compliance & Resilience Management System (SCRMS) framework guidance
security-compliance-scrms-pdca|compliance|SCRMS Plan-Do-Check-Act cycle implementation guidance
security-compliance-soc2-internal-audit|compliance|SOC 2 Type II internal audit assistant
security-compliance-iso27001-audit-findings|compliance|ISO/IEC 27001:2022 internal audit findings assistant
security-compliance-vendor-risk-assessment|compliance|Third-party vendor risk assessment workflow
security-compliance-control-narrative-writer|compliance|Auditor-ready control implementation narrative generator
security-compliance-control-statement-enhancer|compliance|Transforms basic security control statements into defensible auditor-ready text
security-compliance-control-testing-worksheet|compliance|Control testing worksheet generator
security-compliance-inheritance-matrix-builder|compliance|Build control inheritance matrices across CSP / customer boundaries
security-compliance-compliance-evidence-gen|compliance|Generates specific, auditor-ready evidence artifacts
security-compliance-compliance-evidence-guide|compliance|Generates auditor-ready compliance evidence collection guides
EOF
)"

today="$(date +%Y-%m-%d)"
created=0
skipped=0

while IFS='|' read -r name category desc; do
    [ -z "$name" ] && continue
    plugin_dir="$PLUGINS_DIR/$name"
    if [ ! -d "$plugin_dir" ]; then
        echo "  [!] Missing plugin directory: $name (skipping)" >&2
        continue
    fi

    mkdir -p "$plugin_dir/.claude-plugin"
    manifest="$plugin_dir/.claude-plugin/plugin.json"

    if [ -f "$manifest" ]; then
        skipped=$((skipped + 1))
    else
        cat > "$manifest" <<EOF
{
  "name": "$name",
  "version": "1.0.0",
  "description": "$desc",
  "author": { "name": "Austin Songer" },
  "homepage": "https://github.com/austinsonger/ClaudeAdvancedPlugins",
  "repository": "https://github.com/austinsonger/ClaudeAdvancedPlugins",
  "license": "MIT",
  "category": "$category",
  "commands": "./commands",
  "metadata": {
    "badges": [],
    "chains_to": []
  }
}
EOF
        created=$((created + 1))
    fi

    changelog="$plugin_dir/CHANGELOG.md"
    if [ ! -f "$changelog" ]; then
        cat > "$changelog" <<EOF
# Changelog

All notable changes to this plugin will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - $today

### Added
- Initial release.
EOF
    fi
done <<< "$META"

echo "Seeded $created plugin.json file(s); $skipped already existed."
