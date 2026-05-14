# DO Phase — Principles 5–6

The DO phase is where the security program moves from paper to practice. It's the most critical phase for cybersecurity and privacy practitioners because this is where controls are actually implemented across the organization's people, processes, technologies, data, and facilities.

---

## Principle #5: Assign Stakeholder Accountability

**Purpose:** Ensure every control has exactly one accountable owner and clear operators — no orphaned controls, no diffuse accountability.

### The Accountability Model

**Control Owners**
- Are **accountable** — they answer for whether the control exists and is working
- One person or role per control (shared ownership = no ownership)
- Make decisions about how the control is implemented, resourced, and prioritized
- Typically: department heads, system owners, data stewards, process owners
- Not required to perform the control day-to-day, but must verify it works

**Control Operators**
- Are **responsible** — they do the work
- May be a team (e.g., SOC analysts, sysadmin team, HR)
- Receive work assignments from Control Owners
- Execute procedures and control activities
- Report status up to Control Owners

### Why This Distinction Matters
When a control fails, accountability must be clear. If a data breach occurs because patch management wasn't working:
- The **Control Owner** for patch management is accountable — even if they didn't personally apply the patches
- The **Control Operators** (sysadmins) were responsible for execution
- This distinction matters for post-incident analysis, performance management, and remediation ownership

### Common Pitfalls
- **IT owns everything** — Security and privacy controls span the entire organization. Finance, HR, Legal, and Operations all own controls.
- **Security team is both owner and operator** — This creates audit problems and concentration of accountability.
- **No escalation path** — If an operator can't implement a control, they need a clear path to the owner to escalate constraints (resources, technology, conflicting priorities).

### RACI Application
Use RACI (Responsible, Accountable, Consulted, Informed) to map roles to controls:
- **R (Responsible)** → Control Operator
- **A (Accountable)** → Control Owner (only one per control)
- **C (Consulted)** → SMEs who inform decisions (legal, security architect)
- **I (Informed)** → Stakeholders who need to know status (CISO, compliance officer)

### Outputs of Principle #5
- Control Owner / Operator assignment matrix
- RACI by control domain
- Escalation paths for resourcing or exception requests

---

## Principle #6: Prioritize Capabilities According to Risk

**Purpose:** Ensure limited resources are directed toward the controls that matter most — not distributed equally across everything.

### The Prioritization Logic

Not all controls carry equal weight. Prioritization should be driven by:
1. **MCR controls first** — Non-compliance with mandatory requirements creates legal and contractual exposure. These are the floor.
2. **High-risk controls next** — Controls that address the organization's most significant threats (identified through risk analysis from Principle #8 feeding back here).
3. **Maturity gaps on high-priority controls** — A CMM 1 control in a critical area is more urgent than a CMM 2 gap in a low-risk area.

### Tool and Resourcing Selection
Principle #6 directly informs budget and technology decisions:
- Tools should be selected **after** control objectives are defined (Principle #4)
- Tools should address **prioritized gaps**, not be purchased speculatively
- Resourcing (headcount, budget, training) should flow to highest-priority controls

The common failure pattern: purchasing a tool because it's popular, then reverse-engineering which controls it supposedly addresses. This leads to misaligned capabilities and waste.

### PPTDF Scope Application
Controls apply across five categories of assets. Prioritization should consider all five:

| Category | Examples | Common Control Gaps |
|---|---|---|
| **People** | Employees, contractors, vendors | Awareness training, access reviews, background checks |
| **Processes** | Business workflows, IT operations | Change management, incident response, patch management |
| **Technologies** | Systems, networks, applications | Vulnerability management, logging, endpoint protection |
| **Data** | Sensitive records, IP, PII/PHI | Classification, encryption, retention/disposal |
| **Facilities** | Data centers, offices, physical assets | Physical access controls, environmental monitoring |

### Procedures and Control Activities
Once prioritization is clear, operators need procedures — documented step-by-step instructions for how each control is performed. Procedures are the bridge between the control (what must be achieved) and daily operations (how it actually happens).

Good procedures include:
- Trigger (when to execute)
- Steps (what to do)
- Roles (who does each step)
- Evidence (what to capture to prove it happened)
- Escalation criteria (when to involve the owner)

### Outputs of Principle #6
- Prioritized control implementation roadmap
- Tool/technology selection rationale linked to control objectives
- Procedure library (control activities per control)
- PPTDF coverage map showing which asset categories are addressed
