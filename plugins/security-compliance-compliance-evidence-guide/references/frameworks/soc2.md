# SOC 2 (AICPA 2017 TSC, revised Points of Focus 2022)

**Authoritative source.** AICPA TSP Section 100 — 2017 Trust Services Criteria for Security, Availability, Processing Integrity, Confidentiality, and Privacy (with revised Points of Focus, 2022).

**Use this for**: SOC 2 Type 1, SOC 2 Type 2, SOC 3, SOC for Cybersecurity.

## Builder metadata block

```json
"framework": {
  "name":        "SOC 2 (AICPA 2017 TSC, revised PoF 2022)",
  "short_name":  "SOC2",
  "scope":       "Trust Services Criteria: Security, Availability, Processing Integrity, Confidentiality, Privacy",
  "id_label":    "Criterion ID",
  "authoritative_source": "AICPA TSP Section 100 (2017 TSC with 2022 revised Points of Focus)"
}
```

No `type_column` (SOC 2 has no Required/Addressable distinction).

## Trust Services Categories (use as XLSX categories and DOCX H2 headings)

| Category name (use verbatim) | Control IDs in this category |
|---|---|
| `Common Criteria (CC)` | CC1.1–CC1.5, CC2.1–CC2.3, CC3.1–CC3.4, CC4.1–CC4.2, CC5.1–CC5.3, CC6.1–CC6.8, CC7.1–CC7.5, CC8.1, CC9.1–CC9.2 |
| `Processing Integrity (PI)` | PI1.1–PI1.5 |
| `Availability (A)` | A1.1–A1.3 |
| `Confidentiality (C)` | C1.1–C1.2 |
| `Privacy (P)` | P1.1, P2.1, P3.1, P3.2, P4.1–P4.3, P5.1–P5.2, P6.1–P6.7, P7.1, P8.1 |

## Full criterion inventory (use these exact IDs and short names)

### Common Criteria — Control Environment (CC1)
- CC1.1 — Commitment to integrity and ethical values
- CC1.2 — Board independence and oversight
- CC1.3 — Structures, reporting lines, authorities, responsibilities
- CC1.4 — Attract, develop, retain competent individuals
- CC1.5 — Hold individuals accountable for internal control responsibilities

### Common Criteria — Communication and Information (CC2)
- CC2.1 — Obtain or generate relevant, quality information
- CC2.2 — Internal communication of objectives and responsibilities
- CC2.3 — External communication

### Common Criteria — Risk Assessment (CC3)
- CC3.1 — Specify objectives clearly
- CC3.2 — Identify and analyze risks
- CC3.3 — Consider potential for fraud
- CC3.4 — Identify and assess changes

### Common Criteria — Monitoring Activities (CC4)
- CC4.1 — Ongoing and/or separate evaluations
- CC4.2 — Evaluate and communicate deficiencies

### Common Criteria — Control Activities (CC5)
- CC5.1 — Select and develop control activities
- CC5.2 — General control activities over technology
- CC5.3 — Deploy through policies and procedures

### Common Criteria — Logical and Physical Access (CC6)
- CC6.1 — Logical access security software and architecture
- CC6.2 — Register/authorize new users; remove access on termination
- CC6.3 — Modify access based on roles, least privilege, segregation of duties
- CC6.4 — Restrict physical access to facilities
- CC6.5 — Discontinue physical protections after data destruction
- CC6.6 — Protect against threats from outside system boundaries
- CC6.7 — Restrict transmission, movement, removal of information
- CC6.8 — Prevent/detect unauthorized or malicious software

### Common Criteria — System Operations (CC7)
- CC7.1 — Detection and monitoring procedures for config changes and vulnerabilities
- CC7.2 — Monitor system components for anomalies
- CC7.3 — Evaluate security events
- CC7.4 — Respond to identified security incidents
- CC7.5 — Recover from security incidents

### Common Criteria — Change Management (CC8)
- CC8.1 — Authorize, design, test, approve, implement changes

### Common Criteria — Risk Mitigation (CC9)
- CC9.1 — Risk mitigation for business disruptions
- CC9.2 — Vendor and business partner risks

### Processing Integrity (PI1)
- PI1.1 — Objectives related to processing
- PI1.2 — Controls over system inputs
- PI1.3 — Controls over system processing
- PI1.4 — Controls over output delivery
- PI1.5 — Controls over storage

### Availability (A1)
- A1.1 — Manage capacity demand
- A1.2 — Environmental protections, backup, recovery infrastructure
- A1.3 — Test recovery plan procedures

### Confidentiality (C1)
- C1.1 — Identify and maintain confidential information
- C1.2 — Dispose of confidential information

### Privacy (P series)
- P1.1 — Provide notice to data subjects about privacy practices
- P2.1 — Communicate choices and obtain consent
- P3.1 — Personal information collected consistent with objectives
- P3.2 — Explicit consent for sensitive information
- P4.1 — Limit use of personal information to identified purposes
- P4.2 — Retain personal information consistent with objectives
- P4.3 — Securely dispose of personal information
- P5.1 — Grant data subjects access to their personal information
- P5.2 — Correct, amend, append; notify third parties
- P6.1 — Disclose to third parties with consent
- P6.2 — Record authorized disclosures
- P6.3 — Record unauthorized disclosures (breaches)
- P6.4 — Obtain privacy commitments from vendors
- P6.5 — Vendor breach-notification commitments
- P6.6 — Notify affected data subjects, regulators of breaches
- P6.7 — Accounting of disclosures upon request
- P7.1 — Maintain accurate, complete personal information
- P8.1 — Process inquiries, complaints, disputes

## Citation text source

Pull each criterion's full text verbatim from AICPA TSP Section 100. Do not paraphrase.

## Standard inherited citations (most CSPs)

These are routinely satisfied by the CSP's own SOC 2 Type II report and should appear in the Inherited tab:
- CC6.4 — Physical access to data centers
- CC6.5 — Asset disposal at the data center level
- CC9.2 — Subservice organization (the CSP itself) commitments
- P6.4 — Privacy commitments from the CSP as a processor

## Typical extra_xlsx_tabs

None required for SOC 2 — the Inherited tab and Legend & Summary are sufficient.

## Evidence sourcing principles (use as a starting point)

- Authoritative source. Pull from the service that owns the control (audit logs for API auditability, configuration services for state, IAM for entitlements). Avoid screenshots when an export or API call returns the same data.
- Timestamped and immutable. Send logs to an immutable destination (Object Lock / locked retention policy). Auditors discount evidence the customer could have altered.
- Population complete. Cover every account, region, and project in the audit boundary — not only the primary one tested.
- Tied to a control owner. Every artifact maps to one named owner in the XLSX.
- Frequency-aligned. SOC 2 Type 2 evaluates operating effectiveness across the audit period. Annual screenshots are not enough — use continuous detective controls.

## Typical evidence retention bullets

- Retain audit logs for the full audit period plus one year, in an immutable store.
- Capture identity and access reports (credential reports, access reviews) quarterly.
- Export findings (Security Hub / Defender for Cloud / Security Command Center) monthly.
- Run DR / backup restore tests at least annually.
- Maintain an evidence index (the XLSX matrix) with each artifact, date, owner, and location.
