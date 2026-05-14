# SOC 2 Audit Evidence & Finding Reference

## Finding Decision Tree

Use this when assessing each control:

```
Is ANY evidence provided for this control?
├── No → Leave blank or mark "Not Reviewed" in Notes
└── Yes → Does the evidence satisfy both Design and Operating Effectiveness?
    ├── Both → PASS (Risk Rating: n/a)
    └── One or neither:
        ├── Is the control completely absent (no policy, no process, no evidence)? → FAIL / Critical
        ├── Is the control designed but never executed? → FAIL / High
        ├── Is the control executed but with significant exceptions? → FAIL / High or Medium
        └── Is the control mostly effective with minor gaps? → PASS with Notes, or FAIL / Low
```

## Writing Good Exception Details

### Pass Example (no exceptions)
> "The Access Control Policy (v3.0, approved 2024-06-15) requires MFA for all
> remote access. Evidence reviewed includes Okta MFA enforcement configuration
> export and 25 sampled login events — all show MFA completion. Control is
> operating effectively."

### Fail — Low Risk Example
> "The Change Management Policy exists and is followed, but version history
> shows the policy itself has not been reviewed within the past 12 months as
> required by CC 5.3.5. All other change management controls are operating
> effectively."

### Fail — Medium Risk Example
> "Access reviews are performed quarterly per policy (CC 6.2.2), but the Q2
> review was completed 3 weeks late. 2 of 10 sampled reviews showed access
> changes were not implemented within the 5-day SLA. No unauthorized access
> was identified, but the timeliness gap represents a control weakness."

### Fail — High Risk Example
> "Vulnerability scans are required monthly per policy (CC 7.1.4), but only
> 3 scan reports were available for the 12-month audit period. Of the scans
> reviewed, 12 high-severity findings remained unpatched beyond the 30-day
> remediation window. No evidence of risk acceptance or exception approval."

### Fail — Critical Risk Example
> "No formal incident response plan or procedures exist (CC 7.3.0, CC 7.4.0).
> The organization confirmed that no incident response testing has been
> conducted. This represents a complete absence of required controls for
> security incident management."

## Writing Good Gap Closure Guidance

- Be action-oriented: start with a verb (Implement, Document, Establish, Configure, Conduct)
- Reference the specific control ID and Point of Focus
- Tie back to what evidence the auditor would need to see
- Suggest a realistic timeline based on complexity

### Examples
- "Implement MFA for all administrative and remote access. Configure in identity provider and export enforcement evidence quarterly."
- "Establish a formal quarterly access review process. Document reviewer, date, findings, and remediation actions for each review cycle."
- "Conduct monthly vulnerability scans using an approved scanning tool. Track all high/critical findings to remediation in a ticketing system with SLA targets."
- "Develop and document an Incident Response Plan covering detection, containment, eradication, recovery, and lessons learned. Conduct tabletop exercises annually."

## Common Evidence Gaps by Control Area

| Control Area | Control IDs | Most Common Gap |
|---|---|---|
| Control Environment | CC1.1–CC1.5 | Code of conduct exists but no signed acknowledgments; no board oversight evidence |
| Communication | CC2.1–CC2.3 | Security awareness training exists but no completion records or testing |
| Risk Assessment | CC3.1–CC3.4 | Risk register exists but not updated in past 12 months; no formal risk assessment methodology |
| Monitoring | CC4.1–CC4.2 | No evidence of ongoing monitoring or separate evaluations of controls |
| Control Activities | CC5.1–CC5.3 | Policies exist but no evidence of periodic review; segregation of duties not documented |
| Logical Access | CC6.1–CC6.3 | No MFA evidence; access reviews not performed or documented; no provisioning/deprovisioning tickets |
| Physical Access | CC6.4 | Reliance on cloud provider without SOC report; no visitor logs or badge access reviews |
| Data Disposal | CC6.5 | No media sanitization policy or certificate of destruction |
| Boundary Protection | CC6.6 | Firewall rules exist but no periodic review evidence; no IDS/IPS alerts reviewed |
| Data Transmission | CC6.7 | Encryption in transit confirmed but no DLP controls; removable media policy missing |
| Malware Prevention | CC6.8 | Antivirus deployed but no centralized management dashboard evidence; no software installation restrictions |
| Vulnerability Mgmt | CC7.1 | Scans performed but no remediation tracking; configuration baselines not documented |
| Monitoring & Detection | CC7.2 | SIEM deployed but no evidence of alert triage or tuning; no log review procedures |
| Incident Evaluation | CC7.3 | Incident classification exists but no actual incident reports as evidence |
| Incident Response | CC7.4 | IRP exists but never tested; no communication protocols for breach notification |
| Recovery | CC7.5 | DR plan exists but no test results; no root cause analysis evidence |
| Change Management | CC8.1 | Changes tracked but no evidence of testing, approval, or separation of environments |
| Business Continuity | CC9.1 | BCP exists but no BIA; no evidence of plan testing or insurance review |
| Vendor Management | CC9.2 | Vendor list exists but no risk assessments; no SOC reports collected; no periodic review |
| Availability | A1.1–A1.3 | Capacity monitoring in place but no documented thresholds; backups running but no restore tests |
| Confidentiality | C1.1–C1.2 | Data classification policy exists but no evidence of classification applied to systems/data |
| Processing Integrity | PI1.1–PI1.5 | Input validation documented but no reconciliation evidence; no error correction tracking |
| Privacy | P1.1–P8.1 | Privacy notice exists but no consent records; DSAR procedure exists but no evidence of execution |

## Control-to-Document Quick Reference (Summary)

Use this to quickly identify which policies/evidence are expected for each control area:

| Control Area | Control IDs | Expected Documents & Evidence |
|---|---|---|
| Control Environment | CC1.1–CC1.5 | Code of Conduct, Ethics Policy, Org Chart, Job Descriptions, Background Check Policy, HR Policy, Board Meeting Minutes |
| Information & Communication | CC2.1–CC2.3 | Security Awareness Training Materials, Training Completion Records, Communication Policy, Whistleblower Policy, System Description Document |
| Risk Assessment | CC3.1–CC3.4 | Risk Assessment Methodology, Risk Register, Risk Treatment Plan, Fraud Risk Assessment |
| Monitoring | CC4.1–CC4.2 | Internal Audit Program, Monitoring Reports, Deficiency Tracking, Pen Test Reports |
| Control Activities | CC5.1–CC5.3 | All Security Policies, SoD Matrix, Control Catalog, Policy Review Schedule |
| Logical Access | CC6.1 | Access Control Policy, Network Diagrams, Encryption Policy, IAM Configuration, MFA Evidence, Asset Inventory |
| User Access Mgmt | CC6.2–CC6.3 | Access Request Tickets, Access Review Reports, Termination Checklists, RBAC Documentation |
| Physical Access | CC6.4 | Physical Security Policy, Badge Access Logs, Data Center SOC Reports, Visitor Logs |
| Asset Disposal | CC6.5 | Data Disposal Policy, Certificates of Destruction, Sanitization Records |
| Boundary Protection | CC6.6 | Firewall Configuration, IDS/IPS Reports, VPN Configuration, Network Segmentation Docs |
| Data Transmission | CC6.7 | Encryption Standards, DLP Configuration, Removable Media Policy, TLS Certificates |
| Malware Prevention | CC6.8 | Endpoint Protection Config, AV Dashboard, Software Restriction Policies, Change Control Records |
| Vulnerability & Config | CC7.1 | Configuration Baselines, Vulnerability Scan Reports, Patch Management Policy, FIM Evidence |
| Monitoring & Detection | CC7.2 | SIEM Configuration, Alert Rules, Log Review Procedures, SOC Dashboard |
| Incident Evaluation | CC7.3 | Incident Classification Matrix, Incident Log, Triage Procedures |
| Incident Response | CC7.4 | Incident Response Plan, Tabletop Exercise Records, Communication Templates, Post-Incident Reviews |
| Recovery | CC7.5 | Disaster Recovery Plan, DR Test Results, Root Cause Analysis Reports, Lessons Learned |
| Change Management | CC8.1 | Change Management Policy, Change Tickets (Jira/ServiceNow), Release Notes, Test Evidence, Approval Records, Baseline Configs |
| Business Continuity | CC9.1 | Business Continuity Plan, Business Impact Analysis, Insurance Certificates |
| Vendor Management | CC9.2 | Vendor Management Policy, Vendor Risk Assessments, Vendor SOC Reports, Contracts/SLAs, NDA/Confidentiality Agreements |
| Availability | A1.1–A1.3 | Capacity Monitoring Dashboards, Backup Logs, Restore Test Results, BCP Test Reports, Environmental Monitoring |
| Confidentiality | C1.1–C1.2 | Data Classification Policy, Retention Schedule, Data Disposal Procedures, DLP Reports |
| Processing Integrity | PI1.1–PI1.5 | Input Validation Procedures, Processing Controls Documentation, Reconciliation Procedures, Error Handling Procedures |
| Privacy | P1.1–P8.1 | Privacy Notice, Privacy Policy, Consent Management Procedure, Data Collection Policy, Data Retention & Disposal Policy, DSAR Procedure, Data Sharing Policy, Data Quality Procedures, Privacy Compliance Reports |

---

## Documents by Control ID

This is the detailed per-control mapping used to populate the **Documents** column in
the audit tracker. Each control ID lists the policies, procedures, and plans that
fulfill or address it. A document can (and usually does) appear under multiple controls.

When the user uploads a document, find all control IDs it maps to here, and populate
the Documents column for each of those rows.

### CC1.x — Control Environment

| Control ID | Documents |
|---|---|
| CC1.1 | Code of Conduct; Ethics Policy; Board Charter; Management Directives; Standards of Conduct Policy; Vendor Code of Conduct; Performance Management Policy; Disciplinary Action Procedure |
| CC1.2 | Board Charter; Board Meeting Minutes; Audit Committee Charter; Board Independence Policy |
| CC1.3 | Organizational Chart; RACI Matrix; Reporting Lines Documentation; Segregation of Duties Policy; Roles & Responsibilities Document; Information Security Policy |
| CC1.4 | HR Policy; Competency Framework; Job Descriptions; Performance Review Procedure; Training & Development Policy; Succession Plan; Background Check Policy; Pre-Employment Screening Procedure; Continuing Education Policy; Training Records |
| CC1.5 | Performance Management Policy; Incentive & Compensation Plan; Disciplinary Action Procedure; Management Review Records |

### CC2.x — Communication & Information

| Control ID | Documents |
|---|---|
| CC2.1 | Information Management Policy; Data Quality Procedure; System Architecture Documentation |
| CC2.2 | Internal Communication Policy; Management Review Records; Board Reporting Procedure; Whistleblower Policy; Ethics Hotline Procedure; Roles & Responsibilities Document; System Operations Manual; Incident Reporting Procedure; Security Awareness Training Program; Training Materials; Training Completion Records; System Description Document; Change Communication Procedure |
| CC2.3 | External Communication Policy; Investor Relations Policy; Regulatory Reporting Procedure; Board Reporting Procedure; Whistleblower Policy; Ethics Hotline Procedure; Confidentiality Policy; NDA Templates; Privacy Policy; Privacy Notice; System Description Document; External User Guide; Incident Notification Procedure |

### CC3.x — Risk Assessment

| Control ID | Documents |
|---|---|
| CC3.1 | Strategic Plan; Risk Appetite Statement; Financial Reporting Objectives; Accounting Standards Documentation; External Reporting Policy; Financial Reporting Procedure; Compliance Policy; Internal Reporting Policy; Management Reporting Procedure; Legal & Regulatory Register; Information Security Objectives; Security Program Charter |
| CC3.2 | Risk Assessment Methodology; Risk Register; Risk Treatment Plan; Asset Inventory; Asset Classification Policy; Threat Assessment Report; Vulnerability Assessment Report; Third-Party Risk Assessment Procedure; Vendor Risk Register; Risk Scoring Matrix |
| CC3.3 | Fraud Risk Assessment; Anti-Fraud Policy; IT Risk Assessment |
| CC3.4 | Change Risk Assessment Procedure; Risk Register; Environmental Scan Report; Vendor Change Assessment Procedure |

### CC4.x — Monitoring Activities

| Control ID | Documents |
|---|---|
| CC4.1 | Internal Audit Program; Monitoring & Evaluation Procedure; Control Self-Assessment Records; Penetration Test Reports; ISO Certification Records; Internal Audit Reports |
| CC4.2 | Deficiency Tracking Log; Corrective Action Procedure; Management Review Records; POA&M Register |

### CC5.x — Control Activities

| Control ID | Documents |
|---|---|
| CC5.1 | Risk Treatment Plan; Control Catalog; Information Security Policy; Segregation of Duties Policy; SoD Matrix; Access Control Policy |
| CC5.2 | IT General Controls Documentation; Technology Risk Assessment; Infrastructure Management Policy; IT Operations Procedure; Access Control Policy; Security Management Procedure; Identity & Access Management Policy; Secure Development Policy; System Acquisition Procedure; SDLC Documentation |
| CC5.3 | All Security Policies (master list); Policy Management Procedure; Roles & Responsibilities Document; Corrective Action Procedure; Exception Management Procedure; Policy Review Schedule |

### CC6.x — Logical & Physical Access Controls

| Control ID | Documents |
|---|---|
| CC6.1 | Asset Inventory; Asset Classification Policy; Data Classification Policy; Access Control Policy; Least Privilege Procedure; IAM Configuration Standards; Authentication Policy; MFA Policy; Identity & Access Management Procedure; Network Segmentation Policy; Network Architecture Diagram; Network Access Control Policy; Data Flow Diagrams; API Management Policy; Port Management Procedure; Credential Management Procedure; Service Account Policy; Encryption Policy; Data-at-Rest Encryption Standards; Encryption Key Management Policy; Key Management Procedure |
| CC6.2 | Access Provisioning Procedure; Access Request Form/Workflow; Access Deprovisioning Procedure; Termination Checklist; Offboarding Procedure; User Access Review Procedure; Access Review Reports |
| CC6.3 | Access Provisioning Procedure; Access Modification Procedure; Access Deprovisioning Procedure; Offboarding Procedure; Role-Based Access Control Documentation; SoD Matrix; RBAC Policy |
| CC6.4 | Physical Security Policy; Badge Access Procedure; Data Center Access Procedure; Physical Access Deprovisioning Procedure; Termination Checklist; Physical Access Review Procedure; Physical Access Review Reports |
| CC6.5 | Data Disposal Policy; Media Sanitization Procedure; Certificate of Destruction Template |
| CC6.6 | Network Security Policy; Firewall Management Policy; Access Control Policy; Remote Access Policy; Multi-Factor Authentication Policy; VPN Policy; IDS/IPS Policy; DMZ Architecture Documentation |
| CC6.7 | Data Loss Prevention Policy; Data Handling Procedure; Encryption Policy; Encryption-in-Transit Standards; TLS Configuration Standards; Removable Media Policy; Mobile Device Management Policy; BYOD Policy |
| CC6.8 | Software Installation Policy; Application Whitelisting Procedure; File Integrity Monitoring Procedure; Configuration Management Policy; Change Management Policy; Software Deployment Procedure; Endpoint Protection Policy; Anti-Malware Management Procedure; Asset Return Procedure; Malware Scanning Procedure |

### CC7.x — System Operations

| Control ID | Documents |
|---|---|
| CC7.1 | Configuration Management Policy; Hardening Standards; Baseline Configuration Documents; Infrastructure Monitoring Procedure; Compliance Monitoring Policy; File Integrity Monitoring Procedure; Change Detection Policy; Asset Discovery Procedure; Vulnerability Management Policy; Patch Management Policy; Vulnerability Scanning Procedure |
| CC7.2 | Security Monitoring Policy; SIEM Operations Procedure; Log Management Policy; Threat Detection Procedure; Use Case Documentation; Alert Triage Procedure; Log Analysis Procedure; Detection Tool Monitoring Procedure; SOC Operations Manual |
| CC7.3 | Incident Response Plan; Incident Response Procedure; Incident Communication Procedure; Incident Escalation Procedure; Incident Analysis Procedure; Forensics Procedure; Privacy Incident Response Procedure; Data Breach Notification Procedure |
| CC7.4 | Incident Response Plan; Incident Response Team Charter; Roles & Responsibilities Document; Incident Containment Procedure; Incident Mitigation Procedure; Disaster Recovery Plan; Business Continuity Plan; Incident Recovery Procedure; Incident Communication Plan; Breach Notification Procedure; Stakeholder Communication Templates; Vulnerability Remediation Procedure; Lessons Learned Procedure; Post-Incident Review Template; Privacy Incident Response Procedure; Disciplinary Action Procedure |
| CC7.5 | Disaster Recovery Plan; System Recovery Procedure; Incident Communication Plan; Post-Incident Communication Procedure; Root Cause Analysis Procedure; Post-Incident Review Template; Corrective Action Procedure; Control Improvement Plan; Lessons Learned Procedure; Disaster Recovery Test Plan; BCP/DR Test Procedure |

### CC8.x — Change Management

| Control ID | Documents |
|---|---|
| CC8.1 | Change Management Policy; SDLC Policy; Change Authorization Procedure; Change Request Form/Workflow; Secure Development Policy; Design Review Procedure; Change Documentation Procedure; Release Notes Standards; Change Tracking Procedure; Configuration Management Policy; Software Configuration Procedure; Testing Policy; QA Procedure; Test Plan Template; Change Approval Procedure; CAB Charter; Deployment Procedure; Release Management Procedure; Change Impact Assessment Procedure; Emergency Change Procedure; Emergency Access Procedure; Baseline Configuration Standards; Confidentiality Policy; Data Handling Procedure; Privacy Policy; Privacy-by-Design Procedure; Data Protection Impact Assessment |

### CC9.x — Risk Mitigation & Vendor Management

| Control ID | Documents |
|---|---|
| CC9.1 | Business Continuity Plan; Disaster Recovery Plan; Crisis Communication Plan; Insurance Policy Review; Risk Transfer Policy |
| CC9.2 | Vendor Management Policy; Vendor Onboarding Procedure; SLA Templates; Third-Party Risk Assessment Procedure; Vendor Risk Register; Vendor Management RACI; Third-Party Risk Management Policy; Vendor Communication Procedure; Vendor Escalation Procedure; Vendor Exception Handling Procedure; Vendor Performance Review Procedure; Vendor Scorecard Template; Vendor Remediation Procedure; Vendor Termination Procedure; Vendor Offboarding Checklist; NDA Template; Confidentiality Agreement; Vendor Compliance Assessment Procedure; Vendor Audit Procedure; Privacy Addendum Template; Data Processing Agreement; Vendor Privacy Assessment Procedure |

### A1.x — Availability

| Control ID | Documents |
|---|---|
| A1.1 | Capacity Management Policy; Capacity Planning Procedure; Infrastructure Monitoring Procedure |
| A1.2 | Environmental Protection Policy; Environmental Monitoring Procedure; Facility Management Procedure; Backup Policy; Backup Procedure; Offsite Storage Procedure; Disaster Recovery Plan; Alternate Processing Procedure; Failover Procedure |
| A1.3 | Business Continuity Test Plan; BCP/DR Test Procedure; Backup Integrity Verification Procedure; Restore Test Procedure |

### C1.x — Confidentiality

| Control ID | Documents |
|---|---|
| C1.1 | Data Classification Policy; Confidential Information Handling Procedure; Data Retention Policy |
| C1.2 | Data Retention & Disposal Policy; Data Destruction Procedure; Certificate of Destruction Template |

### PI 1.x — Processing Integrity

| Control ID | Documents |
|---|---|
| PI1.1 | Input Validation Procedures; Data Quality Policy; Processing Controls Documentation |
| PI1.2 | Processing Validation Procedures; System Operations Manual; Error Handling Procedures |
| PI1.3 | Output Review Procedures; Reconciliation Procedures; Data Quality Reports |
| PI1.4 | Error Correction Procedures; Exception Handling Policy; Incident Management Procedure |
| PI1.5 | Output Distribution Procedures; Data Delivery SLAs; Customer Communication Procedures |

### P 1.x–P 8.x — Privacy

| Control ID | Documents |
|---|---|
| P1.0–P1.1 | Privacy Notice; Privacy Policy; Website Privacy Statement; Cookie Policy |
| P2.0–P2.1 | Consent Management Procedure; Opt-In/Opt-Out Procedures; Cookie Consent Records; Privacy Preference Center Documentation |
| P3.0–P3.2 | Data Collection Policy; Data Minimization Procedure; Consent Records; Privacy Impact Assessment |
| P4.0–P4.3 | Data Use Policy; Data Retention & Disposal Policy; Retention Schedule; Data Disposal Procedures; Certificate of Destruction Template |
| P5.0–P5.2 | Data Subject Access Request (DSAR) Procedure; Access Portal Documentation; Identity Verification Procedure |
| P6.0–P6.7 | Data Sharing Policy; Third-Party Data Processing Agreements; Data Disclosure Log; Authorized Disclosure Procedures; Cross-Border Transfer Policy |
| P7.0–P7.1 | Data Quality Procedures; Data Accuracy Verification Procedures; Data Subject Correction Request Procedure |
| P8.0–P8.1 | Privacy Program Monitoring Procedure; Privacy Compliance Reports; Privacy Incident Response Procedure; Regulatory Inquiry Handling Procedure |

## Test Procedure Selection Guide

| Test Procedure | When to Use | Evidence Type |
|---|---|---|
| **Inquiry** | Understanding how a control works; initial assessment | Interview notes, meeting minutes, questionnaire responses |
| **Inspection** | Verifying documentation exists and is complete | Policy documents, configuration exports, reports, screenshots |
| **Reperformance** | Verifying a control produces the expected result | Re-executing access review, re-running vulnerability scan, recalculating |
| **Observation** | Verifying a control is being followed in practice | Watching a deployment process, observing physical access procedures |

For SOC 2 Type II, **Inspection** and **Reperformance** are the strongest test procedures
because they provide direct evidence of operating effectiveness over the audit period.
**Inquiry** alone is insufficient — it should always be combined with another procedure.
