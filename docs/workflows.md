# Plugin Workflows

Auto-generated from `metadata.chains_to` in each plugin's `plugin.json`. Don't edit by hand — run `./scripts/regenerate-workflows.sh`.

Each arrow means "when the source plugin finishes, the suggested next slash command is the target." Use these to chain assessments end-to-end (e.g., `/pentest-network` → `/pentest-ad` → `/pentest-report`).

## Chains

- `/blue-team-dfir` → /blue-team-malware-analysis
- `/blue-team-malware-analysis` → /blue-team-threat-intel
- `/pentest-ad` → /pentest-report
- `/pentest-cloud` → /pentest-report
- `/pentest-mobile` → /pentest-report
- `/pentest-network` → /pentest-ad → /pentest-report
- `/pentest-social` → /pentest-report
- `/pentest-wireless` → /pentest-report
- `/red-team-ops` → /pentest-report
- `/reverse-binary` → /reverse-obfuscation
- `/reverse-firmware` → /reverse-binary
- `/security-compliance-control-narrative-writer` → /security-compliance-control-testing-worksheet
- `/security-compliance-control-testing-worksheet` → /security-compliance-compliance-evidence-gen
- `/security-compliance-iso27001-audit-findings` → /security-compliance-control-testing-worksheet
- `/security-compliance-scrms` → /security-compliance-control-narrative-writer
- `/security-compliance-soc2-internal-audit` → /security-compliance-control-testing-worksheet
- `/threat-modeler` → /secure-code-review

## Reading the table

Chains are advisory — Claude Code does not auto-execute the next plugin. The chain footer that appears at the end of each slash command's body simply suggests the next step so the operator (or Claude itself) can pick it up.

