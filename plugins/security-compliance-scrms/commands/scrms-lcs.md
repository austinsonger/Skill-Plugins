Guide the user through building or reviewing a Living Control Set (LCS) using the SCRMS framework (SCF Council Security, Compliance & Resilience Management System, Section 7).

The arguments provided are: $ARGUMENTS

The LCS is the entity's single authoritative definition of what "reasonable security, compliance, and resilience" means at this point in time. It combines:
- **MCR** (Minimum Compliance Requirements) — externally imposed by laws, regulations, and contracts
- **DSR** (Discretionary Security Requirements) — internally driven by risk appetite, BoD directives, and audit findings
- **MSR** (Minimum Security Requirements) = MCR + DSR combined

Work through the following steps interactively. Ask one section at a time and wait for responses.

---

**Step 1 — Statutory Obligations (MCR)**
Ask what laws apply to the entity. Common examples:
- US Federal: FISMA, HIPAA, FERPA, GLBA, FACTA, FTC Act, CCPA/CPRA
- International: EU GDPR, UK DPA, PIPEDA (Canada), LGPD (Brazil)
- Sector-specific: SOX (public companies), FERPA (education), COPPA (children's data)

For each identified statute, note: Which domains and controls it primarily affects.

**Step 2 — Regulatory Obligations (MCR)**
Ask what regulations apply. Common examples:
- US DoD/Federal: DFARS/CMMC, FedRAMP, NISPOM, FAR
- Financial: FINRA, NY DFS 23 NYCRR 500, OCC/FFIEC guidance
- Privacy: EU GDPR implementing regulations, state AG enforcement priorities
- Critical Infrastructure: NERC CIP, TSA Pipeline, NIS2 (EU)

**Step 3 — Contractual Obligations (MCR)**
Ask what contractual frameworks apply. Common examples:
- PCI DSS (payment card data)
- ISO 27001 (customer/partner contracts)
- SOC 2 Type II (SaaS/cloud service customer expectations)
- NIST CSF (federal contractor requirements)
- CIS CSC (insurance/cyber policy requirements)
- HITRUST (healthcare partner requirements)

**Step 4 — Discretionary Security Requirements (DSR)**
Ask about internally-driven requirements:
- What has the Board of Directors or steering committee directed?
- What did the last internal audit or risk assessment find?
- Have any incidents revealed capability gaps?
- What has any third-party assessment recommended?
- What does the entity's risk appetite suggest beyond compliance minimums?

**Step 5 — Materiality Criteria**
Ask whether the entity has defined materiality thresholds. Remind them the SCRMS financial benchmarks are:
- ≥ 5% of pre-tax earnings
- ≥ 0.5% of total assets
- ≥ 0.5% of total revenue
- ≥ 1% of total equity

Ask: Which controls, if absent or failing, could trigger one of these thresholds? These are **material controls** and require elevated maturity targets.

---

**Output: Living Control Set (LCS) Documentation**

Produce a structured LCS document containing:

1. **LCS Overview** — entity name (if provided), date, version, governing authority
2. **MCR Summary Table** — Source | Type (Statutory/Regulatory/Contractual) | Primary SCRMS Domains | Key Requirements
3. **DSR Summary Table** — Source | Driver (Board/Audit/Incident/Risk Assessment) | Primary SCRMS Domains | Requirement
4. **MSR Combined Baseline** — merged list showing MCR + DSR coverage across the 33 SCRMS domains. For each domain, note: Required (MCR) / Required (DSR) / Recommended / Not Applicable
5. **Material Controls List** — identify controls that meet the materiality criteria with rationale
6. **LCS Governance Notes** — recommended review cadence, who owns the LCS, how changes are approved and documented
7. **Gaps & Recommended Next Steps** — identify domains where neither MCR nor DSR provide coverage but risk exposure suggests they should
