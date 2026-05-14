---
name: inheritance-matrix-builder
description: >
  Build control inheritance matrices that document which security controls are inherited from your
  CSP/IaaS provider, which are customer-responsible, and which are shared — formatted for SSP
  appendices or customer responsibility matrices (CRM). Supports NIST 800-53, FedRAMP, ISO 27001,
  SOC 2, and CMMC. Use this skill whenever someone mentions "inheritance", "inherited controls",
  "customer responsibility matrix", "CRM", "shared responsibility", "CSP controls", "IaaS inherited",
  "control responsibility", "SSP appendix", or asks "which controls does AWS/Azure/GCP handle for us",
  "what's inherited vs shared", "build me a responsibility matrix", or "map our controls to the cloud provider".
  Even if the user just says "inheritance matrix" or "who owns what controls" — this skill applies.
---

# Inheritance Matrix Builder

## Why This Matters

Every organization using cloud infrastructure needs to clearly document which security controls are
handled by the cloud provider, which are the customer's responsibility, and which are shared between
them. Assessors and auditors expect this mapping to be precise and traceable — vague statements like
"AWS handles physical security" don't cut it. A well-built inheritance matrix saves weeks of SSP
preparation time and prevents audit findings caused by ambiguous responsibility assignments.

## Supported Frameworks

Detect the framework from the user's input. If they mention specific control IDs, infer the framework:

| ID Pattern | Framework |
|---|---|
| AC-2, SC-7, PE-1 (two-letter family + number) | NIST 800-53 / FedRAMP |
| A.5.1, A.8.1 (Annex A format) | ISO 27001:2022 |
| CC6.1, CC7.2, A1.1, C1.1 | SOC 2 Trust Services Criteria |
| AC.L2-3.1.1, PE.L1-3.10.1 | CMMC Level 1/2/3 |

If the user doesn't specify a framework, ask. If they want multiple frameworks mapped together,
produce a unified matrix with a framework column.

## Gathering Context

Before generating the matrix, gather these essentials:

1. **Cloud provider(s)**: AWS, Azure, GCP, or other. Multi-cloud setups need a provider column.
2. **Service model**: IaaS, PaaS, SaaS, or a mix — this fundamentally changes what's inherited.
   For example, PE-family controls are almost always fully inherited in IaaS, but in SaaS,
   far more control families shift to inherited.
3. **Specific services in use**: EC2 vs. Lambda vs. RDS changes the inheritance picture.
   A managed database service (RDS, Cloud SQL) inherits more than a self-managed DB on a VM.
4. **Framework and control scope**: Which control families or specific controls to map.
   If the user says "all of NIST 800-53 moderate," that's ~325 controls. Ask if they want
   the full set or a subset (e.g., just physical/environmental, or just access control).
5. **Authorization boundary**: What's in scope. If they've done scoping work (USG zones, etc.),
   that context helps determine where shared responsibility lines fall.
6. **Existing SSP or CRM**: If the user has an existing document, read it first to understand
   their current state and fill gaps rather than starting from scratch.

## Inheritance Types

Every control gets exactly one of these designations:

| Type | Code | Meaning |
|---|---|---|
| **Inherited** | `I` | Fully provided by the CSP. The customer relies entirely on the provider's implementation. Example: PE-2 (Physical Access Authorizations) in AWS — Amazon controls who enters their data centers. |
| **Shared** | `S` | Both the CSP and customer have responsibilities. The key is documenting the boundary clearly. Example: AC-2 (Account Management) — AWS manages IAM infrastructure, but the customer creates/manages their own IAM users, roles, and policies. |
| **Customer-Responsible** | `CR` | Entirely the customer's responsibility to implement. Example: AT-2 (Security Awareness Training) — AWS doesn't train your staff. |
| **Not Applicable** | `N/A` | The control doesn't apply in this context. Must be justified. |

For each shared control, the matrix must specify: what exactly the CSP does, what exactly the
customer does, and where the handoff point is. This is where most matrices fall short — they mark
something as "Shared" without explaining the split.

## CSP Reference Data

Read the appropriate reference file based on the user's cloud provider:

- **AWS**: `references/aws.md` — Common inheritance patterns for AWS IaaS/PaaS services
- **Azure**: `references/azure.md` — Common inheritance patterns for Azure services
- **GCP**: `references/gcp.md` — Common inheritance patterns for GCP services

These files contain well-established inheritance defaults based on each provider's shared
responsibility model. They are starting points — always let the user override any designation.
Real environments are nuanced, and a control that's typically inherited might be shared if the
customer has customized their deployment.

## Building the Matrix

### Step 1: Establish the Control Set

Based on the framework and scope, list out every control that needs a designation. Group by
control family for readability (AC, AT, AU, CA, CM, CP, IA, IR, MA, MP, PE, PL, PM, PS, RA,
SA, SC, SI, SR for NIST 800-53).

### Step 2: Apply Default Inheritance Patterns

Load the CSP reference file and apply the common patterns. For IaaS environments, a rough
starting heuristic:

- **Typically Inherited**: PE-* (Physical), most of MA-* (Maintenance of physical assets),
  some SC-* (physical transmission protections)
- **Typically Shared**: AC-* (Access Control), AU-* (Audit), CM-* (Config Management),
  IA-* (Identification/Authentication), SC-* (System Communications)
- **Typically Customer-Responsible**: AT-* (Training), PL-* (Planning), PS-* (Personnel),
  IR-* (Incident Response), RA-* (Risk Assessment), CA-* (Assessment)

These are heuristics, not rules. The reference files have more granular per-control guidance.

### Step 3: Document the Shared Responsibility Split

For every control marked Shared, write two clear statements:

- **CSP Responsibility**: What the provider does (be specific — name the service/feature)
- **Customer Responsibility**: What the customer must do (be actionable)

Example for AC-2 on AWS:
- CSP: "AWS provides the IAM service, manages the IAM API/console availability, and enforces
  AWS Organizations service control policies at the platform level."
- Customer: "Customer creates and manages IAM users, groups, and roles. Customer configures
  MFA requirements, password policies, and access key rotation. Customer reviews and removes
  unused accounts per their defined frequency."

### Step 4: Handle Edge Cases

- **Managed services shift responsibility**: A control that's shared on EC2 might be inherited
  on a fully managed service (e.g., AU-6 audit review — on EC2 you manage your own logs,
  on a managed SaaS service the provider may handle this).
- **FedRAMP specifics**: If the target is FedRAMP, note that the JAB or AO may have specific
  expectations about which controls can be inherited. Some controls are expected to always have
  a customer component even in cloud (like IR-4 Incident Handling — the provider handles
  infrastructure incidents, but the customer must handle application-layer incidents).
- **Multi-cloud**: If the customer uses multiple providers, produce one matrix per provider
  or a combined matrix with a provider column. Highlight where inheritance differs across providers.

## Output Formats

Generate **both** outputs unless the user specifies otherwise:

### Excel (.xlsx)

Use the xlsx skill to create a professional spreadsheet. Read that skill first.

**Required columns:**

| Column | Description |
|---|---|
| Control Family | Two-letter code (AC, PE, etc.) |
| Control ID | Full ID (AC-2, PE-1(2), etc.) |
| Control Name | Human-readable name |
| Inheritance Type | I, S, CR, or N/A |
| CSP Responsibility | What the provider handles (blank for CR) |
| Customer Responsibility | What the customer handles (blank for I) |
| Notes | Justification, caveats, or service-specific details |

**If multi-framework:** Add a "Framework" column.
**If multi-cloud:** Add a "Cloud Provider" column.

**Formatting:**
- Color-code the Inheritance Type column: Green for Inherited, Yellow for Shared, Red/Orange for Customer-Responsible, Gray for N/A
- Freeze the header row
- Auto-filter on all columns
- Bold column headers
- Wrap text on responsibility columns

### Markdown (.md)

Generate a markdown table version grouped by control family. Include a summary section at the top:

```markdown
# Control Inheritance Matrix
## [Organization Name] — [CSP Provider] — [Framework]

### Summary
- **Total Controls**: X
- **Inherited**: X (Y%)
- **Shared**: X (Y%)
- **Customer-Responsible**: X (Y%)
- **Not Applicable**: X (Y%)

### AC — Access Control
| Control ID | Control Name | Type | CSP Responsibility | Customer Responsibility |
|---|---|---|---|---|
| AC-1 | Policy and Procedures | CR | — | Customer develops, documents... |
| AC-2 | Account Management | S | AWS provides IAM service... | Customer manages users... |
```

## What Makes a Good Matrix

A strong inheritance matrix has these qualities:

- **Specific, not generic**: "AWS manages physical access to us-east-1 data center facilities
  using biometric readers and security guards" beats "CSP handles physical security"
- **Actionable customer items**: The customer responsibility column should read like a checklist
  someone could actually execute — not abstract statements
- **Justified N/A entries**: Every N/A needs a brief reason (e.g., "N/A — no wireless networks
  in the authorization boundary")
- **Consistent granularity**: If one control has a detailed split, they all should. Auditors
  notice when PE controls get two sentences each but AC controls get two paragraphs
- **Service-aware**: The matrix should reflect the actual services in use, not generic cloud patterns

## Handling Uncertainty

If you're unsure whether a control is inherited or shared for a particular service:

1. Check the CSP reference file for that specific service
2. Default to **Shared** — it's safer to document a shared responsibility than to incorrectly
   mark something as fully inherited (which could leave a gap)
3. Add a note: "Verify with CSP documentation — inheritance may vary by service configuration"
4. Tell the user which controls you're uncertain about so they can validate
