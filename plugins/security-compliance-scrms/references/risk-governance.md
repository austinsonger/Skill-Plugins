# SCRMS Risk Management & Governance Deep Dive

## Nested Risk Management Architecture

The SCRMS uses a "Russian nesting doll" structure for risk management — each layer is subordinate to the one above:

```
Enterprise Risk Management (ERM)
  └── Cybersecurity & Data Protection Risk Management (CDPRM)
        └── Third-Party Risk Management (TPRM)
              └── Supply Chain Risk Management (SCRM)
                    └── Cybersecurity Supply Chain Risk Management (C-SCRM)
```

**ERM** focuses on entity-level risk — defines what is acceptable and unacceptable across all risk types.

**CDPRM** focuses on cybersecurity and data protection component of risk — operates within ERM parameters.

**TPRM** focuses on external risks from third parties (ESPs, CSPs, material suppliers). Includes:
- Supply Chain Risk Management (SCRM)
- Cybersecurity Supply Chain Risk Management (C-SCRM)

---

## Risk Profile Components

Every entity needs entity-specific definitions for:

### 1. Risk Appetite
A **high-level management statement** about what types and amounts of risk the entity is willing to accept. It is subjective — "we have a moderate risk appetite" — and does not contain granular criteria.

Think of it like a **policy**: a high-level statement of management intent.

### 2. Risk Tolerance
**Objective, graduated criteria** for categorizing risk on a scale (e.g., Low/Moderate/High/Severe/Extreme). Unlike risk appetite, risk tolerance has measurable thresholds.

Risk tolerance establishes the decision-making framework for risk assessments — it determines how to categorize and respond to identified risks.

### 3. Risk Thresholds
**Entity-specific decision points** tied to risk tolerance that trigger required management action. For example:
- A "High Risk" threshold might trigger mandatory remediation within 90 days
- A "Severe Risk" threshold might require executive escalation
- An "Extreme Risk" threshold might require board notification

Risk thresholds are unique to each entity based on: financial stability, management preferences, compliance obligations, and insurance coverage.

---

## Risk vs Threat: Critical Distinction

**To determine if something is a RISK, ask:**
*"Does this issue/event relate to (1) the existence of, or (2) a deficiency with, an existing control?"*
- If yes → it is a **risk** → document in the **risk catalog**

**To determine if something is a THREAT, ask:**
*"Does this issue/event affect control execution (the ability of the safeguard to function as intended)?"*
- If yes → it is a **threat** → document in the **threat catalog**

Vulnerabilities are created by design flaws, insecure protocols, incorrect implementations, mismanagement, and misbehavior. Threats seek to exploit those vulnerabilities. Controls are meant to mitigate threats and reduce risk.

---

## Materiality Framework

Materiality is fundamentally an **executive/board determination** — not a cybersecurity determination. It is primarily based on a clearly defined financial threshold.

### Materiality Test (any one criterion = material)
A control deficiency, risk, threat, or incident is material if the potential financial impact is:
- ≥ **5%** of Earnings Before Tax (EBT)
- ≥ **0.5%** of total assets
- ≥ **0.5%** of total revenue
- ≥ **1%** of total equity

### Material Control
A control where:
- No reasonable compensating control can offset its failure, AND
- Its absence or failure exposes the entity such that it could have a material impact

Material controls receive:
- Elevated maturity expectations
- Increased oversight and reporting visibility
- Priority in funding and remediation sequencing
- Explicit validation cadence requirements

### Material Risk
An identified risk where the exposure to danger, harm, or loss has a **material financial impact** — or qualitative material impact such as significant regulatory action, class action lawsuit, or death related to product usage.

### Material Threat
A threat vector that has the potential to cause damage or danger resulting in a material impact. Examples: poorly governed AI initiatives, nation-state hacking operations, dysfunctional internal management practices.

### Material Incident
An occurrence that does or has the potential to:
- Jeopardize the CIAS of a system, application, service, or data with material impact
- Constitute a violation (or imminent threat of violation) of entity policies with material impact (e.g., malware on sensitive systems, emergent AI actions, illegal conduct, business interruption)

---

## Living Control Set (LCS)

### What it is
The LCS is the **entity's single source of truth** for what "reasonable security, compliance and resilience" means at a specific point in time. It is:
- NOT a generic framework mapping
- NOT a static catalog — it lives and evolves
- The foundational layer of the entire SCRMS

### What it establishes
1. What controls must exist
2. How those controls are prioritized (including material vs non-material)
3. Which controls are considered material
4. How control effectiveness is validated over time

### What drives it
LCS is derived from:
- **MCR** (Minimum Compliance Requirements) — external obligations
- **DSR** (Discretionary Security Requirements) — internal risk-justified requirements
- Entity's risk appetite, risk tolerance, risk thresholds
- Explicit materiality criteria for risks, threats, incidents, and controls

### Governance of the LCS
Changes to the LCS must be documented, justified, and traceable to one of:
- Changes in statutory, regulatory, or contractual obligations
- Emerging threats or shifts in risk exposure
- Adjustments to risk appetite, tolerance, or threshold
- Lessons learned from incidents or capability testing
- Significant business changes (new products, acquisitions, geographic expansion)

The LCS is approved under the entity's defined governance authority (steering committee, CISO, or GRC Director). The Board is responsible for approving risk appetite and materiality thresholds, reviewing material control status, and monitoring unresolved material risks.

### Why the LCS matters for defensibility
Updates to the LCS must preserve traceability so that historical decisions can be reconstructed for scenarios where regulators, auditors, insurers, or courts scrutinize those decisions. The LCS converts risk appetite into operational reality and operational activity into defensible evidence.

---

## Control Set: MCR vs DSR vs MSR

### Minimum Compliance Requirements (MCR)
- **What:** "Must have" controls externally imposed by laws, regulations, and contracts
- **Why they exist:** Non-compliance exposes the entity to legal, regulatory, or contractual liability
- **Sources:** Statutory (laws), Regulatory (rules from regulators), Contractual (vendor/partner agreements)
- **Key insight:** MCR compliance alone does NOT equate to being secure. MCR is the floor, not the ceiling.

### Discretionary Security Requirements (DSR)
- **What:** "Nice to have" controls that address the entity's risk appetite beyond MCR
- **Why they exist:** Risk exposure identified through internal audit, risk assessments, incidents, BoD direction
- **Sources:** Board of Directors guidance, steering committee recommendations, internal audit findings, prior incidents, third-party audit recommendations
- **Key insight:** DSR are NOT optional in practice — the entity's risk, threat exposure, or materiality thresholds justify them. They should be treated as mandatory within the LCS.

### Minimum Security Requirements (MSR)
MCR + DSR = **MSR** — the entity's complete control baseline. This is the "Minimum Viable Product" for security from a technical and business requirements perspective.

MSR:
- Includes traditional IT General Controls (ITGC)
- Defines how Technology Assets, Applications, and Services (TAAS) must be designed, implemented, and operated
- Is applied to all Technology Assets, Applications, Services and/or Data (TAASD) across the entity

---

## Risk Integration with Business Planning

Risk management operates across three tiers:

### Tier 1 — Strategic (Corporate Level)
- Risk **appetite** is defined here
- Corporate-level actions and decisions (mission, vision, strategy)
- Cybersecurity strategy and policy governance

### Tier 2 — Operational (Line of Business Level)
- Risk **tolerance** is put into practice here
- Mission/business process objectives
- Capability maturity targets and resource prioritization

### Tier 3 — Tactical (Department/Team Level)
- Risk **thresholds** provide assessment criteria here
- TAAS-level implementation (systems, applications, services, processes)
- Technology and staffing decisions

---

## Governance Documentation Hierarchy

The SCRMS Hierarchical Cybersecurity Governance Framework (HCGF) connects:

```
External Influences (Statutory, Regulatory, Contractual)
Internal Influences (BoD, Corporate Culture, Risk Management)
    ↓
Policies (high-level statements of management intent — rarely change)
    ↓
Standards (granular requirements to enforce policies — technology-specific)
    ↓
Control Objectives
    ↓
Controls (the nexus — safeguards and countermeasures)
    ↓
Procedures (control activities — how controls are actually performed)
    ↓
Assessment Objectives (AOs) — objective criteria for control evaluation
    ↓
Evidence Artifacts (proof that controls operate)
```

**Supporting documentation:**
- Secure Baseline Configurations (SBC)
- Risk Register / Plan of Action & Milestones (POA&M)
- System Security & Privacy Plan (SSPP)

---

## Surviving Real-World Governance Challenges

The SCRMS acknowledges common governance gaps that entities must proactively address:

| Challenge Area | Key Question |
|---------------|-------------|
| Operational Reality | What prevents controls from being undermined by routine change? |
| Evidence Integrity | How do you distinguish real operational execution from performative documentation? |
| Control Longevity | How do you detect and correct control decay between formal assessments? |
| AI Accountability | Who owns AI decisions, failures, and unintended consequences? |
| Vendor Breach Scenarios | How do you respond when a trusted third party becomes the breach vector? |
| Decision Authority | Who has final authority during security and resilience conflicts or crises? |
| Resilience Proof | Has resilience been proven under compounded failure scenarios? |
| Maturity Honesty | How do you prevent maturity scoring from becoming aspirational fiction? |
| Metric Validity | Which metrics are explicitly disallowed due to false confidence risk? |
| Business Alignment | How does SCRMS support rational economic decisions rather than idealized security goals? |

---

## SCRMS Governance Considerations — Potential Gaps

Key areas where entities commonly have gaps:

1. **Operational Control Assumptions** — Governance intent doesn't translate to operational enforcement
2. **Due Care Verifiability** — Activities are documented but lack defensible, evidence-based proof
3. **Control Drift & Capability Decay** — No mechanism to detect control erosion between audits
4. **AI Governance Depth** — AI treated as a risk category, not a governed lifecycle system
5. **Supply Chain Threats** — TPRM treated as an extension, not a co-equal attack surface
6. **Decision Making Authority** — Roles defined but escalation paths unclear during incidents
7. **Resilience Stress Testing** — Resilience planning lacks compounded adversarial stress testing
8. **Linear Maturity Assumptions** — All controls treated as equally weighted for maturity purposes
9. **Metrics Without Guardrails** — KPIs/KRIs encouraged without guardrails against misleading metrics
10. **Economic Decision Framing** — Security decisions ignore economic realities of the entity
