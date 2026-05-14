# ISO 27001:2022 Audit Evidence & Finding Reference

## Finding Category Decision Tree

Use this when assessing each clause/control:

```
Is ANY evidence provided for this clause?
├── No → Leave blank or mark "Not Reviewed"
└── Yes → Does the evidence satisfy the Control/Clause Requirement?
    ├── Fully → CONFORMITY
    └── Partially or not at all:
        ├── Is a required policy completely absent? → MAJOR NONCONFORMITY
        ├── Is a policy present but key elements missing? → MINOR NONCONFORMITY
        └── Is the policy present and mostly complete but with gaps/improvements? → OBSERVATION
```

## Writing Good Finding Descriptions

### Conformity Example
> "The Access Control Policy (v2.1, approved 2024-03-01) addresses the full life cycle of
> identities including provisioning, modification, and deprovisioning. Access request records
> reviewed confirm the process is being followed."

### Observation Example
> "The Information Security Policy is established and approved. However, the review frequency
> is not explicitly stated in the document. ISO 27001 requires policies to be reviewed at
> planned intervals."

### Minor Nonconformity Example
> "A Third-Party Management Policy exists but does not address the ICT supply chain as
> required by Control 5.21. Supplier agreements reviewed do not include ICT-specific security
> requirements."

### Major Nonconformity Example
> "No formal risk assessment or risk treatment plan has been established or maintained.
> This is a fundamental requirement of Clause 6.1.2 and the absence represents a systematic
> failure of the ISMS planning process."

## Writing Good Improvement Plans

- Be action-oriented: start with a verb (Update, Establish, Document, Implement, Conduct)
- Reference the specific gap identified
- Tie back to the Evidence Recommendation in the template

### Examples
- "Update the Information Security Policy to explicitly state the review frequency (e.g., annually)."
- "Establish a formal risk assessment and risk treatment plan in accordance with Clause 6.1.2."
- "Document ICT supply chain security requirements in the Third-Party Management Policy."
- "Collect and retain evidence of employee security awareness training completion for the past 12 months."

## Common Evidence Gaps by Control Area

| Control Area | Most Common Gap |
|---|---|
| Policies (5.1) | Missing approval signature, version control, or acknowledgment records |
| Access Control (5.15–5.18) | No access review evidence; access requests not documented |
| Incident Response (5.24–5.28) | Policy exists but no incident log or root cause analysis samples |
| Supplier Mgmt (5.19–5.22) | Policy exists but no vendor agreements or periodic review records |
| Risk Management (6.1.2) | Risk register exists but no risk treatment plan or SOA |
| Training (7.3) | No training completion records; awareness acknowledgments not tracked |
| Internal Audit (9.2) | Audit program documented but no audit report produced |
| Management Review (9.3) | Meeting conducted but no minutes/agenda covering all required topics |
| Continuity (5.29–5.30) | Plan exists but no DR test records or tabletop exercise documentation |
| Vulnerability Mgmt (8.8) | Scan reports exist but no remediation tickets for high-severity findings |

## ISO 27001:2022 Clause Coverage Map

### Mandatory Clauses (4–10)
These must ALL be addressed — no exclusions allowed.

| Clause | Topic | Key Artifact |
|---|---|---|
| 4.1 | Context of Organization | Context document, ISMS scope |
| 4.2 | Interested Parties | Interested parties register |
| 4.3 | ISMS Scope | Scope document |
| 4.4 | ISMS | ISMS manual/policy |
| 5.1 | Leadership | Management review records |
| 5.2 | IS Policy | Information Security Policy |
| 5.3 | Roles | ISMS Roles & Responsibilities |
| 6.1.1 | Risks & Opportunities | Risk management plan |
| 6.1.2 | Risk Assessment | Risk register, risk assessment report |
| 6.1.3 | Risk Treatment | Risk treatment plan, SOA |
| 6.2 | IS Objectives | Objectives document |
| 6.3 | Change Planning | Change management policy |
| 7.1 | Resources | HR policy, roles doc |
| 7.2 | Competence | Competence mapping, training records |
| 7.3 | Awareness | Training completion records |
| 7.4 | Communication | Communication plan/policy |
| 7.5.x | Documented Info | Document control policy |
| 8.1 | Operational Planning | ISMS plan, change management |
| 8.2 | Risk Assessment | Risk assessment results |
| 8.3 | Risk Treatment | Risk treatment evidence |
| 9.1 | Performance Evaluation | Metrics, monitoring reports |
| 9.2 | Internal Audit | Audit program, audit report |
| 9.3 | Management Review | MRM minutes, agenda |
| 10.1 | Continual Improvement | Trend analysis |
| 10.2 | Nonconformity | Corrective action plan |

### Annex A Controls (5–8)
These can be excluded if justified in the SOA.
Reference the Evidence Recommendation column in the template for specific artifacts.
