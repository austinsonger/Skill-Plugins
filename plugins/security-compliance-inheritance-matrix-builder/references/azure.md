# Azure Inheritance Reference — NIST 800-53 Control Families

This file provides common inheritance patterns for Microsoft Azure IaaS/PaaS services.
Based on the Azure Shared Responsibility Model. Always validate against the customer's
specific deployment and the latest Azure documentation.

## Table of Contents
1. [Service Model Impact](#service-model-impact)
2. [Control Family Defaults (IaaS)](#control-family-defaults-iaas)
3. [Service-Specific Overrides](#service-specific-overrides)

## Service Model Impact

Azure uses a layered responsibility model:
- **Microsoft responsibility**: Physical hosts, network, datacenter
- **Shared**: Depends on service type (IaaS vs PaaS vs SaaS)
- **Customer responsibility**: Data, endpoints, accounts, access management

## Control Family Defaults (IaaS — e.g., VMs, VNets)

### AC — Access Control
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| AC-1 | CR | — | Customer defines access control policy |
| AC-2 | S | Azure provides Entra ID (formerly AAD), RBAC | Customer manages users, groups, roles, conditional access |
| AC-3 | S | Azure enforces RBAC engine | Customer assigns roles, configures resource-level access |
| AC-4 | S | Azure provides VNets, NSGs, Azure Firewall | Customer configures NSG rules, UDRs, firewall policies |
| AC-5 | S | Azure provides RBAC, PIM | Customer implements separation of duties via role assignments |
| AC-6 | S | Azure provides granular RBAC, PIM just-in-time | Customer configures least privilege, uses PIM |
| AC-7 | S | Azure Entra ID supports smart lockout | Customer configures lockout policies |
| AC-8 | CR | — | Customer configures login banners |
| AC-17 | S | Azure provides VPN Gateway, Bastion, ExpressRoute | Customer configures remote access methods |
| AC-18 | I | Microsoft manages wireless in data center facilities | — |

### AT — Awareness and Training
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| AT-1 through AT-4 | CR | — | Customer manages all training |

### AU — Audit and Accountability
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| AU-1 | CR | — | Customer defines audit policy |
| AU-2 | S | Azure Activity Log, Entra sign-in logs auto-captured | Customer enables diagnostic settings, defines audit events |
| AU-3 | S | Azure logs include required detail fields | Customer ensures app-level logs have required content |
| AU-4 | S | Azure manages platform log capacity | Customer manages Log Analytics workspace sizing/retention |
| AU-5 | S | Azure Monitor provides alerting | Customer configures alerts on audit processing failures |
| AU-6 | S | Azure provides Sentinel, Log Analytics | Customer reviews logs per defined frequency |
| AU-8 | I | Azure synchronizes time across infrastructure | — |
| AU-9 | S | Azure protects platform log integrity | Customer configures immutable storage, RBAC on log workspaces |
| AU-12 | S | Azure generates activity/resource logs | Customer enables and routes diagnostic logging |

### CA — Assessment, Authorization, and Monitoring
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| CA-1 through CA-9 | CR | — | Customer manages own assessment program |

### CM — Configuration Management
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| CM-1 | CR | — | Customer defines CM policy |
| CM-2 | S | Azure provides VM images, ARM templates | Customer establishes and maintains baselines |
| CM-3 | S | Azure provides Policy, Change Tracking | Customer manages change control process |
| CM-6 | S | Azure provides Policy, Defender for Cloud benchmarks | Customer configures per CIS/STIG benchmarks |
| CM-7 | S | Azure provides NSGs, application control (Defender) | Customer restricts functions, ports, protocols |
| CM-8 | S | Azure provides Resource Graph, asset inventory | Customer maintains CMDB and component inventory |

### CP — Contingency Planning
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| CP-1 | CR | — | Customer defines CP policy |
| CP-2 | S | Azure provides paired regions, availability zones | Customer develops contingency plan |
| CP-6 | S | Azure provides geo-redundant storage (GRS) | Customer configures alternate storage |
| CP-7 | S | Azure provides multiple regions, Traffic Manager | Customer configures failover |
| CP-9 | S | Azure Backup, snapshots, ASR | Customer configures backup policies and recovery points |

### IA — Identification and Authentication
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| IA-1 | CR | — | Customer defines I&A policy |
| IA-2 | S | Azure provides Entra ID, MFA, passwordless | Customer enforces MFA, manages authenticators |
| IA-4 | S | Azure manages infrastructure identifiers | Customer manages Entra ID identities |
| IA-5 | S | Azure provides password policies, FIDO2, cert auth | Customer manages credential lifecycle |
| IA-8 | S | Azure provides B2B/B2C, external identities | Customer configures external user authentication |

### IR — Incident Response
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| IR-1 | CR | — | Customer defines IR policy |
| IR-4 | S | Microsoft handles platform incidents, publishes Service Health | Customer handles application-layer incidents |
| IR-5 | S | Azure provides Sentinel, Defender alerts | Customer monitors and tracks own incidents |
| IR-6 | S | Microsoft reports to customers via Service Health | Customer reports to own stakeholders/authorities |

### MA — Maintenance
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| MA-2 | S | Microsoft maintains physical infrastructure, host OS | Customer maintains guest OS, apps |
| MA-3 | I | Microsoft controls DC maintenance tools | — |
| MA-5 | I | Microsoft vets DC maintenance personnel | — |

### MP — Media Protection
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| MP-6 | I | Microsoft sanitizes/destroys DC media | — |
| MP-4 | S | Microsoft encrypts at platform level | Customer enables/configures encryption (disk encryption, storage encryption) |

### PE — Physical and Environmental Protection
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| PE-1 through PE-20 | I | Microsoft manages all DC physical/environmental security | — |

### PL, PM, PS — Planning, Program Management, Personnel Security
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| All PL, PM, PS | CR | — | Customer manages own planning, program, and personnel |

### RA — Risk Assessment
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| RA-3 | S | Microsoft performs own risk assessments | Customer performs own risk assessments |
| RA-5 | S | Microsoft provides Defender for Cloud vulnerability assessment | Customer configures and acts on scan results |

### SC — System and Communications Protection
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| SC-4 | I | Azure hypervisor prevents shared resource info leakage | — |
| SC-5 | S | Azure DDoS Protection Basic included | Customer configures DDoS Protection Standard, WAF |
| SC-7 | S | Azure provides VNets, NSGs, Azure Firewall, Private Link | Customer configures boundary protections |
| SC-8 | S | Azure encrypts intra-datacenter traffic | Customer configures TLS on own services |
| SC-12 | S | Azure Key Vault manages key infrastructure | Customer manages keys, rotation, policies |
| SC-13 | S | Azure provides FIPS-validated modules | Customer selects FIPS endpoints |
| SC-28 | S | Azure provides disk/storage encryption options | Customer enables and configures encryption |

### SI — System and Information Integrity
| Control | Default | CSP Responsibility | Customer Responsibility |
|---|---|---|---|
| SI-2 | S | Microsoft patches host/hypervisor | Customer patches guest OS, applications |
| SI-3 | S | Microsoft scans infrastructure | Customer deploys Defender for Endpoint / antimalware |
| SI-4 | S | Azure provides Sentinel, Defender, NSG flow logs | Customer configures monitoring and alerting |

## Service-Specific Overrides

### Azure SQL Database / Cosmos DB (Managed Database)
- CM-2, CM-6: More inherited — Azure manages DB engine baselines
- SI-2: More inherited — Azure patches DB engine
- CP-9: More inherited — automated backups, geo-replication

### Azure App Service (PaaS)
- SI-2: Partially inherited — Azure patches platform, customer patches app code/dependencies
- CM-2: More inherited — no OS baseline to manage
- MA-2: More inherited — no OS maintenance

### Azure Functions (Serverless)
- SI-2: Fully inherited — no OS to patch
- CM-2: Fully inherited — no infrastructure config
- MA-2: Fully inherited — no instance maintenance

### Azure Kubernetes Service (AKS)
- CM-2: Shared — Azure manages control plane, customer manages node pools and configs
- SI-2: Shared — Azure patches control plane and node images, customer triggers node upgrades
- SC-7: Shared — Azure manages VNet integration, customer configures network policies
