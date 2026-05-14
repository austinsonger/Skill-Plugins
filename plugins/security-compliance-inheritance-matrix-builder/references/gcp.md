# GCP Inheritance Reference — NIST 800-53 Control Families

This file provides common inheritance patterns for Google Cloud Platform IaaS/PaaS services.
Based on Google's Shared Responsibility Model. Always validate against the customer's
specific deployment and the latest GCP documentation.

## Table of Contents
1. [Service Model Impact](#service-model-impact)
2. [Control Family Defaults (IaaS)](#control-family-defaults-iaas)
3. [Service-Specific Overrides](#service-specific-overrides)

## Service Model Impact

Google uses a "shared fate" model (evolution of shared responsibility):
- **Google responsibility**: Hardware, storage, encryption at rest by default, network,
  data center physical security, infrastructure services
- **Shared**: Identity, logging, network config, data protection settings
- **Customer responsibility**: Data classification, app-level security, access management,
  workload configuration

A distinguishing feature: GCP encrypts all data at rest by default (unlike AWS/Azure where
it's opt-in for many services). This affects SC-28 inheritance.

## Control Family Defaults (IaaS — e.g., Compute Engine, VPC)

### AC — Access Control
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| AC-1 | CR | — | Customer defines access control policy |
| AC-2 | S | Google provides Cloud Identity, IAM | Customer manages users, groups, service accounts |
| AC-3 | S | Google enforces IAM policy engine | Customer writes IAM policies, org policies |
| AC-4 | S | Google provides VPC, firewall rules, Cloud NAT | Customer configures firewall rules, VPC flow |
| AC-5 | S | Google provides IAM roles, org policy constraints | Customer implements separation of duties |
| AC-6 | S | Google provides predefined and custom IAM roles | Customer configures least privilege |
| AC-7 | S | Google Workspace/Cloud Identity supports lockout | Customer configures sign-in security settings |
| AC-8 | CR | — | Customer configures use notification banners |
| AC-17 | S | Google provides IAP, Cloud VPN, BeyondCorp | Customer configures remote access policies |
| AC-18 | I | Google manages wireless in data center facilities | — |

### AT — Awareness and Training
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| AT-1 through AT-4 | CR | — | Customer manages all training |

### AU — Audit and Accountability
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| AU-1 | CR | — | Customer defines audit policy |
| AU-2 | S | GCP provides Cloud Audit Logs (Admin Activity auto-enabled) | Customer enables Data Access logs, configures log sinks |
| AU-3 | S | Cloud Audit Logs include detailed request/response info | Customer ensures app logs have required fields |
| AU-4 | S | Google manages platform log infrastructure | Customer manages log storage in Cloud Logging/BigQuery |
| AU-6 | S | Google provides Chronicle, Security Command Center | Customer reviews and analyzes logs |
| AU-8 | I | Google synchronizes time across infrastructure | — |
| AU-9 | S | Google protects platform log integrity | Customer configures log bucket locks, IAM on log sinks |
| AU-12 | S | Google generates audit logs | Customer enables and routes logs to destinations |

### CA — Assessment, Authorization, and Monitoring
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| CA-1 through CA-9 | CR | — | Customer manages own assessment program |

### CM — Configuration Management
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| CM-1 | CR | — | Customer defines CM policy |
| CM-2 | S | Google provides Deployment Manager, Terraform support, OS images | Customer establishes baselines |
| CM-3 | S | Google provides Org Policy, Config Connector | Customer manages change control |
| CM-6 | S | Google provides Security Command Center, CIS benchmarks | Customer configures per standards |
| CM-7 | S | Google provides firewall rules, Org Policy constraints | Customer restricts functions/services |
| CM-8 | S | Google provides Cloud Asset Inventory | Customer maintains component inventory |

### CP — Contingency Planning
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| CP-1 | CR | — | Customer defines CP policy |
| CP-2 | S | Google provides multi-region, zones | Customer develops contingency plan |
| CP-6 | S | Google provides multi-region storage classes | Customer configures storage redundancy |
| CP-7 | S | Google provides multiple regions | Customer configures failover (Cloud DNS, load balancing) |
| CP-9 | S | Google provides snapshots, Cloud Storage versioning | Customer configures backups and retention |

### IA — Identification and Authentication
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| IA-1 | CR | — | Customer defines I&A policy |
| IA-2 | S | Google provides Cloud Identity, MFA, security keys | Customer enforces 2SV, manages authenticators |
| IA-4 | S | Google manages infrastructure identifiers | Customer manages Cloud Identity users/service accounts |
| IA-5 | S | Google provides password policies, FIDO security keys | Customer manages credential lifecycle |
| IA-8 | S | Google provides Workforce Identity Federation | Customer configures external user authentication |

### IR — Incident Response
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| IR-1 | CR | — | Customer defines IR policy |
| IR-4 | S | Google handles infrastructure incidents, publishes to Service Health | Customer handles application-layer incidents |
| IR-5 | S | Google provides SCC, Chronicle for monitoring | Customer monitors and tracks own incidents |
| IR-6 | S | Google notifies via Service Health Dashboard | Customer reports to own stakeholders |

### MA — Maintenance
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| MA-2 | S | Google maintains physical infrastructure, live migration | Customer maintains guest OS, apps |
| MA-3 | I | Google controls DC maintenance tools | — |
| MA-5 | I | Google vets DC maintenance personnel | — |

### MP — Media Protection
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| MP-4 | S | Google encrypts all data at rest by default | Customer manages CMEK if using customer-managed keys |
| MP-6 | I | Google sanitizes/destroys DC media | — |

### PE — Physical and Environmental Protection
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| PE-1 through PE-20 | I | Google manages all DC physical/environmental security (custom-built data centers with layered security) | — |

### PL, PM, PS — Planning, Program Management, Personnel Security
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| All PL, PM, PS | CR | — | Customer manages own planning, program, and personnel |

### RA — Risk Assessment
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| RA-3 | S | Google performs own risk assessments | Customer performs own risk assessments |
| RA-5 | S | Google provides Security Command Center, Web Security Scanner | Customer configures scanning, acts on findings |

### SC — System and Communications Protection
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| SC-4 | I | Google hypervisor (KVM-based) prevents info leakage | — |
| SC-5 | S | Google Cloud Armor provides DDoS protection | Customer configures Cloud Armor rules |
| SC-7 | S | Google provides VPC, firewall rules, Private Google Access | Customer configures boundary protections |
| SC-8 | S | Google encrypts in transit between all GCP services by default | Customer configures TLS for external endpoints |
| SC-12 | S | Google provides Cloud KMS, Cloud HSM | Customer manages keys and lifecycle |
| SC-13 | S | Google provides BoringCrypto (FIPS 140-2 validated) | Customer selects appropriate crypto settings |
| SC-28 | S | Google encrypts all data at rest by default (AES-256) | Customer manages CMEK if additional control needed |

### SI — System and Information Integrity
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| SI-2 | S | Google patches infrastructure, Titan security chips | Customer patches guest OS, apps (or uses Container-Optimized OS for auto-updates) |
| SI-3 | S | Google scans infrastructure | Customer deploys endpoint protection on instances |
| SI-4 | S | Google provides SCC, Chronicle, VPC Flow Logs | Customer configures monitoring and alerting |

## Service-Specific Overrides

### Cloud SQL / Cloud Spanner / Firestore (Managed Database)
- CM-2, CM-6: More inherited — Google manages DB engine baselines
- SI-2: More inherited — Google patches DB engine
- CP-9: More inherited — automated backups, replicas

### Cloud Run / Cloud Functions (Serverless)
- SI-2: Fully inherited — no OS to patch
- CM-2: Fully inherited — no infrastructure config
- MA-2: Fully inherited — no instance maintenance

### GKE (Managed Kubernetes)
- CM-2: Shared — Google manages control plane, customer manages node pools
- SI-2: Shared — Google provides auto-upgrade for control plane and nodes (customer enables)
- SC-7: Shared — Google manages VPC-native networking, customer configures network policies

### BigQuery (Serverless Analytics)
- SC-28: More inherited — Google encrypts at rest, manages storage layer
- CM-2: More inherited — no infrastructure to configure
- AU-2: Shared — BigQuery auto-logs queries in INFORMATION_SCHEMA, customer configures export

### Google Workspace (SaaS — if in scope)
Most controls shift significantly toward Inherited when Google Workspace is the system under review.
AC, AU, CM, SC controls are largely inherited with customer configuration of policies.
