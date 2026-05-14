# CHECK Phase — Principle 7

The CHECK phase is situational awareness. It answers the question: "Is the program we designed and implemented actually working?" Without it, the organization is flying blind — unable to distinguish genuinely secure systems from systems that merely appear compliant on paper.

---

## Principle #7: Maintain Situational Awareness

**Purpose:** Create a continuous, data-driven view of the organization's security and compliance posture so that leadership can make informed decisions.

### The Two Pillars of Situational Awareness

**Security Metrics** → Feed into → **Analytics & Trends (KPIs/KRIs/KCIs)**

**Audits & Assessments** → Generate → **Findings / Reports** → Identify → **Deficiencies**

Both pillars feed Corporate Leadership with the information needed to exercise oversight, make resource decisions, and set acceptable risk tolerance.

---

## Security Metrics

Metrics are the ongoing heartbeat of the program. They verify that controls are operating as designed and flag drift before it becomes a crisis.

### Three Types of Security Metrics

**KPIs — Key Performance Indicators**
Measure how well security processes and controls are performing. Focus on operational effectiveness.

Examples:
- Mean Time to Patch (MTTP) for critical vulnerabilities
- Percentage of systems with current EDR agents
- Employee security training completion rate
- Mean Time to Detect (MTTD) and Respond (MTTR) for incidents
- Percentage of third-party vendors with current assessments

**KRIs — Key Risk Indicators**
Early warning signals that risk levels are rising. Forward-looking — they predict future problems before they materialize.

Examples:
- Number of unpatched critical CVEs older than SLA threshold
- Percentage of privileged accounts without MFA
- Number of systems out of configuration baseline
- Volume of failed authentication attempts (trending up = potential attack)
- Days since last backup validation

**KCIs — Key Control Indicators**
Measure whether specific controls are in place and functioning. Compliance-oriented — they answer "is the control implemented?"

Examples:
- Percentage of data classified according to policy
- Percentage of endpoints meeting hardening standard
- Number of access reviews completed on schedule
- Encryption coverage for data at rest (% of in-scope systems)
- Percentage of critical assets with documented disaster recovery plans

### Metric Design Framework

Every metric should have:
| Field | Description |
|---|---|
| **Name** | Short, descriptive identifier |
| **Type** | KPI / KRI / KCI |
| **Formula / Data Source** | Exactly how it's calculated and where data comes from |
| **Frequency** | How often it's measured (daily, weekly, monthly, quarterly) |
| **Target / Threshold** | What "good" looks like; when to escalate |
| **Owner** | Who is accountable for this metric |
| **Linked Control** | Which control objective this metric verifies |
| **Audience** | Who sees this metric (ops team, CISO, board) |

### Analytics & Trends
Raw metrics become insight when tracked over time. Look for:
- **Trend direction** — Is the metric improving, stable, or degrading?
- **Anomalies** — Sudden spikes or drops that warrant investigation
- **Correlation** — Does a KRI increase predict a KPI degradation shortly after?
- **Seasonality** — Some metrics (e.g., phishing click rates) spike around events

---

## Audits & Assessments

While metrics provide continuous monitoring, audits and assessments provide periodic deep dives.

### Types of Assessments

| Type | Description | Frequency |
|---|---|---|
| **Internal Audit** | Self-assessment by internal team | Annual / semi-annual |
| **External Audit** | Third-party assessment (compliance-driven) | Per regulatory requirement |
| **Penetration Testing** | Active exploitation attempt to find real vulnerabilities | Annual minimum, more for high-risk |
| **Vulnerability Assessment** | Scanning-based identification of technical weaknesses | Continuous / quarterly |
| **Maturity Assessment** | CMM-based scoring across control domains | Annual |
| **Third-Party Assessment** | Evaluating vendor/partner security posture | Per risk tier of vendor |

### From Findings to Deficiencies
Audit findings that represent control failures become **deficiencies**. Deficiencies require:
1. Documentation in a deficiency/findings register
2. Root cause analysis (procedural gap? resource constraint? technology failure?)
3. Assignment to a Control Owner for remediation
4. A POA&M (Plan of Action & Milestones) with target resolution date
5. Verification that remediation was effective (re-assessment)

### Linking CHECK Back to ACT
Deficiencies flow into **Principle #8 (Manage Risk)** — they are inputs to risk analysis and may trigger risk treatment decisions. Analytics and trends also flow to Corporate Leadership, influencing **Principle #1 context** (internal influencers) and **Principle #3 maturity targets** for the next planning cycle.

---

## Corporate Leadership Role in CHECK

Corporate Leadership is the recipient and consumer of CHECK outputs:
- **Receives:** Findings/Reports, Analytics & Trends, Stakeholder Confidence signals
- **Provides:** Oversight capabilities — ability to ask questions, set direction, allocate resources
- **Makes decisions on:** Acceptable risk tolerance, resource prioritization (feeds back to ACT)

A CISO dashboard should give leadership:
1. **At a glance:** Are we getting better or worse? (trend chart)
2. **Current status:** Where are we most exposed right now? (risk heatmap)
3. **Compliance posture:** Are we meeting MCR? (KCI summary)
4. **Upcoming concerns:** What risks are rising? (KRI alerts)

---

## Outputs of Principle #7

- Metric catalog (KPIs, KRIs, KCIs) with owners and thresholds
- Security dashboard (executive and operational views)
- Audit/assessment schedule and results register
- Deficiency/findings register with POA&M linkage
- Regular reporting cadence (board, CISO, department heads)
