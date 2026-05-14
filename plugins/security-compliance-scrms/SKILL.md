---
name: scrms
description: >
  Expert guidance on the SCF Security, Compliance & Resilience Management System (SCRMS) — a framework-agnostic approach for designing, implementing, and maintaining Secure, Compliant, and Resilient (SCR) capabilities across People, Processes, Technology, Data & Facilities (PPTDF). Use whenever someone asks about SCRMS, SCF, security program design, cybersecurity governance, compliance program structure, defensible evidence, Living Control Set (LCS), MCR/DSR/MSR, due diligence vs due care, CIAS, nested risk management (ERM/CDPRM/TPRM), materiality, CISO defensibility, control set determination, or any of the 33 SCRMS domains (governance, incident response, vulnerability management, data privacy, third-party risk, etc.). Also trigger for: "how do I build a cybersecurity program", "what controls do I need for compliance", "how do I prove we're secure to auditors", "CISO needs to justify the budget", or "map security to a framework."
---

# Security, Compliance & Resilience Management System (SCRMS)

**Source:** SCF Council SCRMS v2026.1 — https://securecontrolsframework.com/content/scrms.pdf

## What is the SCRMS?

The SCRMS is a **framework- and technology-agnostic** approach to design, implement, and maintain Secure, Compliant and Resilient (SCR) capabilities. It is built around two foundational goals:

1. **Provide structure** so an entity can be secure, compliant and resilient.
2. **Generate defensible evidence** of due diligence and due care that can withstand legal, regulatory, or audit scrutiny.

It modernizes traditional ISMS models by treating governance, risk management, compliance, and data privacy as an integrated "security, compliance and resilience ecosystem" rather than siloed management systems.

---

## Core Concepts (Quick Reference)

### PPTDF — The Scope of Controls
Controls apply across five dimensions:
- **People** → training, HR practices, background checks
- **Processes** → administrative work, procedures, documentation
- **Technology** → systems, applications, services
- **Data** → data protection, classification, encryption
- **Facilities** → physical access, environmental security

### CIAS — The Purpose of Security Controls
Security addresses **Confidentiality, Integrity, Availability, and Safety** (an evolution of the classic CIA triad).

### MCR vs DSR vs MSR
| Term | Meaning |
|------|---------|
| **MCR** (Minimum Compliance Requirements) | "Must have" — externally imposed by laws, regulations, contracts |
| **DSR** (Discretionary Security Requirements) | "Nice to have" — internally driven by risk appetite, BoD, audits |
| **MSR** (Minimum Security Requirements) | MCR + DSR combined = the entity's full control baseline |

### Living Control Set (LCS)
The LCS is the entity-specific, approved, authoritative definition of "what reasonable security means for us right now." It is:
- Not a generic framework mapping — it is tailored to the entity
- Derived from MCR + DSR + risk profile + materiality criteria
- Subject to continuous governance review as the business evolves
- The anchor for all due diligence (building capability) and due care (governing it)

### Due Diligence vs Due Care
- **Due Diligence** = "Has the entity taken reasonable steps to *build* secure, compliant and resilient capabilities?" (designing and implementing)
- **Due Care** = "Is leadership actively *governing and adapting* SCR capabilities in response to changing risks?" (ongoing oversight and evolution)

Both must be demonstrable — documents alone aren't enough; evidence of actual operation is required.

### Integrated Controls Management (ICM) — Controls-Centric Mindset
Controls are the nexus of the SCRMS. Everything maps to controls:
- Policies enforce standards → standards map to controls
- Procedures operationalize controls
- Metrics track control execution
- Risks and threats map to controls
- Evidence artifacts prove controls operate

---

## The 9 SCRMS Principles

These follow a Plan-Do-Check-Act (PDCA) cycle:

| # | Principle | Phase | Core Activity |
|---|-----------|-------|--------------|
| 1 | **Establish Context** | PLAN | Define mission, compliance obligations, risk profile, geographic/structural factors |
| 2 | **Identify Applicable Controls** | PLAN | Build the Living Control Set (LCS) from MCR + DSR |
| 3 | **Define Maturity Expectations** | PLAN | Set entity-specific "what right looks like" targets for PPTDF |
| 4 | **Publish Governance Documentation** | PLAN | Create policies, standards, and procedures; make them enforceable |
| 5 | **Assign Stakeholder Accountability** | DO | Assign control owners (and operators) across business units |
| 6 | **Prioritize Capabilities According to Risk** | DO | Risk-based roadmap; finite resources require prioritization |
| 7 | **Maintain Situational Awareness** | CHECK | Metrics, analytics, audits, threat/vulnerability feeds |
| 8 | **Manage Risk** | ACT | ERM/CDPRM/TPRM — treat, accept, transfer, or avoid risk |
| 9 | **Evolve Processes** | ACT | PDCA loop — adapt to compliance landscape, tech, and budget changes |

> **Note:** Principle 2 establishes the LCS. As conditions change, the LCS is updated in Principle 9.

---

## Nested Risk Management

Three nested layers of risk management (like Russian nesting dolls):

```
ERM (Enterprise Risk Management)
  └── CDPRM (Cybersecurity & Data Protection Risk Management)
        └── TPRM (Third-Party Risk Management / C-SCRM)
```

Each layer is subordinate to the one above it. Risk profile has three components:
- **Risk Appetite** → broad management statement ("we have a moderate risk appetite")
- **Risk Tolerance** → objective, graduated criteria for categorizing risk levels
- **Risk Thresholds** → entity-specific triggers for required management action

---

## Materiality

Materiality is an executive determination, not a cybersecurity determination. A control/risk/threat/incident is material if it could cause financial impact at:
- ≥ 5% of pre-tax earnings
- ≥ 0.5% of total assets
- ≥ 0.5% of total revenue
- ≥ 1% of total equity

Material controls get elevated maturity expectations, increased oversight, and priority remediation funding.

---

## The 33 Due Diligence Domain Areas (Section 11)

See `references/domains.md` for the full list with SCF control mappings. Domains include:
Cybersecurity Governance, AI & Autonomous Technologies, Asset Management, Business Continuity & Disaster Recovery, Capacity & Performance, Change Management, Cloud Security, Compliance, Configuration Management, Continuous Monitoring, Cryptographic Protections, Data Classification & Handling, Embedded Technology, Endpoint Security, Human Resources Security, Identification & Authentication, Incident Response, Information Assurance, Maintenance, Mobile Device Management, Network Security, Physical & Environmental Security, Data Privacy, Project & Resource Management, Risk Management, Secure Engineering & Architecture, Security Operations, Security Awareness & Training, Technology Development & Acquisition, Third-Party Management, Threat Management, Vulnerability & Patch Management, Web Security.

---

## Due Care Activities (Section 12)

After due diligence builds capabilities, due care governs them:

1. **Ability to Demonstrate Conformity** (CPL-01.3) — prove compliance capability exists
2. **Non-Compliance Oversight** (CPL-01.1) — document and remediate non-compliance instances
3. **Monitor Controls** (GOV-15.5) — ongoing monitoring for threats, risks, and control effectiveness
4. **Periodic Audits** (CPL-02.2) — formal audit cycle
5. **Third-Party Scope Review** (TPM-05.5) — validate RASCI matrix stays current
6. **Review of Third-Party Services** (TPM-08) — assess ESPs for contract compliance
7. **KPIs and KRIs** (GOV-05.1/.2) — performance and risk indicator reporting to leadership
8. **Incident Response Testing** (IRO-06) — test and exercise IRP capabilities
9. **Contingency Plan Testing** (BCD-04) — validate BC/DR plans
10. **Commitment to Continual Improvement** (GOV-01.3) — commit staffing, budget, processes
11. **Status Reporting to Governing Body** (GOV-01.2) — board-level reporting on material matters
12. **Quality Management System** (GOV-18) — QMS governance for compliance conformity

---

## Responding to Common Query Types

### "How do we build/structure our security program?"
Walk through the 9 SCRMS Principles in order. Start with Principle 1 (Establish Context) — understand statutory/regulatory/contractual obligations first, then build the LCS (Principle 2).

### "What controls do we need for [regulation/framework]?"
Map the regulation to MCR. The entity's LCS should include all MCR, plus DSR based on its risk appetite. Reference `references/domains.md` for domain-level control requirements and SCF mappings.

### "Are we compliant with [HIPAA / GDPR / NIST CSF / PCI DSS / ISO 27001]?"
These are MCR sources. Compliance = demonstrating conformity with the entity's applicable MCR. Run through Section 12 Due Care Activities to assess the "demonstrate conformity" capability. Also see `references/domains.md`.

### "How do we prepare for an audit?"
Focus on defensible evidence (see `references/defensible-evidence.md`). Evidence must be irrefutable — authentic, integrity-preserved, and capable of withstanding legal challenge.

### "How does a CISO protect themselves legally?"
See `references/defensible-evidence.md` (Annex 4 content) — Formal cybersecurity strategy, documented risk assessments, formal risk register, incidents tracking, third-party assessments, documented decisions, risk reporting to leadership, formal risk acceptance, evidence of professional competence.

### "What is the difference between a risk and a threat?"
- **Risk** = existence of or deficiency with a control → entity may be exposed to harm
- **Threat** = affects control execution (ability of the control to function as intended) → entity may be exposed to a threat
- Risks and threats map to controls; that's what makes controls the nexus of the SCRMS.

### "How do we manage third-party / supply chain risk?"
TPRM is nested under CDPRM, which is nested under ERM. See Section 11.30 in `references/domains.md`. Key activities: third-party inventories, criticality assessments, SCRM plans, contract requirements, RASCI matrix, break clauses.

---

## Recommended Slash Commands / Scripts

These can be added to a Cowork plugin to help users work with SCRMS:

### `/scrms-assess`
**Purpose:** Run an SCRMS gap assessment for an entity.
**What it does:** Ask the user a structured set of questions across the 9 Principles and key domain areas, then produce a gap analysis report identifying which SCRMS activities are in place, partially in place, or missing. Produces a prioritized remediation roadmap tied to the entity's MCR obligations.

**Prompt to Claude:** "Using the SCRMS framework, conduct a gap assessment for the entity. Ask about: (1) applicable laws/regulations/contracts (MCR), (2) internal risk appetite and discretionary requirements (DSR), (3) which of the 9 SCRMS Principles have been addressed, (4) which of the 33 domain areas have implemented controls, and (5) whether defensible evidence exists. Then produce a gap analysis report with a prioritized roadmap."

### `/scrms-roadmap`
**Purpose:** Generate a tiered, prioritized cybersecurity program roadmap.
**What it does:** Based on the entity's MCR obligations, risk profile, and current maturity, produce a 3-tier roadmap (Strategic/Operational/Tactical) with prioritized capability objectives.

**Prompt to Claude:** "Using SCRMS Principle 6 and the Prioritized Roadmap Concept (Section 9.2), create a tiered cybersecurity roadmap for the entity. Tier 1 (Strategic) = organization-level mission and governance objectives. Tier 2 (Operational) = business process objectives. Tier 3 (Tactical) = TAASD-level implementation objectives. Prioritize by risk and link to MCR/DSR obligations."

### `/scrms-lcs`
**Purpose:** Help define or review a Living Control Set (LCS).
**What it does:** Guide the user through determining their MCR (from applicable statutes, regulations, and contracts) and DSR (from risk appetite, BoD guidance, and internal audit findings), then document the resulting LCS. Flag material controls.

**Prompt to Claude:** "Walk the user through building a Living Control Set (LCS) per SCRMS Section 7. Ask about: (1) applicable statutory obligations (e.g., HIPAA, FISMA, GDPR), (2) regulatory obligations (e.g., DFARS, FedRAMP, NY DFS), (3) contractual obligations (e.g., PCI DSS, ISO 27001, SOC 2), and (4) discretionary requirements from BoD/steering committee/internal audit. Then help document MCR, DSR, and the combined MSR. Identify which controls should be designated as material controls."

### `/scrms-evidence`
**Purpose:** Help plan and organize defensible evidence.
**What it does:** Based on the entity's situation, produce a defensible evidence plan covering the 6 evidence categories from SCRMS Annex 3: Governance, Risk, Security Capability, Compliance, Resilience, and Assurance.

**Prompt to Claude:** "Using SCRMS Annex 3 (Defensible Evidence) and Annex 4 (Planning for Resistance), help the user build a defensible evidence plan. Cover all 6 evidence categories: (1) Governance Evidence, (2) Risk Evidence, (3) Security Capability Evidence, (4) Compliance Evidence, (5) Resilience Evidence, and (6) Assurance Evidence. Also address the 9 CISO-specific defensibility actions from Annex 4 (A4.1-A4.9)."

### `/scrms-domain [domain-name]`
**Purpose:** Deep dive into a specific SCRMS domain.
**What it does:** Provide detailed guidance on a specific domain area — what the requirements are, what SCF controls apply, what evidence is needed to demonstrate conformity, and common gaps.

**Prompt to Claude:** "Using the SCRMS framework, provide detailed guidance on the [domain-name] domain. Cover: (1) what the entity must do (requirements), (2) relevant SCF controls, (3) what evidence is needed to demonstrate conformity, and (4) common gaps entities have in this area."

---

## Reference Files

| File | Contents |
|------|---------|
| `references/domains.md` | All 33 domain areas with SCF control references and key requirements |
| `references/risk-governance.md` | Risk management deep dive (ERM/CDPRM/TPRM, materiality, LCS governance) |
| `references/defensible-evidence.md` | Defensible evidence types (Annex 3) and CISO Planning for Resistance (Annex 4) |
