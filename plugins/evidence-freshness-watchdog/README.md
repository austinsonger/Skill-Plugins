# evidence-freshness-watchdog

Daily SessionStart watchdog that flags compliance evidence artifacts as stale
based on per-type renewal windows. Defaults match common audit cadences:

- **SOC 2 logs** (`type: soc2-log`) → 90 days
- **ISO 27001 documents** (`type: iso-doc`) → 365 days

Anything else needs an explicit `renewal_days` on the sidecar or a default in
`~/.config/evidence-freshness/config.json`.

## How it works

On `SessionStart` (matcher `startup|resume`), `scripts/watchdog.sh` runs at most
once per UTC day. It:

1. Resolves the evidence root from `EVIDENCE_ROOT`, then
   `~/.config/evidence-freshness/config.json`'s `root` field, then `./evidence/`.
2. Walks the root for `*.evidence.json` sidecars.
3. Writes `~/.claude/.evidence-freshness/report.json`.
4. Prints a one-line stderr banner only if any items are stale.

The session is never blocked — the hook always exits 0.

Use `/evidence-freshness` to render the full report as grouped tables.

## Evidence layout

```
evidence/
├── soc2/
│   ├── access-review-q1.pdf
│   └── access-review-q1.pdf.evidence.json
└── iso/
    ├── isms-policy.md
    └── isms-policy.md.evidence.json
```

## Sidecar schema

```json
{
  "type": "soc2-log",
  "collected_at": "2026-02-01",
  "renewal_days": 90,
  "control_id": "CC6.1",
  "owner": "asonger@example.com"
}
```

- `type` (required): `soc2-log`, `iso-doc`, or any custom string.
- `collected_at` (required): ISO date or datetime.
- `renewal_days` (optional): overrides defaults / config.
- `control_id`, `owner` (optional): surfaced in the report and slash command.

## Optional config

`~/.config/evidence-freshness/config.json`:

```json
{
  "root": "/Users/me/work/compliance/evidence",
  "types": {
    "pen-test": 365,
    "vendor-review": 180
  }
}
```

## Manual refresh

```bash
rm ~/.claude/.evidence-freshness/last-run-*
bash plugins/evidence-freshness-watchdog/scripts/watchdog.sh
```

## Status values

| Status          | Meaning                                                         |
|-----------------|-----------------------------------------------------------------|
| `fresh`         | `collected_at + renewal_days` is more than 14 days in the future |
| `due-soon`      | Renewal is due within 14 days                                   |
| `stale`         | Renewal date has passed                                         |
| `unknown-policy`| Type has no default and the sidecar lacks `renewal_days`         |
| `malformed`     | Sidecar JSON is unreadable or missing required fields            |
