# SCRMS Domain Areas — Due Diligence Activities (Section 11)

This file covers all 33 domain areas from SCRMS Section 11, with key requirements and SCF control mappings.

Each domain entry includes:
- What the entity must do (requirement)
- Relevant SCF Controls
- Key evidence points to demonstrate conformity

---

## 11.1 Cybersecurity & Data Protection Governance
**Must:** Develop and maintain an entity-wide cybersecurity and data protection governance program addressing management commitment and statutory/regulatory/contractual obligations.

Key sub-requirements:
- **Steering Committee & Program Oversight** (GOV-01.1) — Executive steering committee with formal, recurring meetings
- **Publishing Policies, Standards & Procedures** (GOV-02) — Developed, documented, disseminated
- **Exception Management** (GOV-02.1) — Formally assessed, approved, and recorded exceptions
- **Assigned CISO-level Responsibility** (GOV-04) — Senior cybersecurity position with mission and resources
- **Stakeholder Accountability Structure** (GOV-04.1) — Roles and responsibilities assigned
- **Establish Business Context** (GOV-08) — Mission clearly defined and documented
- **Operationalizing Controls** (GOV-15) — Data/process owners select, implement, assess controls for their TAAS
- **Authorize TAAS** (GOV-15.4) — Production authorization for all technology assets, applications, and services
- **Materiality Determinations** (GOV-16) — Entity-specific materiality threshold criteria
- **Material Risks** (GOV-16.1) — Criteria for designating a risk as material
- **Material Threats** (GOV-16.2) — Criteria for designating a threat as material

---

## 11.2 Artificial Intelligence & Autonomous Technologies
**Must:** Ensure AI and autonomous technologies are reliable, safe, fair, secure, resilient, transparent, explainable, and data privacy-enhanced.

Key sub-requirements:
- **AI & AAT Governance** (AAT-01) — Policies, standards, and procedures for AI/AAT risk management
- **Trustworthy AI** (AAT-01.2) — Secure and data privacy engineering principles defined
- **Situational Awareness of AI/AAT** (AAT-02) — Inventory of all AI/AAT (internal and third-party)
- **Adequate Protections for AI/AAT** (AAT-02.3) — Cybersecurity and data protections commensurate with risk
- **AI TEVV** (AAT-10) — Test, Evaluation, Validation & Verification throughout the AAT lifecycle

---

## 11.3 Asset Management
**Must:** Ensure technology assets are properly managed throughout the lifecycle from procurement through disposal.

Key sub-requirements:
- **Asset-Service Dependencies** (AST-01.1) — Identify/document/assess assets supporting multiple critical business functions
- **Stakeholder Identification** (AST-01.2) — Identify stakeholders of critical TAASD
- **Asset Inventories** (AST-02) — Documented, up-to-date, complete hardware/software/firmware/documentation inventory
- **Data Action Mapping** (AST-02.8) — Map where sensitive/regulated data is stored, transmitted, processed
- **Network Diagrams & DFDs** (AST-04) — Current architecture diagrams with sensitive data flows documented
- **Secure Disposal** (AST-09) — Secure destruction/disposal of equipment using defined techniques
- **BYOD Usage** (AST-16) — Implement and govern a BYOD program

---

## 11.4 Business Continuity & Disaster Recovery
**Must:** Establish processes to recover from adverse situations with minimal operational impact and enable e-discovery.

Key sub-requirements:
- **RTO/RPO** (BCD-01.4) — Recovery Time and Point Objectives defined and configured
- **Recovery Operations Criteria** (BCD-01.5) — Criteria to initiate BC/DR plans
- **Identify Critical Assets** (BCD-02) — Document TAASD supporting essential missions and business functions
- **Resume All Missions** (BCD-02.1) — Resume within RTO of contingency plan activation
- **Continue Essential Functions** (BCD-02.2) — Little or no loss of operational continuity
- **Data Backups** (BCD-11) — Recurring backups with integrity verification; protect confidentiality of backup data
- **TAAS Recovery & Reconstitution** (BCD-12) — Secure recovery to known state after disruption/compromise

---

## 11.5 Capacity & Performance Planning
**Must:** Prevent avoidable business interruptions caused by capacity and performance limitations. SCF: CAP-01.

Key sub-requirements:
- **Capacity & Performance Management** (CAP-01) — Proactive planning for growth and forecasting
- **Capacity Planning** — Allocate resources to protect availability
- **Elastic Expansion** — Technology and business leadership maintain awareness of current and future performance

---

## 11.6 Change Management
**Must:** Control changes to minimize unplanned disruptions to technology operations.

Key sub-requirements:
- **Configuration Change Control** (CHG-01) — Controlled change management process
- **Prohibition of Unauthorized Changes** (CHG-02) — Prevent unauthorized changes
- **Security Impact Analysis** (CHG-03) — Analyze security impact of changes before implementation

---

## 11.7 Cloud Security
**Must:** Address security and compliance obligations related to cloud service usage.

Key sub-requirements:
- **Cloud Services** — Governance of CSP usage
- **Cloud Security Architecture** — Security architecture for cloud environments
- **Geolocation Requirements** (CHG/CLD controls) — Restrict processing/storage/service locations
- **Sensitive Data in Public Cloud** — Protect sensitive/regulated data in public cloud environments

---

## 11.8 Compliance
**Must:** Demonstrate conformity with applicable statutory, regulatory, and contractual obligations.

Key sub-requirements:
- **Statutory, Regulatory & Contractual Compliance** (CPL-01) — Identify all applicable compliance obligations
- **Compliance Scope** (CPL-03) — Define the scope of compliance activities

**Common statutory obligations:** FACTA, FERPA, FISMA, FTC Act, GLBA, HIPAA, SOX, CCPA/CPRA, Massachusetts 201 CMR 17.00, PIPEDA, UK DPA

**Common regulatory obligations:** DFARS, FAR, FedRAMP, NISPOM, FINRA, NY DFS 23 NYCRR 500, EU GDPR

**Common contractual obligations:** PCI DSS, ISO 27001, SOC 2, NIST CSF, CIS CSC, CSA CCM

---

## 11.9 Configuration Management
**Must:** Establish and maintain secure baseline configurations for technology assets.

Key sub-requirements:
- **Secure Baseline Configurations** (CFG-01) — Define and implement SBCs for all technology types
- **Approved Configuration Deviations** (CFG-02) — Formally document approved deviations from baselines
- **Least Functionality** (CFG-03) — Configure systems to provide only essential capabilities

---

## 11.10 Continuous Monitoring
**Must:** Implement ongoing monitoring to detect threats, vulnerabilities, and anomalous behavior.

Key sub-requirements:
- **Automated Tools for Real-Time Analysis** (MON-01) — Automated monitoring tools
- **System Generated Alerts** (MON-02) — Alert mechanisms for anomalous activity
- **Security Event Monitoring** (MON-03) — Continuous security event monitoring
- **Content of Event Logs** (MON-06) — Define log content requirements
- **Monitoring for IOC** (MON-08) — Monitor for Indicators of Compromise
- **Anomalous Behavior** (MON-13) — Detect and respond to anomalous behavior

---

## 11.11 Cryptographic Protections
**Must:** Implement cryptographic controls to protect data in transit and at rest.

Key sub-requirements:
- **Transmission Confidentiality** (CRY-01) — Encrypt data in transit
- **Encrypting Data At Rest** (CRY-03) — Encrypt sensitive/regulated data at rest
- **PKI** (CRY-04) — Public Key Infrastructure implementation
- **Cryptographic Key Management** (CRY-05) — Key management lifecycle controls

---

## 11.12 Data Classification & Handling
**Must:** Classify data, define handling requirements, and protect sensitive/regulated data.

Key sub-requirements:
- **Sensitive Data Protection** (DCH-01) — Protection for sensitive and/or regulated data
- **Access Authorizations** (DCH-02) — Define access for sensitive/regulated data
- **Data & Asset Classification** (DCH-03) — Classification schema implementation
- **Sensitive Data Inventories** (DCH-06) — Maintain inventory of sensitive/regulated data
- **External TAAS Usage** (DCH-07) — Govern use of external systems with sensitive data
- **Media & Data Retention** (DCH-09) — Define retention periods and practices
- **Information Disposal** (DCH-13) — Secure disposal of sensitive data
- **Transfer Controls** (DCH-17) — Control transfers of sensitive/regulated data
- **Ad-Hoc Transfers** (DCH-18) — Govern unplanned transfers

---

## 11.13 Embedded Technology
**Must:** Secure embedded/OT/IoT technology across its lifecycle. Covers ICS, SCADA, PLCs, HMIs, and IoT.

Key sub-requirements:
- **Prevent Alterations** (EMB-01) — Prevent unauthorized alteration of embedded technology
- **Embedded Technology Maintenance** (EMB-02) — Maintenance practices for embedded technology
- **Embedded Technology Reviews** (EMB-03) — Regular security reviews

---

## 11.14 Endpoint Security
**Must:** Protect endpoints (workstations, laptops, mobile, servers) from malicious code and unauthorized use.

Key sub-requirements:
- **Endpoint Protection Measures** (END-01) — Comprehensive endpoint protection
- **Malicious Code Protection / Anti-Malware** (END-02) — Anti-malware on all applicable endpoints
- **Always On Protection** (END-02.1) — Real-time, continuous protection
- **Phishing & Spam Protection** (END-02.2) — Email filtering and user education

---

## 11.15 Human Resources Security
**Must:** Manage security risks associated with people across the full employment lifecycle.

Key sub-requirements:
- **Onboarding/Transferring/Offboarding** (HRS-01) — Controls for all personnel lifecycle stages
- **Defined Roles & Responsibilities** (HRS-02) — Security roles documented
- **Competency Requirements** (HRS-03) — Skills and competency standards for security positions
- **Personnel Screening** (HRS-04) — Background checks for appropriate personnel
- **Roles with Special Protection Measures** (HRS-05) — Enhanced controls for privileged roles
- **Terms of Employment** (HRS-06) — Employment agreements include security obligations
- **Rules of Behavior** (HRS-07) — Acceptable use policies
- **Policy Familiarization & Acknowledgement** (HRS-08) — Annual acknowledgement
- **Personnel Sanctions** (HRS-09) — Sanctions for violations
- **Workplace Investigations** (HRS-10) — Formal investigation process
- **Personnel Termination** (HRS-12) — Secure termination process including access revocation
- **Third-Party Personnel** (HRS-13) — Security requirements for contractors/temps
- **Authorized Work Locations** (HRS-14) — Define where work may be performed

---

## 11.16 Identification & Authentication
**Must:** Control access to systems and data through identity verification mechanisms.

Key sub-requirements:
- **Authenticate, Authorize & Audit (AAA)** (IAC-01) — AAA framework
- **User & Service Account Inventories** (IAC-02) — Complete inventory of accounts
- **Multi-Factor Authentication (MFA)** (IAC-06) — MFA for applicable access scenarios
- **User Provisioning & De-Provisioning** (IAC-07) — Formal access request/revocation process
- **Role-Based Access Control (RBAC)** (IAC-08) — RBAC implementation
- **Authenticator Management** (IAC-09) — Manage authentication credentials lifecycle
- **Password Managers** (IAC-11) — Use of password managers
- **Account Management** (IAC-12) — Formal account management process
- **Privileged Account Management (PAM)** (IAC-16) — PAM for privileged accounts
- **Privileged Account Inventories** (IAC-17) — Inventory of all privileged accounts
- **Periodic Review of Privileges** (IAC-18) — Regular access reviews/recertification
- **Least Privilege** (IAC-21) — Implement least privilege principles

---

## 11.17 Incident Response
**Must:** Detect, respond to, and recover from security incidents in a structured and documented manner.

Key sub-requirements:
- **Incident Handling** (IRO-01) — Incident handling capability
- **Indicators of Compromise (IOC)** (IRO-01.1) — IOC detection and response
- **Incident Response Plan (IRP)** (IRO-02) — Documented, maintained IRP
- **Integrated Security Incident Response Team (ISIRT)** (IRO-03) — Designated team with defined roles
- **Incident Stakeholder Reporting** (IRO-04) — Internal and external reporting requirements
- **Root Cause Analysis (RCA) & Lessons Learned** (IRO-06) — Post-incident analysis and improvement

---

## 11.18 Information Assurance
**Must:** Assess and validate security controls through formal assurance activities.

Key sub-requirements:
- **Information Assurance Operations** (IAO-01) — IA operations capability
- **Controls Assessments** (IAO-02) — Periodic assessment of control implementation and effectiveness
- **Security Assessment Report (SAR)** (IAO-03) — Document assessment findings
- **System Security & Privacy Plan (SSPP)** (IAO-04) — Documented system security and privacy plan
- **Threat Analysis & Flaw Remediation** (IAO-05) — Identify and remediate security flaws during development
- **Plan of Action & Milestones (POA&M)** (IAO-06) — Track and remediate findings
- **Authorization to Operate (ATO)** (IAO-07) — Formal authorization process

---

## 11.19 Maintenance
**Must:** Control maintenance activities to prevent unauthorized access and ensure system integrity.

Key sub-requirements:
- **Maintenance Operations** (MNT-01) — Controlled, documented maintenance
- **Controlled Maintenance** (MNT-02) — Formal approval and logging
- **Remote Maintenance** (MNT-03) — Security controls for remote maintenance sessions

---

## 11.20 Mobile Device Management
**Must:** Manage and secure mobile devices that access organizational data and systems.

Key sub-requirements:
- **Full Device & Container-Based Encryption** (MDM-01) — Encrypt mobile device data
- **Remote Purging** (MDM-02) — Ability to remotely wipe devices
- **Personally-Owned Mobile Devices** (MDM-03) — Controls for personal devices (BYOD)
- **Organization-Owned Mobile Devices** (MDM-04) — MDM solution for org-owned devices
- **Restricting Access to Authorized TAAS** (MDM-05) — Limit mobile access to authorized systems

---

## 11.21 Network Security
**Must:** Implement layered network defenses to protect against unauthorized access and data exfiltration.

Key sub-requirements:
- **Layered Network Defenses** (NET-01) — Defense-in-depth network architecture
- **Guest Networks** (NET-02) — Segregate guest/untrusted networks
- **Boundary Protection** (NET-03) — Enforce network perimeter controls
- **Data Flow Enforcement / ACLs** (NET-04) — Control traffic flows between segments
- **Deny Traffic by Default** (NET-05) — Default deny with exception-based allow
- **DNS Resolution** (NET-06) — Controlled and monitored DNS
- **Safeguarding Data Over Open Networks** (NET-07) — Protect data traversing open networks
- **End-User Messaging Technologies** (NET-08) — Secure messaging controls
- **Remote Access** (NET-09) — Secure remote access (VPN, ZTNA, etc.)
- **Work From Anywhere (WFA)** (NET-10) — Telecommuting security controls
- **Endpoint Security Validation** (NET-11) — Validate endpoint security before granting access
- **Wireless Networking** (NET-12) — Wireless security controls
- **DNS & Content Filtering** (NET-13) — DNS filtering and content inspection

---

## 11.22 Physical & Environmental Security
**Must:** Protect facilities, equipment, and physical assets from unauthorized access and environmental hazards.

Key sub-requirements:
- **Physical Security Plan (PSP)** (PES-01) — Documented physical security program
- **Zone-Based Physical Security** (PES-02) — Security zones with appropriate controls
- **Physical Access Authorizations** (PES-03) — Formal authorization for physical access
- **Role-Based Physical Access** (PES-04) — Physical access based on role/need
- **Physical Access Control** (PES-05) — Technical controls for physical access
- **Physical Security of Offices/Rooms/Facilities** (PES-06) — Perimeter and facility protection
- **Monitoring Physical Access** (PES-07) — Log and review physical access
- **Visitor Control** (PES-08) — Escort and log visitors
- **Equipment Siting & Protection** (PES-09) — Protect equipment from environmental hazards

---

## 11.23 Data Privacy
**Must:** Implement reasonable data privacy practices that respect individual rights.

Key sub-requirements:
- **Reasonable Data Privacy Practices** (PRI-01) — Privacy program implementation
- **Data Privacy Notice** (PRI-02) — Notify individuals of data collection and use
- **Choice & Consent** (PRI-03) — Obtain consent where required
- **Restrict Collection to Identified Purpose** (PRI-04) — Data minimization
- **Inventory of Personal Data (PD)** (PRI-05) — Maintain personal data inventory
- **Data Subject Empowerment** (PRI-06) — Enable data subject rights (access, correction, deletion)
- **Documenting Data Processing Activities** (PRI-07) — Records of Processing Activities (ROPA)
- **Data Subject Communications** (PRI-08) — Respond to data subject requests

---

## 11.24 Project & Resource Management
**Must:** Integrate cybersecurity and data privacy requirements into project management and resource allocation.

Key sub-requirements:
- **Strategic Plan & Objectives** (PRM-01) — Multi-year cybersecurity strategy
- **Targeted Capability Maturity Levels** (PRM-02) — Maturity targets by control/domain
- **Allocation of Resources** (PRM-03) — Resourced cybersecurity program
- **Cybersecurity in Project Management** (PRM-04) — Security integrated into projects
- **Cybersecurity Requirements Definition** (PRM-05) — Security requirements captured at project start
- **Secure Development Life Cycle (SDLC) Management** (PRM-06) — SDLC security integration

---

## 11.25 Risk Management
**Must:** Implement a structured, ongoing risk management program integrated with business planning.

Key sub-requirements:
- **Risk Framing** (RSK-01) — Establish risk context and methodology
- **Risk Tolerance** (RSK-02) — Define objective risk tolerance criteria
- **Risk Threshold** (RSK-03) — Entity-specific risk threshold definitions
- **Risk Appetite** (RSK-04) — Management-level risk appetite statement
- **Risk Identification** (RSK-05) — Ongoing risk identification process
- **Risk Catalog** (RSK-06) — Documented catalog of entity-specific risks
- **Risk Assessment** (RSK-07) — Formal risk assessment methodology
- **Risk Register** (RSK-08) — Maintained risk register with all active risks
- **Risk Assessment Methodology** (RSK-09) — Documented, repeatable methodology
- **Risk Ranking** (RSK-10) — Risk prioritization by severity
- **Risk Remediation** (RSK-11) — Remediation tracking
- **Risk Response** (RSK-12) — Treat/Accept/Transfer/Avoid decisions
- **Compensating Countermeasures** (RSK-13) — Document compensating controls
- **Risk Treatment Plan** (RSK-14) — Formal treatment plans for accepted/residual risk
- **Supply Chain Risk Management (SCRM) Plan** (RSK-15) — SCRM program documentation
- **Supply Chain Risk Assessment** (RSK-16) — Assess supply chain risks
- **Data Protection Impact Assessment (DPIA)** (RSK-17) — DPIA for high-risk data processing

---

## 11.26 Secure Engineering & Architecture
**Must:** Apply security and privacy by design principles throughout technology development and operations.

Key sub-requirements:
- **Secure Engineering Principles** (SEA-01) — Established secure engineering principles
- **Achieving Resilience Requirements** (SEA-02) — Resilience built into architecture
- **Resilience Capabilities** (SEA-03) — Redundancy and failover capabilities
- **Alignment with Enterprise Architecture** (SEA-04) — Cybersecurity integrated into EA
- **Technical Debt Reviews** (SEA-05) — Address accumulated technical debt
- **Defense-in-Depth Architecture** (SEA-06) — DiD implementation
- **Clock Synchronization** (SEA-07) — NTP/time synchronization for audit integrity

---

## 11.27 Security Operations
**Must:** Establish documented operational procedures for security activities.

Key sub-requirements:
- **Standardized Operating Procedures (SOP)** (OPS-01) — Documented SOPs for security operations
- **Security Concept of Operations (CONOPS)** (OPS-02) — CONOPS documentation
- **Service Delivery / Business Process Support** (OPS-03) — Security support for business operations

---

## 11.28 Security Awareness & Training
**Must:** Build a security-minded workforce through awareness programs and role-based training.

Key sub-requirements:
- **Cybersecurity & Data Protection-Minded Workforce** (SAT-01) — Security culture initiative
- **Security Awareness Training** (SAT-02) — Regular security awareness training for all personnel
- **Role-Based Training** (SAT-03) — Specialized training for personnel with security responsibilities

---

## 11.29 Technology Development & Acquisition
**Must:** Integrate security into the full technology development and acquisition lifecycle.

Key sub-requirements:
- **Technology Development & Acquisition** (TDA-01) — Govern technology acquisition
- **Product Management** (TDA-02) — Security in product management
- **DevSecOps** (TDA-03) — Integrate security into DevOps pipelines
- **Minimum Viable Product (MVP) Security Requirements** (TDA-04) — Security requirements before launch
- **Development Methods, Techniques & Processes** (TDA-05) — Secure development practices
- **Product Testing & Reviews** (TDA-06) — Pre-release security testing
- **Software Bill of Materials (SBOM)** (TDA-07) — SBOM generation and management
- **Secure Software Development Practices (SSDP)** (TDA-09) — OWASP/SANS-aligned practices
- **Criticality Analysis** (TDA-10) — Assess criticality of software components
- **Threat Modeling** (TDA-11) — Threat modeling for applications and architectures
- **Software Design Review** (TDA-12) — Formal security design reviews
- **Secure Development Environments** (TDA-13) — Isolated, secured development environments
- **Access to Program Source Code** (TDA-14) — Control access to source code

---

## 11.30 Third-Party Management
**Must:** Manage cybersecurity and privacy risks associated with third-party relationships across the supply chain.

Key sub-requirements:
- **Third-Party Inventories** (TPM-01) — Complete inventory of third-party relationships
- **Third-Party Criticality Assessments** (TPM-02) — Assess criticality of each third party
- **Supply Chain Risk Management (SCRM)** (TPM-03) — SCRM program implementation
- **Third-Party Services** (TPM-04) — Security requirements for third-party services
- **Third-Party Risk Assessments & Approvals** (TPM-05) — Pre-engagement risk assessment
- **Third-Party Processing/Storage Locations** (TPM-06) — Geolocation restrictions
- **Third-Party Contract Requirements** (TPM-07) — Security clauses in contracts
- **Contract Flow-Down Requirements** (TPM-08) — Flow-down to sub-contractors
- **RASCI Matrix** (TPM-09) — Documented accountability matrix
- **Break Clauses** (TPM-10) — Contract termination provisions for security violations

---

## 11.31 Threat Management
**Must:** Maintain awareness of current and emerging threats to inform security decisions.

Key sub-requirements:
- **Threat Intelligence Program** (THR-01) — Formal threat intelligence capability
- **Threat Intelligence Feeds** (THR-02) — Subscribe to and process threat intelligence feeds
- **Threat Intelligence Reporting** (THR-03) — Report threat intelligence to relevant stakeholders
- **Threat Catalog** (THR-04) — Documented entity-specific threat catalog
- **Threat Analysis** (THR-05) — Analyze threats and their relevance to the entity

---

## 11.32 Vulnerability & Patch Management
**Must:** Identify, prioritize, and remediate vulnerabilities in a structured and timely manner.

Key sub-requirements:
- **Vulnerability & Patch Management Program (VPMP)** (VPM-01) — Documented VPMP
- **Vulnerability Remediation Process** (VPM-02) — Defined remediation workflow
- **Vulnerability Ranking** (VPM-03) — Prioritize vulnerabilities by severity (e.g., CVSS)
- **Software & Firmware Patching** (VPM-04) — Timely patching aligned to risk
- **Vulnerability Scanning** (VPM-05) — Regular authenticated scans
- **Breadth/Depth of Coverage** (VPM-06) — Ensure scanning covers all applicable assets

---

## 11.33 Web Security
**Must:** Implement security controls for web applications and web-facing services.

Key sub-requirements:
- **Strong Customer Authentication (SCA)** (WEB-01) — Strong authentication for web applications
- **Secure Web Traffic** (WEB-10) — All web application content delivered via cryptographic mechanisms (HTTPS)
