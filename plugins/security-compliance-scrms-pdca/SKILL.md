---
name: scrms-pdca
description: >
  Expert guidance for the Secure, Compliant & Resilient Management System (SCRMS) — a Plan-Do-Check-Act (PDCA) framework for governing cybersecurity and data privacy programs (SCF Council). Use whenever a user needs to build or mature a GRC program, apply the 9 SCRMS principles, distinguish MCR from DSR controls, score control maturity (CMM 0–5), assign control ownership, track KPIs/KRIs/KCIs, perform risk treatment (reduce/avoid/transfer/accept), or publish governance documentation. Trigger on: PDCA, SCRMS, GRC program, security governance, control maturity, CMM level, MCR, DSR, control owners, control operators, risk treatment, KPIs KRIs KCIs, situational awareness, governance documentation, PPTDF, cybersecurity program, plan do check act, SCF controls, compliance program. Also trigger when someone asks "where do I start with security?", "how do I build a compliance program?", "what controls do I need?", or "how do I assign control ownership?" — this skill provides the SCRMS framework answer.
---

# SCRMS-PDCA Skill

## Overview

The **Secure, Compliant & Resilient Management System (SCRMS)** is a structured approach to designing and operating a cybersecurity and data privacy governance program. It applies the **Deming Cycle (Plan-Do-Check-Act)** across **9 principles** to ensure organizations are not just compliant on paper, but actually secure and resilient in practice.

This skill helps you guide users through any of the 9 principles — whether they're building from scratch, assessing maturity, assigning accountability, or managing risk.

---

## The 9 SCRMS Principles by Phase

### PLAN Phase (Principles 1–4)

**Goal:** Define what needs to be done and at what quality bar, before doing it.

| Principle | Name | Core Question |
|---|---|---|
| #1 | Establish Context | What external/internal factors shape our security obligations? |
| #2 | Identify Applicable Controls | Which controls are we required to implement? |
| #3 | Define Maturity Expectations | How well do we need to implement each control? |
| #4 | Publish Governance Documentation | Have we documented and communicated our security expectations? |

### DO Phase (Principles 5–6)

**Goal:** Assign responsibility and actually implement controls across people, processes, and technology.

| Principle | Name | Core Question |
|---|---|---|
| #5 | Assign Stakeholder Accountability | Who owns each control, and who operates it? |
| #6 | Prioritize Capabilities According to Risk | Are we spending effort in the right places? |

### CHECK Phase (Principle 7)

**Goal:** Verify that what was supposed to happen is actually happening.

| Principle | Name | Core Question |
|---|---|---|
| #7 | Maintain Situational Awareness | Do we have visibility into our actual security posture? |

### ACT Phase (Principles 8–9)

**Goal:** Respond to what was found. Address deficiencies, manage risk, and adapt.

| Principle | Name | Core Question |
|---|---|---|
| #8 | Manage Risk | How do we treat risk — reduce, avoid, transfer, or accept? |
| #9 | Evolve Processes | Are we adapting and improving based on what we've learned? |

---

## How to Use This Skill

When a user asks for help:

1. **Identify which phase(s) and principle(s) apply** to their question. Read the relevant reference file for detailed guidance.
2. **Understand their context** before prescribing solutions — ask about their industry, size, regulatory drivers, and current maturity if not already given.
3. **Deliver actionable output** — assessments, roadmaps, governance templates, role assignments, risk treatment plans, or metric frameworks. Don't just explain; produce something useful.
4. **Connect the dots** between phases — the SCRMS is a cycle, not a checklist. A gap in PLAN leads to chaos in DO; weak CHECK means ACT is guesswork.

### Reference Files

Load the relevant reference file when you need depth on a specific phase:

- `references/plan-principles.md` — Principles 1–4: Context, Controls, Maturity, Documentation
- `references/do-principles.md` — Principles 5–6: Accountability, Prioritization, PPTDF
- `references/check-principles.md` — Principle 7: Metrics, Audits, KPIs/KRIs/KCIs
- `references/act-principles.md` — Principles 8–9: Risk treatment, Continuous improvement
- `references/cmm-maturity-model.md` — CMM 0–5 scoring criteria and guidance

---

## Key Concepts (Quick Reference)

### Control Categories
- **MCR (Minimum Compliance Requirements):** Non-negotiable controls driven by law, regulation, or contract. These must be implemented.
- **DSR (Discretionary Security Requirements):** Additional controls selected based on the organization's risk tolerance and business context. These should be implemented where risk justifies it.

### Maturity Levels (CMM)
| Level | Name | Meaning |
|---|---|---|
| CMM 0 | Not Performed | Control does not exist |
| CMM 1 | Performed Informally | Ad hoc, undocumented |
| CMM 2 | Planned & Tracked | Documented but inconsistently applied |
| CMM 3 | Well-Defined | Standardized and consistently followed |
| CMM 4 | Quantitatively Controlled | Measured and data-driven |
| CMM 5 | Continuously Improving | Optimized with feedback loops |

### PPTDF (Scope Model)
Controls apply across five asset categories:
- **P**eople
- **P**rocesses
- **T**echnologies
- **D**ata
- **F**acilities

### Risk Treatment Options
1. **Reduce** — Implement controls to lower likelihood or impact
2. **Avoid** — Stop the activity that creates the risk
3. **Transfer** — Shift risk (insurance, contracts, outsourcing)
4. **Accept** — Document and formally accept residual risk within tolerance

### Governance Document Hierarchy
- **Policies** — Management intent (enforced)
- **Standards** — Specific, measurable requirements
- **Guidelines** — Recommended practices (non-mandatory)
- **Control Objectives** — What outcomes must be achieved

---

## Common Workflows

### "We need to build a GRC program from scratch"
→ Start with PLAN. Read `references/plan-principles.md`. Walk through Principle #1 (gather external + internal influencers), then #2 (identify MCR vs DSR controls), then #3 (set maturity targets), then #4 (draft governance docs).

### "Who should own our security controls?"
→ DO phase, Principle #5. Read `references/do-principles.md`. Distinguish Control Owners (accountable, decisions) from Control Operators (responsible, daily tasks). Build an RACI-style mapping.

### "What metrics should our CISO track?"
→ CHECK phase, Principle #7. Read `references/check-principles.md`. Cover KPIs (performance), KRIs (risk early warning), and KCIs (compliance status). Tie metrics to control objectives.

### "We have findings from an audit — what now?"
→ ACT phase, Principles #8 and #9. Read `references/act-principles.md`. Risk analysis → risk treatment selection → POA&M → process evolution decision.

### "What CMM level should we target?"
→ PLAN phase, Principle #3. Read `references/cmm-maturity-model.md`. Maturity targets should be driven by MCR requirements (floor) + risk tolerance (ceiling). Don't over-engineer CMM 5 everywhere.

---

## Recommended Slash Commands

When packaging this skill, the following slash commands add significant value:

- **`/scrms-assess`** — Generate a control maturity assessment worksheet. Prompts for scope and regulatory drivers, outputs a structured CMM scoring template.
- **`/scrms-roadmap`** — Build a maturity improvement roadmap. Takes current vs. target CMM scores and prioritizes improvement actions by risk.
- **`/scrms-governance`** — Generate a governance documentation template (Policy + Standard + Guideline shell) for a given control domain.
- **`/scrms-raci`** — Generate a Control Owner / Control Operator RACI matrix template for a given set of controls or domains.
- **`/scrms-risk-register`** — Create a risk register structured around SCRMS Principle #8, with risk treatment columns and POA&M linkage.
- **`/scrms-metrics`** — Generate a KPI/KRI/KCI metrics framework template for Principle #7 situational awareness.

---

## Output Quality Standards

When generating deliverables for this skill:

- **Governance docs:** Use the Policy → Standard → Guideline → Control Objective hierarchy. Never flatten these into a single document.
- **Maturity assessments:** Always show current AND target CMM. Gap = action items.
- **Risk registers:** Always include risk treatment selection with rationale. "Accept" requires explicit sign-off language.
- **Accountability matrices:** Always distinguish Owner (accountable, one person) from Operator (responsible, can be team). Shared ownership is a red flag.
- **Metric frameworks:** Every KPI/KRI/KCI should have: metric name, formula/data source, measurement frequency, threshold/target, owner, and link to control objective.
