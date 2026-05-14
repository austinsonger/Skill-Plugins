# PCI DSS 4.0.1

**Authoritative source.** PCI DSS v4.0.1 (PCI Security Standards Council, June 2024). The framework includes 12 top-level Requirements with ~249 sub-requirements, each accompanied by "Testing Procedures" prescribing examine / interview / observe activities.

**Use this for**: PCI DSS ROC narrative input, SAQ evidence catalog, QSA fieldwork prep, or any deliverable mapping PCI DSS requirements to cloud-native evidence.

## Builder metadata block

```json
"framework": {
  "name":        "PCI DSS 4.0.1",
  "short_name":  "PCIDSS",
  "scope":       "12 Requirements, ~249 sub-requirements protecting cardholder data",
  "id_label":    "Requirement",
  "authoritative_source": "PCI DSS v4.0.1 (PCI SSC, June 2024)"
}
```

No `type_column` (PCI DSS has no R/A; instead it has "applies until 31 March 2025" / "after 31 March 2025" date markers — handle in description or notes).

## Sections (use verbatim as category names)

| Category | Sub-requirement count (approximate) |
|---|---|
| `Req 1 — Install and Maintain Network Security Controls` | ~30 |
| `Req 2 — Apply Secure Configurations to All System Components` | ~10 |
| `Req 3 — Protect Stored Account Data` | ~30 |
| `Req 4 — Protect Cardholder Data with Strong Cryptography During Transmission` | ~6 |
| `Req 5 — Protect All Systems and Networks from Malicious Software` | ~14 |
| `Req 6 — Develop and Maintain Secure Systems and Software` | ~22 |
| `Req 7 — Restrict Access to System Components and Cardholder Data by Business Need to Know` | ~12 |
| `Req 8 — Identify Users and Authenticate Access to System Components` | ~30 |
| `Req 9 — Restrict Physical Access to Cardholder Data` | ~22 |
| `Req 10 — Log and Monitor All Access to System Components and Cardholder Data` | ~25 |
| `Req 11 — Test Security of Systems and Networks Regularly` | ~26 |
| `Req 12 — Support Information Security with Organizational Policies and Programs` | ~24 |

## ID format

Use the official sub-requirement numbering: `1.1.1`, `1.2.5`, `8.3.6`, `10.4.1.1`, etc.

## Standard inherited citations (most CSPs)

The CSP typically satisfies physical-data-center controls (Req 9 majority), portions of host hardening (Req 2 host-OS level), and parts of media disposal (Req 9.4):
- Req 9.1 — Physical access controls (data center)
- Req 9.2 — Physical access for personnel (data center)
- Req 9.4 — Media security (data center disposal)

Pull the CSP's PCI DSS Attestation of Compliance (AoC) from the attestation portal as inherited evidence.

## Citation text source

PCI DSS 4.0.1 standard PDF (PCI SSC member portal). The standard's "Testing Procedures" column is the authoritative evidence-source guide for each sub-requirement.

## Build pattern for large frameworks

Because PCI DSS has ~249 sub-requirements, follow the multi-file Python data + JSON intermediate pattern:

1. Split source data into Python files by requirement (`pci_data_req1.py` ... `pci_data_req12.py`).
2. Merge into a single JSON intermediate.
3. Pass the merged JSON to the builder.

This keeps each authoring file under ~50-60 sub-requirements and ensures DOCX/XLSX consistency.

## Typical extra_xlsx_tabs

Consider adding:
- `Future-Dated Requirements` — list of requirements that became effective on 31 March 2025 (transition tracker).
- `Compensating Controls` — register of any compensating controls (if applicable to the entity).

## PCI DSS evidence sourcing principles

- **Cardholder Data Environment (CDE) scope first.** Evidence is only meaningful within the defined CDE. Document the CDE perimeter in the cover sheet's purpose paragraph.
- **Testing Procedures are the spec for evidence.** Each sub-requirement's Testing Procedure (Examine / Interview / Observe) tells you exactly what artifact to retain.
- **Three-year and one-year retention.** Req 10 (audit logs) requires ≥ 12 months retention with the last 3 months immediately available. Other documentation: 3 years minimum.
- **Quarterly internal vulnerability scans + annual penetration test.** Reqs 11.3 (internal scans), 11.3.2 (external scans by ASV), 11.4 (penetration testing). All artifacts retained.
- **Defined-period operating evidence.** PCI is an assessment over a period — like SOC 2 Type 2, screenshots of a single point in time are insufficient.

## Typical evidence retention bullets

- Retain audit logs ≥ 12 months (≥ 3 months immediately available) per Req 10.5.1.
- Retain all documentation ≥ 3 years per Req 12.10.
- Retain quarterly internal scan reports + ASV external scan reports for the audit period.
- Retain annual penetration test report and remediation evidence.
- Maintain CDE scope diagram and asset inventory current at all times.
