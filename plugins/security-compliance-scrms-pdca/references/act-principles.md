# ACT Phase — Principles 8–9

The ACT phase closes the PDCA loop. It takes what was learned in CHECK and turns it into decisions: how to treat risk, what to fix, and how to evolve the program. Without ACT, the CHECK phase produces reports that sit in drawers.

---

## Principle #8: Manage Risk

**Purpose:** Make deliberate, documented decisions about how to handle the risks identified through metrics, audits, and assessments.

### The Risk Management Flow

```
Risk Analysis → Risk Treatment Decision → Resource Prioritization
     ↑                                           ↓
Deficiencies / Findings ←————————————— Acceptable Risk Tolerance
```

Everything in ACT is constrained by two forces:
- **Acceptable Risk Tolerance** — Set by Corporate Leadership; defines how much residual risk is acceptable after treatment
- **Resource Prioritization** — Available budget, people, and time limit which risks can be addressed and how quickly

### Risk Analysis

Before selecting a treatment, analyze the risk:

| Factor | Questions to Ask |
|---|---|
| **Likelihood** | How probable is this risk materializing? (threat frequency, existing controls, vulnerability exposure) |
| **Impact** | If it happens, what's the consequence? (financial, operational, regulatory, reputational) |
| **Current Controls** | What controls exist? Are they working? (from CHECK phase) |
| **Inherent vs. Residual** | Inherent = risk without any controls. Residual = risk after existing controls. Treatment targets residual. |

Inform risk analysis with both CHECK outputs and external threat intelligence. A deficiency found in an audit has different urgency depending on whether active exploitation of that control gap is occurring in the wild.

### The Four Risk Treatment Options

**Option 1: Reduce Risk**
Implement or improve controls to lower likelihood, impact, or both. This is the most common choice for MCR-related risks — you can't avoid or transfer away from regulatory requirements.

When to choose: When the cost of the control is less than the cost of the risk, and the risk is within the organization's operational footprint to address.

Outputs: Control improvement project, POA&M entry, updated CMM target.

---

**Option 2: Avoid Risk**
Stop doing the activity that creates the risk. This is only possible when the risky activity is optional.

When to choose: When a business process or system creates risk that exceeds its value, and the organization can operate without it.

Example: Discontinuing a legacy system that can no longer be patched rather than accepting the vulnerability exposure.

Caution: Can't avoid risks tied to MCR obligations or core business operations.

---

**Option 3: Transfer Risk**
Shift the financial or operational consequence to a third party.

Methods:
- **Cyber insurance** — Transfers financial impact of breach costs
- **Contractual indemnification** — Third-party vendors accept liability for their failures
- **Managed services / outsourcing** — Shifts operational risk (but not accountability — the organization remains accountable for outcomes even when outsourcing execution)

Important: Transfer reduces financial exposure but does not reduce the likelihood of the risk materializing. A breach still damages your reputation even if insurance covers the cost.

---

**Option 4: Accept Risk**
Formally acknowledge that the risk exists and document the decision to live with it within the organization's risk tolerance.

When to choose: When the cost of treatment exceeds the expected loss, or when the risk is truly within tolerance.

Requirements for valid risk acceptance:
- Written documentation of the risk, its likelihood, and potential impact
- Explicit approval by an authority with appropriate standing (CISO, Risk Committee, Executive)
- Defined review period — acceptance isn't permanent; risks must be re-evaluated periodically
- No MCR violations — you cannot formally "accept" a compliance failure for mandatory controls

### POA&M (Plan of Action & Milestones)

For every non-accepted risk that requires remediation:

| Field | Description |
|---|---|
| **Risk / Finding ID** | Unique identifier |
| **Description** | What the risk or deficiency is |
| **Root Cause** | Why it exists |
| **Control Owner** | Who is accountable for remediation |
| **Treatment Selected** | Reduce / Avoid / Transfer / Accept |
| **Remediation Steps** | What will be done |
| **Target Date** | When it will be resolved |
| **Resource Requirements** | Budget, tools, headcount needed |
| **Status** | Open / In Progress / Resolved / Accepted |
| **Verification Method** | How remediation will be confirmed |

### Linking Risk to Resource Prioritization

Risk treatment decisions compete for limited resources. Prioritize based on:
1. **MCR compliance failures** — Mandatory. Non-negotiable. Fix first.
2. **High residual risk items** — High likelihood × high impact that exceed tolerance.
3. **Quick wins** — Low-cost fixes that address meaningful risk (high ROI).
4. **Long-term investments** — Complex fixes requiring multi-cycle roadmap planning.

---

## Principle #9: Evolve Processes

**Purpose:** Use what was learned in CHECK and ACT to improve the PLAN and DO phases — making the entire PDCA cycle more effective over time.

### The Evolution Decision

At the end of each ACT cycle, the organization faces a decision: **adapt and evolve capabilities**, or maintain the current approach.

This decision is influenced by:
- **Risk analysis results** — Persistent high-risk areas signal that current controls or procedures aren't sufficient
- **Deficiency patterns** — Recurring findings in the same area suggest a structural problem (not just an execution failure)
- **Analytics & Trends** — Degrading KPIs over time suggest the program isn't keeping pace with the threat environment
- **External influencer changes** — New regulations, new contractual requirements, or emerging threat actors may require new controls
- **Internal influencer changes** — Business acquisitions, new products, organizational restructuring can change what needs protecting

### Types of Evolution

**Tactical evolution:** Updating a procedure, adding a step to a process, adjusting a metric threshold. Low disruption, can happen quarterly.

**Structural evolution:** Changing control ownership, revising a policy domain, adopting a new framework mapping. Requires planning cycle. Annual or biannual.

**Strategic evolution:** Fundamental changes to the GRC operating model (e.g., moving from siloed functions to integrated GRC, adopting zero-trust architecture, building a privacy-by-design program). Multi-year horizon.

### The Feedback Loop

Principle #9 feeds back to **Principle #1**. The cycle restarts with an updated understanding of:
- What influencers have changed (new regulations, new risks, new business context)
- What controls need to be added, modified, or retired
- What maturity targets need to be adjusted
- What governance documents need to be updated

A mature SCRMS program treats this cycle as scheduled work — not as a crisis response. Quarterly tactical reviews, annual strategic planning, continuous monitoring in between.

### Signs the Evolve Decision Is Overdue

- The same findings appear in consecutive audit cycles
- The compliance team is constantly in firefighting mode
- The threat landscape has shifted significantly but policies haven't changed in 3+ years
- New business initiatives regularly "surprise" the security team
- Risk register items stay in "open" status for more than 12 months without meaningful progress

---

## Outputs of Principles 8–9

- Risk register (updated, with treatment decisions documented)
- POA&M (active, with owners and target dates)
- Risk treatment rationale documentation
- Formal risk acceptance records (signed by appropriate authority)
- Process evolution decisions (tactical, structural, strategic)
- Updated PLAN inputs for next PDCA cycle
