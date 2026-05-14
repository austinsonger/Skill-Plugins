# Microsoft Azure

## Builder metadata block

```json
"csp": {
  "name":           "Microsoft Azure",
  "short_name":     "Azure",
  "shared_resp":    "Microsoft is responsible for the security OF the cloud (physical datacenters, hardware, host OS / hypervisor, networking infrastructure, managed-service backplane). The customer is responsible for security IN the cloud (identity, encryption configuration, logging, network controls, application code, data classification, and governance). The split changes by service tier — IaaS leaves the most to the customer, PaaS shifts more to Microsoft, SaaS shifts the most.",
  "attestation_repo": {
    "name": "Microsoft Service Trust Portal",
    "url":  "https://servicetrust.microsoft.com"
  },
  "console_term":   "Portal Path / CLI"
}
```

For HIPAA: add `baa_or_agreement` with name "Microsoft Products and Services Data Protection Addendum (DPA) + HIPAA BAA", signed via Microsoft 365 admin center → Settings → Org settings → Microsoft Cloud agreements.

## Service catalog by control domain

### Identity, RBAC, MFA
- **Microsoft Entra ID** (formerly Azure AD) — Directory, groups, MFA, sign-in logs
- **Microsoft Entra PIM** — Just-in-time privileged role activation
- **Conditional Access** — Policy-based access decisions
- **Microsoft Entra ID Protection** — Risk-based authentication
- **Microsoft Entra Permissions Management** — Multi-cloud entitlement management (formerly CloudKnox)
- **Microsoft Entra Workload ID** — Service principal management
- **Microsoft Entra External ID** (formerly B2C) — Customer-facing identity

### Account / org governance
- **Microsoft Entra Tenants + Management Groups** — Org hierarchy
- **Azure Policy** — Compliance-as-code with built-in initiatives (NIST 800-53, ISO 27001, PCI DSS, HIPAA HITRUST, SOC 2)
- **Azure Blueprints** — Deprecated; use Deployment Stacks + Azure Policy
- **Azure Lighthouse** — Cross-tenant management

### Encryption + key management
- **Azure Key Vault** — Standard tier (software-protected keys)
- **Azure Key Vault Managed HSM** — FIPS 140-3 Level 3, customer-controlled HSM
- **Azure Key Vault Secrets** — Secret storage with rotation
- **Azure Key Vault Certificates** — Managed certificates with auto-renewal
- **Azure Confidential Ledger** — Tamper-proof audit log storage

### Logging + audit
- **Azure Activity Log** — Subscription-level control-plane events
- **Microsoft Entra audit + sign-in logs** — Identity events
- **Microsoft 365 Unified Audit Log** — Cross-Microsoft-365 audit events
- **Azure Diagnostic Settings** — Per-resource diagnostic data routing
- **Azure Monitor / Log Analytics** — Log aggregation and KQL queries
- **Azure Storage immutable blob** — WORM evidence retention

### Threat detection + posture
- **Microsoft Defender for Cloud (CSPM)** — Cloud Security Posture Management with Secure Score
- **Microsoft Defender for Cloud (CWP) plans** — Defender for Servers, Containers, SQL, Storage, App Service, Key Vault, Resource Manager, DNS, APIs
- **Microsoft Sentinel** — SIEM + SOAR
- **Microsoft Defender for Endpoint** — EDR
- **Microsoft Defender XDR** — Cross-product correlation
- **Microsoft Purview** — Data governance + classification

### Data protection + retention
- **Azure Blob versioning + soft delete** — Object version history
- **Azure Storage immutable blob (time-based or legal hold)** — WORM
- **Azure Storage lifecycle policies** — Automated tiering + deletion
- **Azure Backup** — Centralized backup orchestration
- **Azure Backup Immutable Vault** — Tamper-proof backup retention
- **Azure Disk Snapshots** — Block-storage snapshots
- **Azure SQL automated backups + LTR** — Database backups with long-term retention

### Network protection
- **Azure Virtual Network (VNet)** — Network isolation
- **NSGs + ASGs** — Stateful filtering
- **Azure Firewall + Azure Firewall Premium** — TLS inspection, IDPS
- **Azure WAF (Application Gateway / Front Door)** — Web application firewall
- **Azure DDoS Protection** — DDoS mitigation
- **Azure Private Link + Private Endpoints** — Private PaaS connectivity
- **Azure Bastion** — Browser-based RDP/SSH to VMs

### Backup, DR, resilience
- **Azure Backup** — Cross-region copy, immutable vault
- **Azure Site Recovery (ASR)** — Replication and failover
- **Availability Zones + paired regions** — Architectural patterns
- **Traffic Manager / Front Door** — DNS + global load balancing

### Change management + IaC
- **Azure Resource Manager (ARM) + Bicep** — IaC
- **Terraform AzureRM provider** — Multi-cloud IaC
- **Azure DevOps Pipelines / GitHub Actions** — CI/CD with approval gates
- **Azure Deployment Stacks** — Tracked infrastructure deployments
- **Azure Image Builder** — Golden image pipeline

### Incident response
- **Microsoft Sentinel** — Incidents, automation rules, Logic Apps playbooks
- **Microsoft Defender for Cloud workflow automation** — Logic Apps triggered by alerts
- **Azure Monitor action groups** — Notification routing

### Compliance reports + agreements
- **Microsoft Service Trust Portal** — SOC 1/2/3, ISO 27001, ISO 27017, ISO 27018, ISO 27701, PCI DSS AoC, HITRUST, FedRAMP P-ATO, HIPAA BAA acceptance log
- **Microsoft Compliance Manager** — Compliance posture assessments

## Standard inherited controls

- Physical datacenter security
- Media disposal at the datacenter level
- Subservice organization commitments
- Privacy-processor commitments

Evidence is the Microsoft Azure SOC 2 Type II report (and for HIPAA: the accepted Microsoft Products and Services DPA with HIPAA BAA).

## Foundational services list

```json
"foundational_services": [
  {"name": "Azure Activity Log + Entra audit/sign-in logs", "blurb": "API and identity audit. Configure diagnostic settings forwarding to Log Analytics + immutable Storage."},
  {"name": "Azure Policy", "blurb": "Configuration state and compliance enforcement. Assign initiatives at the root Management Group (NIST 800-53, ISO 27001, PCI DSS, SOC 2)."},
  {"name": "Microsoft Entra ID + PIM + Conditional Access", "blurb": "Identity and authentication. PIM activation history, Conditional Access policies, access review results, MFA enforcement."},
  {"name": "Azure Key Vault", "blurb": "Keys, secrets, certificates. CMK rotation, soft-delete and purge protection, diagnostic settings to Log Analytics."},
  {"name": "Microsoft Defender for Cloud", "blurb": "CSPM + threat detection. Enable Defender plans across all subscriptions."},
  {"name": "Microsoft Sentinel", "blurb": "SIEM + SOAR. Analytics rules, incidents, playbooks."},
  {"name": "Azure Backup + Azure Site Recovery", "blurb": "Backup, restore, and DR with immutable vault and cross-region copy."},
  {"name": "Microsoft Purview", "blurb": "Data discovery, classification, and DLP."},
  {"name": "Microsoft Service Trust Portal", "blurb": "Inherited evidence — Azure SOC 2 Type II, ISO 27001, ISO 27018, ISO 27701, PCI DSS AoC, HITRUST, FedRAMP P-ATO."}
]
```

## Console / CLI conventions

- Service names: "Microsoft Entra ID" not "Azure AD" (rebranded 2023); "Microsoft Defender for Cloud" not "Azure Security Center"; "Microsoft Sentinel" not "Azure Sentinel".
- Portal path format: `Azure portal -> Service -> Section` or `Entra admin center -> Section` or `admin.microsoft.com -> Section`.
- CLI: `az <service> <verb>` (e.g., `az policy state list`).

## Region / sovereign considerations

- **Azure Government** — Separate cloud (`AzureUSGovernment`); FedRAMP / DoD IL automatically applies.
- **Azure China (operated by 21Vianet)** — Separate cloud; many services not available.
- **EU Data Boundary** — Customer data + pseudonymized personal data + system-generated logs stay within the EU.
- **Sovereign Controls (Sovereign Landing Zone)** — Customer-managed cryptographic boundary.
