# Changelog

## 1.0.0

- Initial release.
- `SessionStart` hook with daily idempotence guard.
- Python scanner classifies evidence sidecars as `fresh`, `due-soon`, `stale`,
  `unknown-policy`, or `malformed`.
- `/evidence-freshness` slash command renders grouped tables from the report.
- Defaults: SOC 2 logs → 90 days, ISO docs → 365 days. Custom types via sidecar
  `renewal_days` or `~/.config/evidence-freshness/config.json`.
