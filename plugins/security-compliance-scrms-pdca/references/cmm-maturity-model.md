# CMM Maturity Model Reference

The Control Maturity Model (CMM) provides a consistent language for describing how well a control is implemented. It answers not just "does the control exist?" but "how reliably, consistently, and measurably is it operating?"

---

## The Six Levels

### CMM 0 — Not Performed
**What it means:** The control simply does not exist. There is no awareness of the need, no process in place, and no outputs being produced.

**Indicators:**
- Staff are unaware the control is required
- No documentation, no tooling, no assigned responsibility
- Audit finding: "No evidence of control implementation"

**What to do:** Before anything else, assign a Control Owner (Principle #5). Then plan implementation.

---

### CMM 1 — Performed Informally
**What it means:** The control happens sometimes, but only because certain individuals know to do it. It's not documented, not consistent, and doesn't survive turnover.

**Indicators:**
- "We do that, but it depends on who's on shift"
- Individual heroics rather than process
- Results vary significantly across teams or time periods
- No written procedures

**What to do:** Document what the informal performers are doing. Convert the tribal knowledge into a procedure. That's the bridge to CMM 2.

---

### CMM 2 — Planned & Tracked
**What it means:** The control is documented and there is intent to perform it consistently. Basic tracking exists, but execution is still inconsistent.

**Indicators:**
- A procedure document exists (even if basic)
- Some evidence of execution (tickets, logs, records) — but gaps exist
- Performance varies by team, by site, or over time
- Compliance is not yet the default

**What to do:** Identify where execution breaks down and why. Is it training? Tools? Unclear ownership? Fix the root cause. Focus on making compliance the default behavior.

---

### CMM 3 — Well-Defined
**What it means:** The control is standardized and consistently performed. There is a defined process, it's trained, and it happens reliably without depending on specific individuals.

**Indicators:**
- Documented, approved procedures followed by all responsible parties
- Evidence of consistent execution across teams and time periods
- Training records show staff know how to perform the control
- Deviations are exceptions, not the norm

**What to do:** This is the baseline for most MCR controls. Once here, focus on measurement to move toward CMM 4.

**Note:** Most organizations should target CMM 3 as the standard across their MCR control set. Pursuing CMM 4+ everywhere is costly and often unnecessary.

---

### CMM 4 — Quantitatively Controlled
**What it means:** The control is measured. Management has data-driven visibility into how the control is performing and can detect and respond to degradation.

**Indicators:**
- KPIs/KRIs/KCIs are defined and actively tracked for this control (see Principle #7)
- Thresholds are defined — alerts trigger when performance drops
- Trend data is reviewed regularly
- Deviations are investigated, not just noted

**What to do:** Tie this control to the metrics program. Build alerting on the KPI/KRI. Review trends in leadership reporting.

---

### CMM 5 — Continuously Improving
**What it means:** The control has an active feedback loop. Lessons learned from failures, near-misses, and environmental changes are systematically incorporated.

**Indicators:**
- After-action reviews result in procedural updates
- Threat intelligence informs control adjustments proactively
- The control improves year-over-year in measured effectiveness
- Changes in the business or threat landscape are anticipated and the control adapts

**What to do:** Identify what inputs trigger review cycles and make them systematic. Connect to Principle #9 (Evolve Processes).

---

## Maturity Targeting Guidelines

### By Obligation Type

| Obligation | Recommended Minimum Target | Rationale |
|---|---|---|
| MCR (regulatory/legal) | CMM 3 | Consistent execution required to satisfy compliance evidence |
| MCR (contractual) | CMM 2–3 | Depends on contract terms and audit requirements |
| DSR (high-risk domain) | CMM 3–4 | High-risk warrants measurement, not just execution |
| DSR (standard risk) | CMM 2–3 | Documented and consistent is sufficient |
| DSR (low-risk/nice-to-have) | CMM 1–2 | Resource constraints may limit investment |

### By Control Domain (Common Patterns)

| Domain | Typical Target | Why |
|---|---|---|
| Access Management (IAM) | CMM 4 | High-frequency control, measurable, directly tied to breach risk |
| Vulnerability Management | CMM 4 | Requires trending data to prioritize effectively |
| Incident Response | CMM 3–4 | Must be consistent AND measured (MTTD/MTTR) |
| Security Awareness Training | CMM 3 | Completion rates measurable; CMM 4 possible |
| Physical Security | CMM 2–3 | Varies widely by facility type |
| Third-Party Risk Management | CMM 3 | Consistent assessment process required |
| Data Classification | CMM 2–3 | Often underinvested; CMM 3 is aspirational for many orgs |
| Business Continuity | CMM 3 | Must be tested (not just documented) |

---

## Maturity Assessment Approach

When assessing current maturity for a control:

1. **Review documentation** — Does a policy/standard/procedure exist for this control?
2. **Interview operators** — Do they know the procedure? Can they describe what they do?
3. **Examine evidence** — Are there logs, tickets, reports, or records showing the control operates?
4. **Test consistency** — Is evidence consistent over time and across teams?
5. **Check metrics** — Is anyone measuring this control? Are thresholds defined?
6. **Review evolution** — Has the control been updated based on lessons learned?

**Important:** Maturity is assessed based on evidence, not self-attestation. A Control Owner who says "we do CMM 4 for this" must be able to produce the metrics and trend data to prove it.

---

## Maturity Assessment Template (per control)

| Field | Value |
|---|---|
| Control ID | |
| Control Name | |
| Control Domain | |
| MCR / DSR | |
| Current CMM Level | 0 / 1 / 2 / 3 / 4 / 5 |
| Evidence of Current Level | |
| Target CMM Level | 0 / 1 / 2 / 3 / 4 / 5 |
| Gap | |
| Priority | High / Medium / Low |
| Control Owner | |
| Improvement Actions | |
| Target Date | |
