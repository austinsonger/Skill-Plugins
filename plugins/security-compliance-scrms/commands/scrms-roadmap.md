Generate a prioritized, tiered cybersecurity program roadmap using the SCRMS framework (SCF Council Security, Compliance & Resilience Management System).

The arguments provided are: $ARGUMENTS

If no arguments were provided, ask the user for the following before proceeding:
- What compliance frameworks or regulations apply (e.g., HIPAA, CMMC, NIST CSF, PCI DSS, ISO 27001, GDPR)?
- What is the entity's current overall maturity level (1=Ad Hoc, 2=Defined, 3=Managed, 4=Quantitatively Managed, 5=Optimized)?
- What are the top 3 business priorities or risk concerns driving this roadmap?
- What is the approximate annual cybersecurity budget range (or just say "unknown")?
- What is the desired timeframe: 1-year, 3-year, or 5-year roadmap?

If arguments were provided, extract the relevant context from them and proceed.

---

Build the roadmap using the SCRMS three-tier structure:

**Tier 1 — Strategic Objectives (Organization Level)**
Focus: Mission, governance, risk appetite, board-level accountability.
Map to: SCRMS Principles 1 (Establish Context), 4 (Publish Governance Documentation), 5 (Assign Stakeholder Accountability), 8 (Manage Risk).
Timeframe: Ongoing / Year 1 foundation.

**Tier 2 — Operational Objectives (Business Process Level)**
Focus: Capability development, compliance program maturity, risk management operations.
Map to: SCRMS Principles 2 (Identify Controls/LCS), 3 (Define Maturity Expectations), 6 (Prioritize by Risk), 7 (Maintain Situational Awareness).
Timeframe: Year 1–2 build-out.

**Tier 3 — Tactical Objectives (TAAS Level)**
Focus: Technology, processes, and people implementation across the 33 SCRMS domains.
Map to: SCRMS Principle 6 and applicable domain areas from Section 11.
Timeframe: Year 1–3 implementation.

---

For each objective in the roadmap:
- State the objective clearly
- Identify the relevant SCRMS principle(s) and domain(s)
- Note the relevant SCF control domain (e.g., GOV, RSK, IRO, IAC, VPM)
- Assign a priority level: Critical / High / Medium / Low
- Indicate whether it addresses MCR (compliance obligation) or DSR (risk-driven)
- Estimate effort: Low (weeks) / Medium (1–3 months) / High (3–6 months) / Major (6–12 months)

---

**Output format:**

Produce a structured roadmap document with:

1. **Roadmap Summary** — key drivers, scope, and overall strategy
2. **Tier 1 — Strategic Objectives Table** (5–7 items)
3. **Tier 2 — Operational Objectives Table** (8–12 items)
4. **Tier 3 — Tactical Objectives Table** (10–15 items, grouped by domain)
5. **Implementation Phasing** — group all items into Phase 1 (0–6 months), Phase 2 (6–18 months), Phase 3 (18–36 months)
6. **Critical Path** — identify the 5 items that must be completed first before others can progress
7. **Success Metrics** — suggest 3–5 KPIs and 2–3 KRIs to track roadmap progress (per SCRMS Section 12.3)

Use tables with clear columns: Objective | SCRMS Mapping | Priority | MCR/DSR | Effort | Phase.
