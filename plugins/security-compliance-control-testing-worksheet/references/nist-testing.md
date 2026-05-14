# NIST 800-53 / FedRAMP Test Procedure Patterns

This reference provides test procedure templates for the most commonly tested NIST 800-53 control families. For FedRAMP, apply the additional rigor noted in each section.

## Table of Contents

1. [Access Control (AC)](#access-control-ac)
2. [Audit and Accountability (AU)](#audit-and-accountability-au)
3. [Configuration Management (CM)](#configuration-management-cm)
4. [Identification and Authentication (IA)](#identification-and-authentication-ia)
5. [Incident Response (IR)](#incident-response-ir)
6. [System and Communications Protection (SC)](#system-and-communications-protection-sc)
7. [System and Information Integrity (SI)](#system-and-information-integrity-si)
8. [Risk Assessment (RA)](#risk-assessment-ra)
9. [Personnel Security (PS)](#personnel-security-ps)
10. [Planning and System Assessment (PL/CA)](#planning-and-system-assessment-plca)

---

## Access Control (AC)

### AC-2: Account Management

**ToD:**
1. Obtain and review the Account Management Policy and IAM Procedure.
2. Verify the policy defines: account types (individual, shared, group, system, service, guest), authorized users, conditions for group membership, access authorizations, and account management roles.
3. Inspect the identity provider (IdP) configuration to confirm account lifecycle workflows (creation, modification, disabling, removal) are defined.
4. Inquire with the IAM team lead about the provisioning and deprovisioning process.

**ToE:**
1. Obtain the list of all active user accounts from the IdP for the audit period.
2. Select a sample of new accounts provisioned during the period. For each, verify: (a) access request form exists, (b) manager approval documented before provisioning, (c) access scope matches what was approved, (d) account created within SLA.
3. Select a sample of terminated employees from HR records. For each, verify: (a) account was disabled within the required timeframe (FedRAMP: same day), (b) access was fully revoked across all systems.
4. Obtain the access review report(s) for the period. Verify reviews were completed at the required frequency (FedRAMP: at least annually) and that identified issues were remediated.

**Methods:** Inspection, Inquiry
**FedRAMP Note:** AC-2 requires 24-hour disabling for terminated users. Sample must include terminated users to verify this.

### AC-6: Least Privilege

**ToD:**
1. Review the Access Control Policy for least privilege provisions.
2. Inspect the role-based access control (RBAC) model or privilege matrix.
3. Verify that privileged roles are defined and limited to specific functions.
4. Confirm separation of duties is documented for sensitive operations.

**ToE:**
1. Obtain the list of users with privileged/administrative access.
2. For each privileged account, verify: (a) business justification is documented, (b) access is limited to the minimum necessary for the role, (c) the user's job function requires the level of access granted.
3. Select a sample of regular user accounts. Verify they do not have privileges beyond their documented role.
4. Inspect audit logs for privileged operations and verify they were performed by authorized accounts.

**Methods:** Inspection, Inquiry, Reperformance

### AC-17: Remote Access

**ToD:**
1. Review the Remote Access Policy.
2. Inspect VPN/remote access solution configuration for encryption, MFA, and session controls.
3. Verify remote access is authorized before provisioning.

**ToE:**
1. Select a sample of remote access provisioning requests. Verify authorization was documented.
2. Reperform: Attempt to connect remotely without MFA and verify access is denied.
3. Inspect VPN logs for the audit period. Verify connections use approved encryption and MFA.

**Methods:** Inspection, Reperformance, Inquiry

---

## Audit and Accountability (AU)

### AU-2/AU-3: Audit Events and Content

**ToD:**
1. Review the Audit and Accountability Policy.
2. Verify the policy defines which events are auditable (login/logout, privileged actions, object access, policy changes, etc.).
3. Inspect SIEM/log management configuration for audit event collection settings.
4. Verify log content includes: what event occurred, when, where, source, outcome, and identity of subjects/objects.

**ToE:**
1. Select a sample of systems in scope. For each, verify: (a) audit logging is enabled, (b) required event types are being captured, (c) log content includes all required fields.
2. Inspect SIEM dashboards or log search results demonstrating continuous log collection during the audit period.
3. Verify log integrity mechanisms are in place (hashing, write-once storage, tamper detection).

**Methods:** Inspection, Reperformance

### AU-6: Audit Review, Analysis, and Reporting

**ToD:**
1. Review the procedure for audit log review.
2. Verify it defines: review frequency, responsible roles, escalation criteria, and reporting requirements.

**ToE:**
1. Obtain evidence of log reviews conducted during the audit period (FedRAMP: at least weekly).
2. For a sample of reviews, verify: (a) review was performed on schedule, (b) findings were documented, (c) anomalies were investigated and resolved or escalated.

**Methods:** Inspection, Inquiry

---

## Configuration Management (CM)

### CM-2: Baseline Configuration

**ToD:**
1. Review the Configuration Management Policy.
2. Obtain the baseline configuration documentation for in-scope system types.
3. Verify baselines define: OS settings, installed software, network configurations, security settings.

**ToE:**
1. Select a sample of in-scope systems. For each, compare current configuration against the documented baseline.
2. Document any deviations and verify they have approved change records.
3. Verify the baseline was reviewed and updated at the required frequency.

**Methods:** Inspection, Reperformance

### CM-3: Configuration Change Control

**ToD:**
1. Review the Change Management Policy and procedure.
2. Verify it defines: change request process, impact analysis requirements, approval authorities, testing requirements, rollback procedures.

**ToE:**
1. Obtain the complete list of changes implemented during the audit period.
2. Select a sample of changes. For each, verify: (a) change request was submitted, (b) impact/risk analysis documented, (c) testing results recorded, (d) approval by authorized individual documented before implementation, (e) post-implementation review completed.
3. Verify emergency changes followed the emergency change process and received retroactive approval.

**Methods:** Inspection, Inquiry, Observation (of CAB meeting if possible)

---

## Identification and Authentication (IA)

### IA-2: Identification and Authentication

**ToD:**
1. Review the Identification and Authentication Policy.
2. Inspect IdP configuration for authentication requirements (password complexity, MFA, session controls).
3. Verify that unique user IDs are required for all accounts.

**ToE:**
1. Reperform: Attempt authentication with valid credentials and MFA — verify success.
2. Reperform: Attempt authentication without MFA — verify denial.
3. Reperform: Attempt authentication with expired password — verify forced password change.
4. Inspect a sample of user accounts to verify unique identification.

**Methods:** Reperformance, Inspection

### IA-5: Authenticator Management

**ToD:**
1. Review the Password/Authenticator Policy.
2. Verify it defines: complexity requirements, minimum length (FedRAMP: 12+ characters), expiration (if applicable), history, lockout thresholds.
3. Inspect IdP password policy configuration settings.

**ToE:**
1. Reperform: Attempt to set a password that violates complexity requirements — verify rejection.
2. Reperform: Attempt to reuse a recent password — verify rejection.
3. Reperform: Exceed login attempt threshold — verify account lockout.
4. Inspect password policy enforcement settings match documented requirements.

**Methods:** Reperformance, Inspection

---

## Incident Response (IR)

### IR-1 through IR-8

**ToD:**
1. Obtain and review the Incident Response Plan (IRP).
2. Verify it defines: incident categories and severity levels, roles and responsibilities, communication procedures, escalation paths, evidence preservation, post-incident review process.
3. Verify the IRP was reviewed and updated at the required frequency (FedRAMP: at least annually).

**ToE:**
1. Obtain the incident log for the audit period.
2. For a sample of incidents, verify: (a) incident was identified and categorized, (b) response actions followed the IRP, (c) containment and eradication steps were documented, (d) communication occurred per the plan, (e) post-incident review was conducted, (f) lessons learned were documented and incorporated.
3. If tabletop exercises or drills were conducted, obtain the exercise report and verify participation and findings.

**Methods:** Inspection, Inquiry

---

## System and Communications Protection (SC)

### SC-7: Boundary Protection

**ToD:**
1. Review the network architecture diagram and boundary protection documentation.
2. Verify boundary devices (firewalls, WAFs, proxies) are documented with their locations and functions.
3. Inspect firewall rule sets and verify a default-deny posture.

**ToE:**
1. Obtain current firewall/ACL configurations. Verify: (a) default deny is in place, (b) allowed rules have documented business justification, (c) no overly permissive rules (allow any/any).
2. Reperform: Conduct a port scan from outside the boundary and verify only authorized ports respond.
3. Verify firewall rule reviews were conducted at the required frequency and that findings were remediated.

**Methods:** Inspection, Reperformance

### SC-8: Transmission Confidentiality and Integrity

**ToD:**
1. Review the Encryption Policy for data in transit requirements.
2. Verify TLS/encryption configurations on externally-facing services.

**ToE:**
1. Inspect TLS configurations on a sample of externally-facing endpoints (web servers, APIs, VPN gateways). Verify: (a) TLS 1.2 or higher, (b) strong cipher suites, (c) valid certificates.
2. Reperform: Use a TLS testing tool (e.g., SSL Labs, testssl.sh) to scan endpoints and document results.

**Methods:** Inspection, Reperformance

---

## System and Information Integrity (SI)

### SI-2: Flaw Remediation

**ToD:**
1. Review the Vulnerability Management Policy and patching procedure.
2. Verify it defines: scanning frequency, remediation timelines by severity, exception/risk acceptance process.

**ToE:**
1. Obtain vulnerability scan reports from the audit period.
2. For a sample of identified vulnerabilities, verify: (a) they were remediated within the required timeline (FedRAMP: Critical 30 days, High 30 days, Moderate 90 days), (b) compensating controls or risk acceptance documented for any exceptions.
3. Verify scan coverage — all in-scope systems were scanned at the required frequency.

**Methods:** Inspection, Inquiry

### SI-4: Information System Monitoring

**ToD:**
1. Review the Continuous Monitoring Policy/Plan.
2. Inspect SIEM/IDS/IPS configuration for detection rules and alerting.

**ToE:**
1. Inspect alert logs from the audit period. Verify alerts were triaged and investigated.
2. Reperform: Trigger a test alert (if permitted) and verify it is captured and routed appropriately.
3. Verify monitoring coverage includes all in-scope systems and network segments.

**Methods:** Inspection, Reperformance, Inquiry

---

## Risk Assessment (RA)

### RA-5: Vulnerability Scanning

**ToD:**
1. Review the Vulnerability Scanning Policy/Procedure.
2. Verify it defines: scanning tools, frequency (FedRAMP: monthly for OS/infrastructure, annually + after major changes for web applications), scope, and remediation requirements.

**ToE:**
1. Obtain scan reports from the audit period. Verify: (a) scans occurred at the required frequency, (b) all in-scope systems were covered, (c) authenticated scanning was used where applicable.
2. For a sample of scan findings, trace remediation: verify the vulnerability was patched/mitigated within the defined timeline.
3. Inspect the vulnerability scanner configuration to verify scan profiles and credential settings.

**Methods:** Inspection, Reperformance (run or observe a scan)

---

## Personnel Security (PS)

### PS-3 through PS-7

**ToD:**
1. Review the Personnel Security Policy and HR Security Procedures.
2. Verify the policy defines: background check requirements, screening criteria by role sensitivity, rescreening frequency (if applicable), access agreement requirements.

**ToE:**
1. Select a sample of new hires during the audit period. For each, verify: (a) background check was completed before granting access, (b) access agreements/NDAs were signed, (c) security awareness training was completed.
2. Select a sample of terminated employees. Verify: (a) access was revoked, (b) equipment was returned, (c) exit procedures were followed.

**Methods:** Inspection, Inquiry

---

## Planning and System Assessment (PL/CA)

### CA-2: Security Assessments / CA-7: Continuous Monitoring

**ToD:**
1. Review the Security Assessment Plan and Continuous Monitoring Plan.
2. Verify they define: assessment scope, frequency, methodology, and reporting requirements.

**ToE:**
1. Obtain assessment reports from the audit period.
2. Verify: (a) assessments were conducted at the required frequency, (b) findings were documented in a POA&M, (c) remediation is tracked and progressing.
3. Verify continuous monitoring deliverables (vulnerability scans, POA&M updates, significant change assessments) were submitted on schedule.

**Methods:** Inspection, Inquiry
