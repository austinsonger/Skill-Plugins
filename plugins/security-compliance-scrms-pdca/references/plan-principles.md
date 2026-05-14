# PLAN Phase — Principles 1–4

The PLAN phase is where the entire governance program is designed. Skipping or rushing this phase is the single most common reason GRC programs fail — teams end up implementing controls that don't match their obligations, with no documented rationale, at the wrong maturity level.

---

## Principle #1: Establish Context

**Purpose:** Before selecting a single control, understand the forces shaping what your security program must do.

### External Influencers (Compliance Requirements)
These are non-negotiable obligations imposed from outside the organization:
- **Statutory & Regulatory Obligations** — Laws and regulations (HIPAA, GDPR, SOX, CCPA, FISMA, etc.)
- **Contractual Obligations** — Customer/partner contracts, BAAs, DPAs, SLAs
- **Industry-Recognized Practices** — Frameworks like ISO 27001, NIST CSF, CIS Controls, SOC 2

**How to use:** Build a compliance obligation inventory. For each external influencer, document: what it requires, which business units it applies to, and who owns the relationship with that requirement.

### Internal Influencers (Corporate Policies & Management Intent)
These shape what the organization wants to achieve beyond the minimum:
- **Vision / Mission / Strategy** — What the organization is trying to accomplish
- **Business Process** — How work actually gets done (determines what needs protecting)
- **Risk Tolerance** — How much risk leadership is willing to accept
- **Audit Findings** — Prior discoveries that demand remediation

**How to use:** Interview business leaders, review strategic plans, and look at prior audit/assessment reports. Internal influencers explain why some controls may need to exceed the regulatory floor.

### Outputs of Principle #1
- Compliance obligation inventory (external)
- Management intent statement / risk tolerance statement (internal)
- List of in-scope business processes and asset categories (PPTDF)

---

## Principle #2: Identify Applicable Controls

**Purpose:** Determine the specific set of security and privacy controls the organization must implement.

### Control Categories

**MCR (Minimum Compliance Requirements)**
Controls that are mandatory based on external influencers identified in Principle #1. These are non-negotiable — regulators, auditors, or contracts require them. Implementing them is the floor, not the ceiling.

**DSR (Discretionary Security Requirements)**
Controls selected based on organizational risk tolerance and business context. These represent security investments beyond the minimum — driven by internal influencers, threat landscape, and the organization's risk appetite.

### The Secure Controls Framework (SCF)
The SCF is a comprehensive control catalog that can serve as the starting point. It maps controls to hundreds of laws, regulations, and frameworks simultaneously. Rather than building a control set from scratch, organizations can:
1. Identify their regulatory drivers
2. Use SCF mappings to pull the applicable control subset
3. Classify each pulled control as MCR or DSR

### Exception Handling
Not all controls will be implementable immediately. Exception requests for non-compliant controls require:
- Documentation of why the control cannot be implemented
- Compensating controls where possible
- Acceptance of residual risk by an appropriate authority
- A remediation plan with timeline

### Outputs of Principle #2
- Master control list (MCR + DSR)
- Control-to-obligation mapping matrix
- Exception register with compensating controls

---

## Principle #3: Define Maturity Expectations

**Purpose:** Decide how well each control needs to be implemented — not everything needs CMM 5.

### CMM Levels in Practice

| Level | Name | What It Looks Like |
|---|---|---|
| CMM 0 | Not Performed | No control exists. No awareness that one is needed. |
| CMM 1 | Performed Informally | Heroics and tribal knowledge. Works sometimes. Not documented. |
| CMM 2 | Planned & Tracked | Procedure exists. Sometimes followed. Basic tracking in place. |
| CMM 3 | Well-Defined | Consistent process, documented, trained, and followed. Standard operating condition. |
| CMM 4 | Quantitatively Controlled | Metrics-driven. Deviations are detected and measured. Management uses data. |
| CMM 5 | Continuously Improving | Active feedback loop. Lessons learned are incorporated. Proactive adaptation. |

### Setting Target Maturity
- **MCR controls** have a minimum acceptable maturity — typically CMM 2 or CMM 3 depending on the regulation. Check the specific compliance requirement.
- **DSR controls** can be targeted at any level based on risk — higher risk = higher target maturity.
- **Don't default to CMM 5 for everything** — it's expensive and often unnecessary. A well-defended organization can be highly secure at CMM 3 for most controls with CMM 4–5 for high-risk domains.

### Maturity Gap Analysis
Once current and target maturity are defined per control:
- **Gap = 0:** No action needed (maintain)
- **Gap = 1:** Improvement needed (next sprint/quarter)
- **Gap = 2+:** Priority improvement (roadmap item with ownership)

### Outputs of Principle #3
- Control maturity target matrix (current vs. target CMM per control)
- Gap analysis / prioritized improvement backlog
- Maturity improvement roadmap by domain

---

## Principle #4: Publish Governance Documentation

**Purpose:** Codify decisions from Principles 1–3 into formal, communicable documents that create accountability.

### The Document Hierarchy

**Policies** — Management intent, written in business language. Enforced. Violations have consequences. Example: "All sensitive data must be encrypted at rest and in transit."

**Standards** — Specific, measurable requirements that operationalize policies. Tell people exactly what to do. Example: "AES-256 encryption is required for all data classified as Confidential."

**Guidelines** — Recommended (but non-mandatory) practices. Provide flexibility where standards don't prescribe exact method. Example: "Consider using hardware security modules (HSMs) for key management in high-risk environments."

**Control Objectives** — Outcome statements that link policies/standards to the specific controls in your control set. Scoping documents — they define where controls apply (which PPTDF categories, which systems, which business processes).

### What Makes Governance Documentation Fail
- **Policies that aren't enforced** → employees learn to ignore them
- **Standards with no ownership** → no one updates them when technology changes
- **Guidelines mistaken for requirements** → confusion about what's mandatory
- **Missing control objectives** → auditors and control operators disagree on what "implemented" means

### Tool & Resourcing Selection
Once governance documentation is published, technology purchases should be driven by it — not the other way around. A tool selected before standards are written often fails to meet actual requirements. The sequence: Policy → Standard → Control Objective → Tool Selection.

### Outputs of Principle #4
- Policy library (one policy per major domain)
- Standards documents (specific, measurable requirements)
- Guideline library (optional, best-practice recommendations)
- Control objectives mapped to controls and PPTDF scope
