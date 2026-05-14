# Google Cloud Platform (GCP)

## Builder metadata block

```json
"csp": {
  "name":           "Google Cloud Platform (GCP)",
  "short_name":     "GCP",
  "shared_resp":    "Google is responsible for the security OF the cloud (physical datacenters, hardware, host kernel, networking infrastructure, managed-service backplane). The customer is responsible for security IN the cloud (identity, encryption configuration, logging, network controls, application code, data classification, and governance). The split changes by service tier — Compute Engine leaves the most to the customer, GKE and Cloud Run shift more to Google, BigQuery / Firestore / Cloud SQL shift the most.",
  "attestation_repo": {
    "name": "Compliance Reports Manager",
    "url":  "https://cloud.google.com/security/compliance/compliance-reports-manager"
  },
  "console_term":   "Console Path / gcloud"
}
```

For HIPAA: add `baa_or_agreement` with name "Google Cloud Business Associate Agreement", signed via `admin.google.com → Account → Legal & compliance` with acceptance evidence in Compliance Reports Manager.

## Service catalog by control domain

### Identity, RBAC, MFA
- **Cloud IAM** — Allow / Deny policies at organization, folder, project, resource scope; IAM conditions (CEL)
- **Cloud Identity** — Directory, 2-Step Verification
- **Workforce Identity Federation** — Federate external IdPs (Okta, Azure AD, etc.) without copying users
- **Workload Identity Federation** — Short-lived credentials for non-GCP workloads (GitHub Actions, AWS, Azure)
- **Privileged Access Manager (PAM)** — Just-in-time elevation with approval workflows
- **Policy Analyzer** — Query who has access to what
- **IAM Recommender** — Right-size IAM bindings; unused permissions

### Account / org governance
- **Resource Manager** — Organization > Folders > Projects hierarchy
- **Organization Policy Service** — Preventive constraints (allowed regions, disabled service account key creation, OS Login required)
- **VPC Service Controls** — Service perimeter to prevent data exfiltration

### Encryption + key management
- **Cloud KMS** — Software-protected and HSM-protected CMEK
- **Cloud HSM** — FIPS 140-2 Level 3 HSM
- **Cloud External Key Manager (EKM)** — Hold-your-own-key
- **Secret Manager** — Secret storage with rotation
- **Certificate Manager** — Managed TLS certificates
- **Certificate Authority Service (CAS)** — Managed private CA hierarchy

### Logging + audit
- **Cloud Audit Logs** — Four streams: Admin Activity (always on), Data Access (off by default, enable per service), System Event (always on), Policy Denied
- **Cloud Logging** — Log routing, retention, exports
- **Aggregated organization sinks** — Org-scope log sinks to Cloud Storage / BigQuery / Pub/Sub
- **Cloud Asset Inventory** — Configuration state and change history
- **Access Transparency** — Logs of Google personnel access to customer data
- **Access Approval** — Customer approval required for Google personnel access

### Threat detection + posture
- **Security Command Center (Standard / Premium / Enterprise)** — Compliance dashboards, findings
- **Security Health Analytics** — Misconfiguration detection (in SCC Premium)
- **Event Threat Detection** — Anomalous IAM, exfiltration, brute force (in SCC Premium)
- **Container Threat Detection** — GKE runtime threats (in SCC Premium)
- **Virtual Machine Threat Detection** — VM runtime threats (in SCC Premium)
- **Web Security Scanner** — App-layer vulnerability scanning
- **Container Analysis / On-Demand Scanning** — Artifact Registry image scanning
- **Sensitive Data Protection** (formerly Cloud DLP) — PII discovery + de-identification
- **Chronicle / Google Security Operations** — SIEM/SOAR (separate licensing)

### Data protection + retention
- **Cloud Storage Object Versioning** — Object-level version history
- **Cloud Storage Object Retention Policy** — WORM (locked or unlocked retention)
- **Cloud Storage Object Lifecycle Management** — Transitions and deletion
- **Backup and DR Service** — Centralized backup orchestration
- **Persistent Disk snapshots** — Block-storage snapshots (regional / multi-regional)
- **Cloud SQL automated backups + PITR** — Database backups
- **BigQuery time travel + table expiration** — Database-level retention

### Network protection
- **VPC + Shared VPC** — Network isolation
- **VPC firewall rules + hierarchical firewall** — Stateful filtering
- **Cloud Armor** — WAF + DDoS protection
- **Identity-Aware Proxy (IAP)** — Zero-trust app/SSH access
- **VPC Service Controls** — Service perimeter for managed services
- **Private Service Connect** — Private connectivity to Google services
- **BeyondCorp Enterprise** — Context-aware access platform

### Backup, DR, resilience
- **Backup and DR Service** — Cross-region copy, restore testing
- **Persistent Disk snapshots** — Regional / multi-regional
- **Cloud SQL high availability** — Regional failover
- **Multi-region Cloud Storage** — 99.9999999999% durability

### Change management + IaC
- **Terraform** (official Google provider) — IaC
- **Config Connector** — Manage GCP resources as Kubernetes objects
- **Deployment Manager** — Native IaC (deprecated for new use; prefer Terraform)
- **Cloud Build / Cloud Deploy** — CI/CD with approval gates
- **Binary Authorization** — Attestation-required deploys to GKE / Cloud Run
- **Artifact Registry vulnerability scanning** — Container scanning

### Incident response
- **Security Command Center notifications + Pub/Sub** — Findings routing
- **Cloud Functions / Workflows** — Automated response playbooks
- **Chronicle SOAR** — Full SOAR if licensed

### Compliance reports + agreements
- **Compliance Reports Manager** — SOC 2 Type II, ISO 27001, ISO 27017, ISO 27018, ISO 27701, PCI DSS AoC, HITRUST, FedRAMP P-ATO, HIPAA BAA acceptance log
- **Trust & Security Center** — Compliance overview

## Standard inherited controls

- Physical datacenter security
- Media disposal at the datacenter level
- Subservice organization commitments
- Privacy-processor commitments

Evidence is the Google Cloud SOC 2 Type II report (and for HIPAA: the accepted Google Cloud BAA).

## Foundational services list

```json
"foundational_services": [
  {"name": "Cloud Audit Logs", "blurb": "API and identity audit (Admin Activity always on; Data Access OFF by default — enable per service). Configure an aggregated organization sink to Cloud Storage with locked Object Retention Policy and to BigQuery."},
  {"name": "Cloud Asset Inventory", "blurb": "Configuration state and change history. Configure a feed to Pub/Sub for real-time events; export snapshots to BigQuery for audit queries."},
  {"name": "Cloud IAM + Cloud Identity + Workforce Identity Federation", "blurb": "Entitlements, MFA, federation. Required evidence: IAM policy export, IAM Recommender findings, Policy Analyzer queries, 2-Step Verification enforcement, PAM grant logs."},
  {"name": "Cloud KMS", "blurb": "Key management. Customer-managed encryption keys with rotation periods, key IAM policies, External Key Manager (EKM) if required, and Audit Logging on every key."},
  {"name": "Security Command Center (Premium / Enterprise)", "blurb": "Cloud security posture management and threat detection: Security Health Analytics, Event Threat Detection, Container Threat Detection, VM Threat Detection, Web Security Scanner."},
  {"name": "Organization Policy Service", "blurb": "Preventive guardrails at the org root scope."},
  {"name": "VPC Service Controls", "blurb": "Service perimeter to prevent data exfiltration from GCP-managed services."},
  {"name": "Backup and DR Service + Persistent Disk snapshots + Cloud SQL backups", "blurb": "Backup, restore, and DR."},
  {"name": "Sensitive Data Protection", "blurb": "PII/PHI discovery and de-identification."},
  {"name": "Compliance Reports Manager", "blurb": "Inherited evidence — Google Cloud SOC 2 Type II, ISO 27001, ISO 27018, ISO 27701, PCI DSS AoC, HITRUST, FedRAMP P-ATO. For HIPAA: the accepted BAA."}
]
```

## Console / CLI conventions

- Service names: "Cloud Storage" (not Google Cloud Storage in body text), "Cloud SQL", "Cloud KMS", "BigQuery", "GKE" (Google Kubernetes Engine).
- Console path format: `Console -> Section -> Service` (e.g., `Console -> Security -> Security Command Center`).
- CLI: `gcloud <service> <verb>` (e.g., `gcloud asset list --organization <id>`).

## Region / sovereign considerations

- **Assured Workloads** — Compliance-controlled folders (US Regulated, IL5, CJIS, ITAR, HIPAA-compliant, FedRAMP-aligned).
- **Sovereign Controls by Partner** — Operated by local partners (T-Systems for EU, Telecom Italia for Italy, etc.).
- **GCP Dual Region** — Two regions in a single bucket for high durability.

## GCP-specific gotcha: Data Access logs

Data Access audit logs are OFF by default in GCP. They must be explicitly enabled per service (or globally) for `ADMIN_READ`, `DATA_READ`, and `DATA_WRITE`. Without them, audit-control citations (HIPAA §164.312(b), SOC 2 CC7.1, ISO A.8.15, NIST AU-2 family) cannot be satisfied for that service.
