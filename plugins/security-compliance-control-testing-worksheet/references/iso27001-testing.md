# ISO 27001:2022 Test Procedure Patterns

This reference provides test procedure templates for ISO/IEC 27001:2022 Annex A controls and ISMS clauses. ISO audits assess conformity — whether the organization's ISMS and controls meet the requirements of the standard.

## Key ISO 27001 Testing Concepts

**Conformity assessment:** Determines whether the ISMS and controls conform to the requirements. Results are: Conformity, Observation, Minor Nonconformity, or Major Nonconformity.

**Clause requirements (4–10):** Mandatory ISMS management system requirements — every organization seeking certification must address these.

**Annex A controls:** 93 controls across 4 themes (Organizational, People, Physical, Technological). Only those declared applicable in the Statement of Applicability (SoA) need testing.

---

## ISMS Clauses (4–10)

### Clause 4: Context of the Organization

**ToD:**
1. Verify the organization has documented: external and internal issues relevant to the ISMS (4.1), interested parties and their requirements (4.2), ISMS scope (4.3), and ISMS processes (4.4).
2. Verify the scope statement defines boundaries and applicability.

**ToE:**
1. Inspect the ISMS scope document — verify it is current, approved, and communicated.
2. Verify interested parties and their requirements are reviewed periodically.

**Methods:** Inspection, Inquiry

### Clause 5: Leadership

**ToD:**
1. Verify top management commitment through an Information Security Policy (5.2).
2. Verify roles, responsibilities, and authorities are assigned (5.3).
3. Verify the IS Policy is communicated and available to interested parties.

**ToE:**
1. Inspect the IS Policy — verify it was reviewed and approved within the review period.
2. Inspect management review meeting minutes — verify leadership participation.
3. Verify security roles are assigned and documented.

**Methods:** Inspection, Inquiry

### Clause 6: Planning

**ToD:**
1. Verify the risk assessment methodology is documented (6.1.2).
2. Verify the risk treatment process and Statement of Applicability (6.1.3).
3. Verify information security objectives are documented and measurable (6.2).

**ToE:**
1. Inspect the risk register — verify it was updated in the review period.
2. For a sample of identified risks, trace to treatment decisions and Annex A control selections.
3. Verify the SoA is current and reflects the actual control implementation status.
4. Verify security objectives were measured and progress tracked.

**Methods:** Inspection, Inquiry

### Clause 7: Support

**ToD:**
1. Verify documented information control procedures (7.5).
2. Verify awareness and training programs (7.2, 7.3).
3. Verify competence requirements for security-relevant roles.

**ToE:**
1. Inspect training records — verify all personnel completed security awareness training.
2. For a sample of security-relevant roles, verify competence assessments were conducted.
3. Inspect document control evidence — verify version control, approval, and distribution.

**Methods:** Inspection, Inquiry

### Clause 8: Operation

**ToD:**
1. Verify operational planning and control processes are documented (8.1).
2. Verify risk assessments are conducted at planned intervals or upon significant changes (8.2, 8.3).

**ToE:**
1. Inspect risk assessments conducted during the audit period.
2. Verify significant changes triggered risk reassessment.
3. Verify operational procedures were followed.

**Methods:** Inspection, Inquiry

### Clause 9: Performance Evaluation

**ToD:**
1. Verify the monitoring, measurement, analysis, and evaluation process (9.1).
2. Verify the internal audit program (9.2).
3. Verify management review process and required inputs/outputs (9.3).

**ToE:**
1. Inspect internal audit reports — verify audits were conducted at the planned frequency.
2. Inspect management review meeting records — verify all required inputs were addressed.
3. Verify KPIs/metrics were measured and analyzed.

**Methods:** Inspection, Inquiry

### Clause 10: Improvement

**ToD:**
1. Verify the nonconformity and corrective action process (10.1).
2. Verify continual improvement mechanisms (10.2).

**ToE:**
1. Inspect the corrective action register — verify nonconformities were addressed.
2. For a sample of corrective actions, verify: (a) root cause analysis conducted, (b) corrective action implemented, (c) effectiveness verified.
3. Inspect evidence of continual improvement activities.

**Methods:** Inspection, Inquiry

---

## Annex A — Organizational Controls (5.x)

### A.5.1: Policies for Information Security

**ToD:**
1. Obtain the IS Policy and topic-specific policies (access control, encryption, backup, etc.).
2. Verify policies are approved by management and communicated to personnel.
3. Verify policies define: purpose, scope, roles, requirements, review cycle.

**ToE:**
1. Verify each policy was reviewed and updated within the defined cycle (typically annually).
2. Inspect evidence of policy communication/acknowledgment.

**Methods:** Inspection, Inquiry

### A.5.15–A.5.18: Access Control

**ToD:**
1. Review the Access Control Policy.
2. Verify it covers: need-to-know, least privilege, user registration/deregistration, access provisioning, privilege management, authentication.

**ToE:**
1. Select a sample of new user accounts. Verify: formal registration, approval, appropriate access.
2. Select a sample of deregistered users. Verify: timely removal across all systems.
3. Inspect access review records — verify reviews conducted at defined intervals.
4. Inspect privileged account list — verify justification for each.
5. Reperform: Verify authentication controls enforce policy requirements (MFA, complexity).

**Methods:** Inspection, Inquiry, Reperformance

### A.5.19–A.5.23: Supplier/Third-Party Management

**ToD:**
1. Review the Supplier Security Policy and assessment procedure.
2. Verify the supplier register includes risk classification.

**ToE:**
1. For a sample of critical suppliers, verify: (a) security assessment completed, (b) contractual security requirements in place, (c) SOC 2/ISO cert or equivalent reviewed, (d) supplier performance monitored.

**Methods:** Inspection, Inquiry

### A.5.24–A.5.28: Incident Management

**ToD:**
1. Review the Incident Management Procedure.
2. Verify it defines: reporting, categorization, response, evidence collection, notification, post-incident review.

**ToE:**
1. Inspect the incident register for the audit period.
2. For a sample of incidents, verify process was followed and documented.
3. Inspect evidence of incident response exercises/drills.
4. Verify lessons learned were incorporated into the ISMS.

**Methods:** Inspection, Inquiry

### A.5.29–A.5.30: Business Continuity

**ToD:**
1. Review the Business Continuity Plan and IT Disaster Recovery Plan.
2. Verify RTOs and RPOs are defined for critical processes/systems.

**ToE:**
1. Verify BC/DR plans were tested during the audit period.
2. Inspect test results — verify recovery within RTO/RPO.
3. Verify plans were updated based on test findings.

**Methods:** Inspection, Inquiry, Reperformance (of DR test)

---

## Annex A — People Controls (6.x)

### A.6.1–A.6.8: HR Security

**ToD:**
1. Review HR Security Policy covering: screening, terms of employment, awareness/training, disciplinary process, post-employment responsibilities, NDA/confidentiality, remote working, event reporting.

**ToE:**
1. Sample new hires — verify screening completed, employment terms signed, training completed.
2. Sample terminations — verify exit procedures followed, access revoked, assets returned.
3. Inspect training records — verify security awareness training completion rates.

**Methods:** Inspection, Inquiry

---

## Annex A — Physical Controls (7.x)

### A.7.1–A.7.14: Physical Security

**ToD:**
1. Review the Physical Security Policy.
2. Verify physical security perimeters and entry controls are defined.
3. Verify data center environmental controls are documented.

**ToE:**
1. Observation: Visit the facility and verify physical access controls are in place (badge readers, locks, cameras, visitor procedures).
2. Inspect visitor logs — verify all visitors were signed in and escorted.
3. Inspect CCTV/camera footage retention settings.
4. For cloud-hosted organizations: Verify cloud provider physical security certifications (SOC 2, ISO 27001 of the data center provider).

**Methods:** Observation, Inspection, Inquiry

---

## Annex A — Technological Controls (8.x)

### A.8.1–A.8.5: Endpoint and Access

**ToD:**
1. Review policies for user endpoint devices, privileged access, information access restriction, and source code access.
2. Inspect endpoint security configuration standards.

**ToE:**
1. Inspect a sample of endpoints — verify security configurations (encryption, EDR, patching).
2. Reperform: Verify access restrictions are enforced (attempt unauthorized access to restricted resources).
3. Inspect privileged access logs for the audit period.

**Methods:** Inspection, Reperformance, Inquiry

### A.8.8: Vulnerability Management

**ToD:**
1. Review the Vulnerability Management Procedure.
2. Verify it defines: scanning tools, frequency, scope, remediation timelines, risk acceptance process.

**ToE:**
1. Inspect scan reports from the audit period — verify frequency and coverage.
2. For a sample of vulnerabilities, verify remediation within defined timelines.
3. Inspect the penetration test report (if conducted) and remediation status.

**Methods:** Inspection, Inquiry

### A.8.9: Configuration Management

**ToD:**
1. Review the Configuration Management Procedure.
2. Verify baseline configurations are defined for system types.

**ToE:**
1. Select a sample of systems — compare configurations against baselines.
2. Verify deviations have approved change records.
3. Verify baselines were reviewed during the audit period.

**Methods:** Inspection, Reperformance

### A.8.13–A.8.16: Backup, Redundancy, Logging, Monitoring

**ToD:**
1. Review Backup Policy, logging configuration, and monitoring procedures.
2. Verify backup schedules, retention periods, and restoration procedures are defined.

**ToE:**
1. Inspect backup logs — verify backups completed on schedule.
2. Reperform: Verify a backup can be restored successfully.
3. Inspect logging configuration — verify audit logs are enabled, protected, and retained per policy.
4. Inspect monitoring alerts — verify they were investigated.

**Methods:** Inspection, Reperformance, Inquiry

### A.8.24–A.8.34: Secure Development

**ToD:**
1. Review the Secure Development Policy and SDLC documentation.
2. Verify it defines: secure coding standards, code review requirements, testing requirements, separation of environments.

**ToE:**
1. Select a sample of development changes/releases. Verify: (a) code review was performed, (b) security testing (SAST/DAST) was conducted, (c) environments are separated (dev/staging/prod), (d) production deployment followed change management process.
2. Inspect secure development training records for development staff.

**Methods:** Inspection, Inquiry

### A.8.25: Encryption / Cryptographic Controls

**ToD:**
1. Review the Cryptographic Policy.
2. Verify it defines: approved algorithms, key lengths, key management procedures.

**ToE:**
1. Inspect encryption configurations for data at rest (database encryption, disk encryption).
2. Inspect TLS/encryption configurations for data in transit.
3. Verify key management practices: rotation schedule, access controls on keys, secure storage (HSM/KMS).

**Methods:** Inspection, Reperformance
