# Amazon Web Services (AWS)

## Builder metadata block

```json
"csp": {
  "name":           "Amazon Web Services (AWS)",
  "short_name":     "AWS",
  "shared_resp":    "AWS is responsible for the security OF the cloud (physical data centers, hardware, hypervisor, networking infrastructure, managed-service backplane). The customer is responsible for security IN the cloud (identity, encryption configuration, logging, network controls, application code, data classification, and governance).",
  "attestation_repo": {
    "name": "AWS Artifact",
    "url":  "https://aws.amazon.com/artifact"
  },
  "console_term":   "Console Path / CLI"
}
```

For HIPAA / regulated-data engagements, add a `baa_or_agreement` block:
```json
"baa_or_agreement": {
  "name": "AWS Business Associate Addendum (BAA)",
  "where_signed": "AWS Artifact -> Agreements -> AWS BAA"
}
```

## Service catalog by control domain

Use these mappings to pick services for each control. List multiple services where they reinforce each other (defense in depth is normal).

### Identity, RBAC, MFA
- **AWS IAM** — Users, roles, policies, conditions, permission boundaries
- **IAM Identity Center** — Workforce SSO, permission sets, session duration
- **IAM Access Analyzer** — Unused-access findings, external-access findings
- **IAM credential reports** — Per-user MFA, password age, key age and last-used
- **IAM Roles Anywhere** — X.509-based federation for non-AWS workloads
- **OIDC providers** — GitHub Actions, GitLab CI, etc., without long-lived keys

### Account / org governance
- **AWS Organizations** — OUs, accounts, delegated administrators
- **Service Control Policies (SCPs)** — Account-level deny rules
- **Resource Control Policies (RCPs)** — Resource-level deny rules (S3, KMS, SQS, etc.)
- **AWS Control Tower** — Landing zone, mandatory guardrails
- **IAM Permission Boundaries** — Cap on what an identity can grant or be granted

### Encryption + key management
- **AWS KMS** — CMKs (AWS-managed, customer-managed, multi-region)
- **AWS KMS External Key Store (XKS)** — Hold-your-own-key
- **AWS CloudHSM** — Dedicated HSM
- **AWS Secrets Manager** — Secrets with automatic rotation
- **AWS Systems Manager Parameter Store** — Secure parameters (SecureString)
- **AWS Certificate Manager (ACM)** — Public + private TLS certificates
- **AWS Private CA** — Customer-managed CA hierarchy

### Logging + audit
- **AWS CloudTrail** — Management events (always on), Data events (off by default; enable per service), Insights events
- **AWS CloudTrail Lake** — SQL-queryable audit log archive
- **Amazon CloudWatch Logs** — Application logs
- **Amazon S3 server access logs** — Bucket access logs
- **VPC Flow Logs** — Network flow logs
- **AWS Config** — Configuration state and history, resource inventory
- **AWS Config Conformance Packs** — Bundled compliance rule sets

### Threat detection + posture
- **AWS Security Hub** — Findings aggregation, AWS Foundational Security Best Practices, CIS, PCI DSS, NIST 800-53 standards
- **Amazon GuardDuty** — Threat detection (EKS, EC2, S3, RDS, Lambda)
- **Amazon GuardDuty Malware Protection** — File scanning
- **Amazon Inspector** — Vulnerability scanning (EC2, ECR, Lambda)
- **Amazon Macie** — Sensitive data discovery in S3
- **AWS Audit Manager** — Pre-built frameworks (HIPAA, SOC 2, PCI DSS, NIST 800-53)

### Data protection + retention
- **Amazon S3 Object Versioning** — Object-level version history
- **Amazon S3 Object Lock** — WORM retention (Governance or Compliance mode)
- **Amazon S3 Lifecycle** — Automated transition + expiration
- **AWS Backup** — Centralized backup orchestration
- **AWS Backup Vault Lock** — Immutable vault retention
- **Amazon EBS snapshots** — Block-storage snapshots
- **Amazon RDS automated backups + PITR** — Database snapshots and point-in-time recovery

### Network protection
- **Amazon VPC** — Network isolation
- **Security groups + Network ACLs** — Stateful + stateless filtering
- **AWS Network Firewall** — Stateful traffic inspection
- **AWS WAF** — Web application firewall
- **AWS Shield + Shield Advanced** — DDoS protection
- **AWS PrivateLink + VPC endpoints** — Private connectivity to AWS services
- **AWS Verified Access** — Zero-trust app access
- **AWS Transit Gateway** — Hub-and-spoke network

### Backup, DR, resilience
- **AWS Backup** — Cross-region copy, vault lock
- **AWS Elastic Disaster Recovery (DRS)** — Block-level replication, failover drills
- **Amazon Route 53** — DNS failover, health checks
- **Multi-AZ + Multi-Region** — Architectural patterns

### Change management + IaC
- **AWS CloudFormation** — IaC; drift detection
- **AWS CDK** — IaC in code
- **AWS CodePipeline / CodeBuild / CodeDeploy** — CI/CD with manual approval stages
- **AWS Systems Manager Change Manager** — Change-record workflow
- **Amazon EC2 Image Builder** — Golden AMI pipeline
- **AWS Signer** — Code signing
- **Amazon ECR image scanning** — Container vulnerability scanning

### Incident response
- **AWS Systems Manager Incident Manager** — Response plans, runbooks, post-incident review
- **Amazon SNS / Amazon EventBridge** — Notification + automation routing
- **AWS Step Functions / AWS Lambda** — SOAR-style playbooks
- **AWS Detective** — Investigation graph

### Compliance reports + agreements
- **AWS Artifact** — SOC 2 Type II, ISO 27001, ISO 27018, ISO 27701, PCI DSS AoC, HITRUST CSF, FedRAMP P-ATO
- **AWS Artifact Agreements** — AWS BAA (HIPAA), AWS Confidentiality Agreement

## Standard inherited controls (when CSP-side controls satisfy a citation)

- Physical data center security (CC6.4 / §164.310(a)(1) / Req 9 / PE family / A.7.x)
- Media disposal at the data center level (CC6.5 / §164.310(d)(2)(i) / Req 9.4 / MP-6 / A.7.14)
- Subservice organization commitments (CC9.2 / §164.308(b)(1) / SA-9)
- Privacy-processor commitments (P6.4 / §164.314(a))

Evidence is the AWS SOC 2 Type II report (and for HIPAA: the accepted BAA).

## Foundational services list (for the DOCX Section 3)

```json
"foundational_services": [
  {"name": "AWS CloudTrail", "blurb": "API audit log. Enable an organization trail covering all regions with log file validation, KMS-encrypted destination, and Object Lock. Source for audit and accountability controls."},
  {"name": "AWS Config", "blurb": "Configuration state and history. Enable the Config Recorder in every region (all resource types) and deploy at least one Conformance Pack."},
  {"name": "AWS IAM + IAM Identity Center", "blurb": "Identity, RBAC, MFA, federation. Required evidence includes credential reports, Access Analyzer findings, MFA enforcement settings, and permission set assignments."},
  {"name": "AWS KMS", "blurb": "Key management. Customer-managed keys with rotation enabled, key policies restricting access, and CloudTrail Data Events logging key usage."},
  {"name": "Amazon GuardDuty", "blurb": "Threat detection. Enable across all accounts via delegated administrator; export findings to Security Hub."},
  {"name": "Amazon Inspector", "blurb": "Vulnerability scanning for EC2, ECR, and Lambda."},
  {"name": "AWS Security Hub", "blurb": "Central findings aggregation with AWS Foundational Security Best Practices, CIS, and framework-specific standards."},
  {"name": "AWS Backup + AWS Elastic Disaster Recovery", "blurb": "Backup, restore, and DR with Vault Lock and cross-region copy."},
  {"name": "AWS Audit Manager", "blurb": "Pre-built compliance frameworks that automate evidence collection."},
  {"name": "AWS Artifact", "blurb": "Inherited evidence — AWS SOC 2 Type II, ISO 27001, ISO 27018, ISO 27701, PCI DSS AoC, HITRUST. For HIPAA: the accepted BAA."}
]
```

## Console / CLI conventions

- Service names: prefix with "AWS" or "Amazon" per AWS branding (AWS CloudTrail, Amazon S3, Amazon RDS).
- Console path format: `Service -> Section -> Subsection` (e.g., `CloudTrail -> Trails -> Logs`).
- CLI: `aws <service> <verb>` (e.g., `aws s3api get-bucket-policy --bucket <name>`).

## Region considerations

- **AWS GovCloud (US)** — Separate partition (`us-gov-east-1`, `us-gov-west-1`); BAA / FedRAMP automatically applies.
- **AWS China** — Operated by Sinnet/NWCD; separate accounts; many services not available.
- **AWS Outposts / Local Zones / Wavelength Zones** — Service availability is partial; validate per workload.
