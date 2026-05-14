---
description: Show stale and due-soon compliance evidence artifacts from the freshness watchdog report.
---

You are surfacing the latest evidence freshness report produced by the watchdog hook.

## Steps

1. Read `~/.claude/.evidence-freshness/report.json`.
   - If the file does not exist, or its `generated_at` is more than 36 hours old, run `${CLAUDE_PLUGIN_ROOT}/scripts/watchdog.sh` first, then re-read.
   - If the file still does not exist, tell the user the watchdog has not been able to locate an evidence root. Hint that they can set `EVIDENCE_ROOT`, create `~/.config/evidence-freshness/config.json` with `{ "root": "..." }`, or place artifacts under `./evidence/`.

2. Print a short header summarizing `counts` (e.g. `4 stale · 3 due-soon · 12 fresh · 1 unknown-policy · 0 malformed`).

3. Group items by status in this order: **stale**, **due-soon**, **unknown-policy**, **malformed**, **fresh**. Inside each group, sort:
   - `stale` and `due-soon` by absolute time distance from today (most overdue first).
   - others alphabetically by `artifact`.

4. For each non-fresh group, render a markdown table with columns:

   | Type | Artifact | Collected | Due | Δ days | Control |

   - For `stale`, show `Δ days` as `-N (overdue)`.
   - For `due-soon`, show `Δ days` as `+N`.
   - For `unknown-policy` / `malformed`, leave date columns blank and append the `error` field in a final notes column.

5. After the tables, output 1–3 short action hints. Examples:
   - "Recollect SOC 2 evidence for controls CC6.1 and CC7.2 before <date>."
   - "Add `renewal_days` to sidecars for type 'pen-test' or define it in `~/.config/evidence-freshness/config.json`."
   - "Fix malformed sidecar at `<path>` (missing `collected_at`)."

6. If everything is fresh, say so in one sentence and stop.

## Constraints

- Do not invent items that are not in the report.
- Do not re-scan unless step 1's freshness check requires it.
- Keep the entire response under ~60 lines unless the user asks for full detail.
