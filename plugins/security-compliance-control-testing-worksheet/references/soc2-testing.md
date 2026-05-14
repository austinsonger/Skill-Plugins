# SOC 2 Trust Services Criteria Test Procedure Patterns

This reference provides test procedure templates for SOC 2 TSC control families. SOC 2 Type II requires testing both design and operating effectiveness over the audit period.

## Key SOC 2 Testing Concepts

**Design effectiveness (ToD):** The control is suitably designed to meet the applicable trust services criteria.

**Operating effectiveness (ToE):** The control operated consistently as designed throughout the audit period.

**Points of Focus:** Each TSC criterion has multiple points of focus. Testing should address the key points of focus relevant to the organization.

---

## CC1: Control Environment

### CC1.1–CC1.5: Integrity, Board Oversight, Structure, HR, Accountability

**ToD:**
1. Obtain and review the Code of Conduct, Ethics Policy, and organizational chart.
2. Verify the board or oversight body has a charter defining its role in overseeing internal controls.
3. Review HR policies for hiring, performance evaluation, and disciplinary processes.
4. Verify accountability structures are defined (reporting lines, escalation paths).

**ToE:**
1. Inspect evidence of Code of Conduct acknowledgment for all employees during the audit period.
2. Obtain board/committee meeting minutes. Verify internal controls were discussed at least quarterly.
3. Sample new hires — verify background checks and Code of Conduct acknowledgment.
4. Verify performance evaluations were completed for personnel with security responsibilities.

**Methods:** Inspection, Inquiry

---

## CC2: Communication and Information

### CC2.1–CC2.3: Information for Internal Control, Internal/External Communication

**ToD:**
1. Review the Information Security Policy and communication procedures.
2. Verify mechanisms exist for reporting security issues (e.g., ticketing system, hotline, anonymous reporting).

**ToE:**
1. Inspect evidence of security awareness communications during the audit period (newsletters, training reminders, policy updates).
2. Verify external communication mechanisms (status pages, breach notification procedures) are current and tested.
3. Inspect a sample of security issue reports and verify they were acknowledged and routed appropriately.

**Methods:** Inspection, Inquiry

---

## CC3: Risk Assessment

### CC3.1–CC3.4: Objectives, Risk Identification, Fraud Risk, Change Assessment

**ToD:**
1. Obtain and review the Risk Management Framework/Policy.
2. Verify the organization maintains a risk register.
3. Review the risk assessment methodology (scoring, likelihood, impact).

**ToE:**
1. Inspect the risk register — verify it was updated during the audit period.
2. For a sample of identified risks, verify: (a) risk treatment was defined (mitigate, accept, transfer, avoid), (b) treatment actions were executed.
3. Verify that significant changes (new systems, major updates, organizational changes) triggered risk reassessment.

**Methods:** Inspection, Inquiry

---

## CC5: Control Activities

### CC5.1–CC5.3: Risk Mitigation Controls, Technology Controls, Policy Deployment

**ToD:**
1. Review the inventory of key controls mapped to identified risks.
2. Verify technology general controls (ITGC) are documented: access management, change management, operations, SDLC.

**ToE:**
1. For a sample of risks, trace to the mitigating control and verify it operated during the period.
2. Verify policies were deployed and acknowledged by relevant personnel.

**Methods:** Inspection, Inquiry

---

## CC6: Logical and Physical Access Controls

### CC6.1: Access Security Software, Architecture, Configuration

**ToD:**
1. Review the Access Control Policy and logical access architecture documentation.
2. Inspect IdP configuration for authentication requirements (MFA, password complexity).
3. Verify network segmentation and boundary protection documentation.

**ToE:**
1. Reperform: Attempt authentication without MFA — verify denial.
2. Inspect firewall rules — verify default deny and no overly permissive rules.
3. Obtain the list of privileged accounts. Verify each has documented justification.
4. Inspect access review evidence — verify reviews completed at required frequency.

**Methods:** Inspection, Reperformance, Inquiry

### CC6.2: User Access Provisioning

**ToD:**
1. Review the user provisioning procedure.
2. Verify it requires: access request, approval, scope definition, and validation.

**ToE:**
1. Select a sample of new user accounts provisioned during the audit period.
2. For each, verify: (a) access request was submitted, (b) appropriate approval documented, (c) access granted matches approved scope.
3. Select a sample of role changes/transfers. Verify prior access was reviewed and adjusted.

**Methods:** Inspection, Inquiry

### CC6.3: User Access Removal

**ToD:**
1. Review the deprovisioning procedure and offboarding checklist.

**ToE:**
1. Obtain the list of terminated employees during the audit period from HR.
2. For each sampled termination, verify: (a) access was disabled within the defined timeframe, (b) access was revoked across all relevant systems, (c) shared credentials/keys were rotated if applicable.

**Methods:** Inspection

### CC6.6: Security Measures Against External Threats

**ToD:**
1. Review the network security architecture and threat protection documentation.
2. Verify boundary protection (firewall, WAF, IDS/IPS) is documented.

**ToE:**
1. Inspect IDS/IPS logs — verify alerts were generated and investigated.
2. Inspect vulnerability scan results and penetration test reports.
3. Verify endpoint protection (EDR/AV) is deployed on all in-scope endpoints with current signatures.

**Methods:** Inspection, Reperformance

### CC6.7: Restriction of Data Transmission

**ToD:**
1. Review the Encryption Policy for data in transit.
2. Verify TLS/encryption requirements for all external-facing services.

**ToE:**
1. Inspect TLS configurations on a sample of endpoints — verify TLS 1.2+ with strong ciphers.
2. Reperform: Run a TLS scan against external endpoints.
3. Verify email encryption is configured for sensitive data.

**Methods:** Inspection, Reperformance

### CC6.8: Malware Prevention

**ToD:**
1. Review the Endpoint Protection Policy.
2. Verify EDR/antivirus solution is deployed and centrally managed.

**ToE:**
1. Inspect the endpoint protection console — verify coverage (all in-scope endpoints have the agent installed).
2. Verify signature/definition updates are current and automatic.
3. Review a sample of detected malware events — verify they were contained and investigated.

**Methods:** Inspection, Reperformance

---

## CC7: System Operations

### CC7.1: Detection and Monitoring

**ToD:**
1. Review the Monitoring and Detection Policy/Procedure.
2. Inspect SIEM configuration and alerting rules.

**ToE:**
1. Inspect SIEM dashboards showing continuous monitoring during the audit period.
2. Select a sample of security alerts. Verify: (a) alert was investigated within defined SLA, (b) investigation findings documented, (c) remediation completed if confirmed.
3. Verify monitoring covers all in-scope systems and data flows.

**Methods:** Inspection, Inquiry, Reperformance

### CC7.2: Anomaly Detection

**ToD:**
1. Verify anomaly detection capabilities are defined (baseline behavior, alert thresholds, ML models if applicable).

**ToE:**
1. Inspect evidence of anomaly detection during the audit period (alerts triggered, investigations conducted).
2. Verify baselines are maintained and updated.

**Methods:** Inspection, Inquiry

### CC7.3: Vulnerability Management

**ToD:**
1. Review the Vulnerability Management Policy.
2. Verify it defines: scanning tools, frequency, scope, remediation timelines by severity.

**ToE:**
1. Obtain vulnerability scan reports from the audit period.
2. Verify scans occurred at the defined frequency and covered all in-scope assets.
3. For a sample of findings, trace to remediation — verify patched within the defined timeline.
4. If a penetration test was conducted, review the report and remediation status.

**Methods:** Inspection, Inquiry

### CC7.4–CC7.5: Incident Response

**ToD:**
1. Obtain and review the Incident Response Plan.
2. Verify it covers: detection, triage, containment, eradication, recovery, post-incident review, notification.

**ToE:**
1. Obtain the incident log for the audit period.
2. For a sample of incidents, verify response aligned with the IRP.
3. Inspect evidence of incident response testing/tabletop exercises.
4. Verify post-incident reviews were conducted and lessons learned documented.

**Methods:** Inspection, Inquiry, Observation (of exercises if available)

---

## CC8: Change Management

### CC8.1: Change Control Process

**ToD:**
1. Review the Change Management Policy and SDLC procedures.
2. Verify the process defines: request, risk assessment, approval, testing, deployment, and post-deployment review.

**ToE:**
1. Obtain the change log for the audit period.
2. Select a sample of changes. For each, verify: (a) change request documented, (b) risk/impact assessed, (c) testing performed and results recorded, (d) approval from authorized individual before deployment, (e) separation of duties between developer and deployer.
3. Inspect a sample of emergency changes — verify retroactive approval and documentation.

**Methods:** Inspection, Inquiry, Observation

---

## CC9: Risk Mitigation

### CC9.1–CC9.2: Risk Mitigation and Vendor Management

**ToD:**
1. Review the Vendor Management Policy and Third-Party Risk Assessment procedure.
2. Verify it defines: vendor classification, assessment requirements, contractual security requirements, monitoring.

**ToE:**
1. Obtain the vendor inventory.
2. For a sample of critical/high-risk vendors, verify: (a) risk assessment completed, (b) SOC 2 report or equivalent reviewed, (c) contracts include security requirements, (d) issues identified were tracked to resolution.

**Methods:** Inspection, Inquiry

---

## Availability (A1)

### A1.1–A1.3: System Availability, Disaster Recovery

**ToD:**
1. Review the Business Continuity and Disaster Recovery Plan.
2. Verify it defines: RTOs, RPOs, recovery procedures, backup requirements.

**ToE:**
1. Inspect backup logs — verify backups occurred at the defined frequency.
2. Select a sample of backup restore tests — verify successful recovery within RTO.
3. Inspect DR test reports — verify testing occurred at the required frequency and results were documented.
4. Verify uptime/availability metrics against SLA commitments.

**Methods:** Inspection, Reperformance (of backup restore)

---

## Confidentiality (C1)

### C1.1–C1.2: Confidential Information

**ToD:**
1. Review the Data Classification Policy and confidential information handling procedures.
2. Verify data classification categories are defined with corresponding protection requirements.

**ToE:**
1. Select a sample of systems processing confidential data. Verify: (a) data is encrypted at rest and in transit, (b) access is restricted to authorized personnel, (c) data retention and disposal follow policy.
2. Inspect DLP or data access logs if available.

**Methods:** Inspection, Inquiry
