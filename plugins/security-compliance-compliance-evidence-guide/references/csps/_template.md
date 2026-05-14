# CSP Reference Template

Copy this file to `references/csps/<csp-slug>.md` and fill in the sections.

## Builder metadata block

```json
"csp": {
  "name":           "Full marketing name",
  "short_name":     "ShortName",
  "shared_resp":    "One paragraph describing the shared responsibility model",
  "attestation_repo": {
    "name": "Name of the CSP's compliance report portal",
    "url":  "URL"
  },
  "baa_or_agreement": {                    // OPTIONAL — only if HIPAA-relevant
    "name": "BAA name",
    "where_signed": "Where the customer signs / accepts"
  },
  "console_term":   "Column header for the portal/CLI path"
}
```

## Service catalog by control domain

Organize the CSP's services by the same domains used in the AWS/Azure/GCP references:

- Identity, RBAC, MFA
- Account / org governance
- Encryption + key management
- Logging + audit
- Threat detection + posture
- Data protection + retention
- Network protection
- Backup, DR, resilience
- Change management + IaC
- Incident response
- Compliance reports + agreements

For each service, list:
- Service name (with the CSP's preferred capitalization)
- One-line capability summary

## Standard inherited controls

Which controls are routinely satisfied by the CSP's own attestation (typically physical / data center controls). Pull from the CSP's published Customer Responsibility Matrix (CRM) if one exists.

## Foundational services list (for the DOCX Section 3)

List 8–12 services that recur across most controls. Provide a `foundational_services` JSON array block ready to paste into the builder data file.

## Console / CLI conventions

- Service naming conventions (preferred capitalization, "Cloud X" vs "Foo Service", etc.)
- Console path format
- CLI tool name and verb conventions

## Region / sovereign considerations

Government / regulated / sovereign clouds where service availability or compliance posture differs from the commercial cloud:
- Government cloud (FedRAMP / IL automatic applicability)
- China / sovereign deployments
- EU data boundary / sovereign controls
- Dedicated / on-prem variants

## CSP-specific gotchas

Anything that catches first-time auditors out — e.g., GCP Data Access logs being off by default, AWS CloudTrail Data Events being off by default, certain services not in the BAA scope.
