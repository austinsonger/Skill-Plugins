# AWS Inheritance Reference — NIST 800-53 Control Families

This file provides common inheritance patterns for AWS IaaS/PaaS services. These are starting
points based on the AWS Shared Responsibility Model. Always validate against the customer's
specific deployment and the latest AWS documentation.

## Table of Contents
1. [Service Model Impact](#service-model-impact)
2. [Control Family Defaults (IaaS)](#control-family-defaults-iaas)
3. [Service-Specific Overrides](#service-specific-overrides)

## Service Model Impact

AWS operates on a "security OF the cloud vs. security IN the cloud" model:
- **AWS responsibility (OF the cloud)**: Hardware, global infrastructure, networking fabric,
  facilities, hypervisor, managed service internals
- **Customer responsibility (IN the cloud)**: OS, applications, data, identity, firewall config,
  encryption settings, network traffic protection

As you move from IaaS → PaaS → SaaS (within AWS), more controls shift toward Inherited.

## Control Family Defaults (IaaS — e.g., EC2, VPC)

### AC — Access Control
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| AC-1 | CR | — | Customer defines access control policy and procedures |
| AC-2 | S | AWS provides IAM service, enforces SCPs | Customer manages IAM users/roles/groups, MFA, reviews |
| AC-3 | S | AWS enforces IAM policy evaluation engine | Customer writes and applies IAM policies, resource policies |
| AC-4 | S | AWS provides VPC, NACLs, security groups | Customer configures VPC flow rules, NACLs, SGs |
| AC-5 | S | AWS provides IAM roles/policies for separation | Customer implements least privilege and SoD in IAM |
| AC-6 | S | AWS provides granular IAM permissions | Customer configures least privilege, uses conditions |
| AC-7 | S | AWS supports lockout on console (IAM) | Customer configures password policy, monitors failed logins |
| AC-8 | CR | — | Customer configures system use notification banners |
| AC-11 | S | AWS console has configurable timeout | Customer configures session timeout for own apps/console |
| AC-14 | S | AWS allows unauthenticated actions for specific APIs | Customer determines permitted unauthenticated actions |
| AC-17 | S | AWS provides VPN, Direct Connect, Session Manager | Customer configures remote access methods and policies |
| AC-18 | I | AWS manages wireless within data center facilities | — (no customer wireless in AWS DCs) |
| AC-19 | CR | — | Customer manages mobile device access to AWS resources |
| AC-20 | CR | — | Customer manages external IS connections |

### AT — Awareness and Training
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| AT-1 | CR | — | Customer defines training policy |
| AT-2 | CR | — | Customer provides security awareness training to own staff |
| AT-3 | CR | — | Customer trains own personnel on role-based security |
| AT-4 | CR | — | Customer maintains training records |

### AU — Audit and Accountability
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| AU-1 | CR | — | Customer defines audit policy |
| AU-2 | S | AWS logs infrastructure events via CloudTrail | Customer defines auditable events for own apps, enables CloudTrail |
| AU-3 | S | CloudTrail provides event details | Customer ensures own apps log required content |
| AU-4 | S | AWS manages CloudTrail storage capacity | Customer manages log storage (S3 lifecycle, retention) |
| AU-5 | S | CloudTrail alerting via CloudWatch | Customer configures alerts on audit failures |
| AU-6 | S | AWS provides log analysis tools (Athena, Security Hub) | Customer reviews and analyzes logs per defined frequency |
| AU-7 | S | AWS provides Athena, CloudWatch Logs Insights | Customer uses tools to reduce/report on audit data |
| AU-8 | I | AWS synchronizes time across infrastructure (NTP) | — |
| AU-9 | S | AWS protects CloudTrail integrity (log file validation) | Customer configures S3 bucket policies, MFA delete, encryption |
| AU-11 | S | AWS stores logs per S3 lifecycle config | Customer sets retention policy and lifecycle rules |
| AU-12 | S | AWS generates CloudTrail/VPC Flow/ELB logs | Customer enables logging, selects events, configures destinations |

### CA — Assessment, Authorization, and Monitoring
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| CA-1 through CA-9 | CR | — | Customer manages own assessment and authorization |

### CM — Configuration Management
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| CM-1 | CR | — | Customer defines CM policy |
| CM-2 | S | AWS provides AMIs, CloudFormation, Config | Customer establishes and maintains baseline configs |
| CM-3 | S | AWS provides Config rules, CloudFormation drift detection | Customer implements change control for own resources |
| CM-4 | CR | — | Customer performs security impact analysis on changes |
| CM-5 | S | AWS provides IAM for config change auth | Customer restricts who can modify configurations |
| CM-6 | S | AWS provides Config, SSM, Security Hub benchmarks | Customer configures settings per org standards |
| CM-7 | S | AWS provides SGs, NACLs for port restrictions | Customer restricts functions/ports/protocols |
| CM-8 | S | AWS provides Config, Systems Manager inventory | Customer maintains system component inventory |

### CP — Contingency Planning
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| CP-1 | CR | — | Customer defines contingency plan |
| CP-2 | S | AWS provides multi-AZ, multi-Region capabilities | Customer develops and maintains contingency plan |
| CP-6 | S | AWS provides cross-region replication, S3 cross-region | Customer configures alternate storage sites |
| CP-7 | S | AWS provides multiple Regions | Customer configures failover to alternate sites |
| CP-9 | S | AWS provides EBS snapshots, S3 versioning, AWS Backup | Customer configures backup schedules and retention |
| CP-10 | S | AWS provides recovery tools (CloudFormation, AMIs) | Customer tests and executes recovery procedures |

### IA — Identification and Authentication
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| IA-1 | CR | — | Customer defines I&A policy |
| IA-2 | S | AWS provides IAM, supports MFA | Customer enforces MFA, manages authenticators |
| IA-3 | S | AWS authenticates devices at network edge | Customer identifies/authenticates own devices |
| IA-4 | S | AWS manages infrastructure identifiers | Customer manages user/service identifiers |
| IA-5 | S | AWS provides password policy settings, key pairs | Customer manages passwords, keys, certificates |
| IA-6 | S | AWS masks console passwords | Customer ensures own apps mask authenticator feedback |
| IA-8 | S | AWS provides IAM Identity Center, federation | Customer configures non-org user authentication |

### IR — Incident Response
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| IR-1 | CR | — | Customer defines IR policy |
| IR-2 | CR | — | Customer trains own IR team |
| IR-3 | CR | — | Customer tests own IR plan |
| IR-4 | S | AWS handles infrastructure incidents, publishes to PHD | Customer handles application-layer incidents |
| IR-5 | S | AWS provides Security Hub, GuardDuty for monitoring | Customer monitors and tracks incidents |
| IR-6 | S | AWS reports to customer via PHD/Abuse | Customer reports incidents per own policy and to authorities |
| IR-7 | S | AWS provides support plans, TAM | Customer obtains and provides IR assistance |

### MA — Maintenance
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| MA-1 | S | — | Customer defines maintenance policy for own systems |
| MA-2 | S | AWS maintains physical infrastructure | Customer maintains OS/app on instances |
| MA-3 | I | AWS controls maintenance tools in DCs | — |
| MA-4 | S | AWS manages remote access to infrastructure | Customer manages remote maintenance of own systems |
| MA-5 | I | AWS vets DC maintenance personnel | — |
| MA-6 | S | AWS maintains spare parts for infrastructure | Customer plans for instance replacement/auto-scaling |

### MP — Media Protection
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| MP-1 | S | — | Customer defines media protection policy |
| MP-2 | S | AWS classifies DC media | Customer protects digital media (EBS encryption) |
| MP-3 | S | AWS marks DC media | Customer marks own digital media |
| MP-4 | S | AWS stores DC media securely | Customer encrypts data at rest (KMS, S3 encryption) |
| MP-5 | S | AWS secures media transport in DCs | Customer encrypts data in transit (TLS, VPN) |
| MP-6 | I | AWS sanitizes/destroys DC media per NIST 800-88 | — |

### PE — Physical and Environmental Protection
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| PE-1 through PE-20 | I | AWS manages all physical security, environmental controls, fire, power, HVAC, water, delivery/removal for data center facilities | — |

**Note**: PE controls are the clearest example of full inheritance in IaaS. AWS data centers
undergo SOC 2 Type II audits covering these controls. Reference the latest AWS SOC 2 report
for evidence.

### PL — Planning
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| PL-1 through PL-4 | CR | — | Customer manages own security planning |

### PM — Program Management
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| PM-1 through PM-16 | CR | — | Customer manages own security program |

### PS — Personnel Security
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| PS-1 through PS-8 | CR | — | Customer manages own personnel security |

**Note**: While AWS screens their own employees, the customer's PS controls are about
the customer's personnel — so these are customer-responsible.

### RA — Risk Assessment
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| RA-1 through RA-5 | S | AWS performs own risk assessments, provides Inspector/GuardDuty | Customer performs own risk assessments, vulnerability scanning |

### SA — System and Services Acquisition
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| SA-1 | CR | — | Customer defines SA policy |
| SA-2 | CR | — | Customer allocates resources for security |
| SA-3 | S | AWS has SDLC for own services | Customer has SDLC for own apps |
| SA-4 | S | AWS provides compliance docs (Artifact) | Customer includes security in own acquisitions |
| SA-5 | S | AWS provides service documentation | Customer documents own systems |
| SA-9 | S | AWS is the external service — see their SOC2/FedRAMP | Customer manages other external services |

### SC — System and Communications Protection
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| SC-1 | CR | — | Customer defines SC policy |
| SC-4 | I | AWS hypervisor prevents shared resource info leakage | — |
| SC-5 | S | AWS Shield Standard provides DDoS baseline | Customer configures Shield Advanced, WAF |
| SC-7 | S | AWS provides VPC, NACLs, SGs, PrivateLink | Customer configures boundary protections |
| SC-8 | S | AWS encrypts between AZs, provides ACM/TLS | Customer configures TLS on own endpoints |
| SC-12 | S | AWS KMS manages key infrastructure | Customer manages own keys and key lifecycle |
| SC-13 | S | AWS provides FIPS-validated crypto modules | Customer selects FIPS endpoints, configures encryption |
| SC-17 | S | AWS provides ACM for PKI certificates | Customer manages certificate lifecycle |
| SC-28 | S | AWS provides EBS/S3/RDS encryption at rest | Customer enables and configures encryption |

### SI — System and Information Integrity
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| SI-1 | CR | — | Customer defines SI policy |
| SI-2 | S | AWS patches infrastructure/hypervisor | Customer patches OS, applications |
| SI-3 | S | AWS scans infrastructure | Customer deploys malware protection on instances |
| SI-4 | S | AWS provides GuardDuty, CloudWatch, VPC Flow Logs | Customer configures monitoring and alerting |
| SI-5 | S | AWS publishes security bulletins, PHD | Customer monitors advisories, acts on them |
| SI-7 | S | AWS verifies infrastructure integrity | Customer implements integrity checking (file integrity, code signing) |

### SR — Supply Chain Risk Management
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| SR-1 through SR-12 | S | AWS manages own supply chain (hardware, software) | Customer manages own software supply chain, third-party dependencies |

## Service-Specific Overrides

When the customer uses managed services, some controls shift further toward Inherited:

### Amazon RDS / Aurora (Managed Database)
- CM-2, CM-6: More inherited — AWS manages DB engine config baselines
- SI-2: More inherited — AWS patches the DB engine
- MA-2: More inherited — AWS handles DB maintenance windows
- CP-9: More inherited — automated backups, snapshots

### AWS Lambda (Serverless)
- CM-2, CM-6: More inherited — no OS to configure
- SI-2: Fully inherited — no OS patching
- MA-2: More inherited — no instance maintenance
- SC-4: Fully inherited — execution environment isolation

### Amazon S3 (Object Storage)
- SC-28: Shared — AWS provides encryption options, customer enables them
- AU-9: Shared — AWS provides S3 Object Lock, customer configures
- CP-9: More inherited — built-in durability (11 nines)

### AWS EKS (Managed Kubernetes)
- CM-2: Shared — AWS manages control plane, customer manages worker nodes
- SI-2: Shared — AWS patches control plane, customer patches worker node OS and containers
- SC-7: Shared — AWS manages VPC CNI, customer configures network policies
