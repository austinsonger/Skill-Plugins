# Deliverable Architecture

Each generated package is two files:

1. `<Framework>_<CSP>_Evidence_Guide.docx` — the narrative guide
2. `<Framework>_<CSP>_Evidence_Matrix.xlsx` — the trackable matrix

## DOCX structure (the narrative)

| Section | Content |
|---|---|
| Cover | Framework name + version, "{CSP} Evidence Collection Guide", scope line, purpose box in CSP-colored amber/blue |
| 1. {CSP} Shared Responsibility Model | One-paragraph SRM, bullet list of inherited citations |
| 2. Evidence Sourcing Principles | 3–5 bullets, framework-specific |
| 3. Foundational {CSP} Services | 8–12 services bullet list with one-liner each |
| 4. Control-by-Control Evidence Detail | The bulk — one bordered table block per control, then 4 prose fields (Services, Evidence, Where to find, Cadence + Owner) |
| 5. Evidence Retention and Auditor Handoff | 5–8 bullets, framework-anchored |
| 6. References | Citation list with URLs |

CSP color palette is applied to headings and accents:
- AWS: navy + AWS-orange
- Azure: dark blue + Azure blue
- GCP: deep blue + Google blue

## XLSX structure (the matrix)

| Sheet | Content |
|---|---|
| Cover | Metadata table + instructions + amber Evidence Derivation Note |
| Evidence Matrix | One row per control with status/risk dropdowns; amber-highlighted services + evidence columns |
| Inherited from {CSP} | Citations satisfied by the CSP's attestation |
| (framework-specific extra tabs) | e.g., "Required vs Addressable" for HIPAA; "Statement of Applicability" for ISO 27001 |
| Legend & Summary | Status / Risk / Type definitions and COUNTIF roll-ups |

### Evidence Matrix columns (left to right)

1. Category
2. Control ID (label per framework — Criterion ID, Citation, Requirement, etc.)
3. Standard / Specification (the control's name)
4. (OPTIONAL) Type (R/A or similar — only for frameworks with a type flag)
5. Description (the control's full text)
6. {CSP} Services (Evidence Source) — amber header + amber cell
7. Evidence to Retain — amber header + amber cell
8. Console Path / CLI
9. Cadence
10. Owner
11. Status (dropdown: Not Started / In Progress / Evidence Collected / Reviewed / N/A)
12. Risk Level (dropdown: Critical / High / Medium / Low / Informational)
13. Evidence Location (path/URL) — user fills during audit
14. Notes — user fills during audit

### Conditional formatting

- Status column auto-fills color based on value
- Risk Level column auto-fills using the severity palette (red / orange / amber / green / gray)
- For frameworks with a type column: Required = red fill / Addressable = amber fill

### Freeze panes

`C2` — keeps Category, ID, and the header row visible while scrolling.

## Build approach for large frameworks (>100 controls)

PCI DSS, NIST 800-53 Moderate/High, FedRAMP, full HIPAA, ISO 27001 Annex A all approach or exceed 100 sub-requirements. Trying to author the full data in one in-memory pass produces inconsistencies and context overflow.

**Pattern**: split source data across multiple Python files grouped by natural framework boundary, merge into a single JSON intermediate, pass the JSON to the builder.

```
build/
├── <fw>_data_part1.py        # Controls 1.x or family A
├── <fw>_data_part2.py        # Controls 2.x or family B
├── ...
├── merge.py                  # Imports all parts, writes <fw>_data.json
└── <fw>_data.json            # Single source of truth for build_evidence_package.py
```

Each data file exports a dict keyed by control ID. The merge step combines them in the order required by the framework, converts internal data structures to JSON-safe types, and writes the merged JSON.

## File naming

- Output DOCX: `<FW>_<CSP>_Evidence_Guide.docx`
- Output XLSX: `<FW>_<CSP>_Evidence_Matrix.xlsx`
- Data file: `<FW>_<CSP>_package_data.json`

Use `deliverable_name_stem` in the data file to control the file stem (e.g., `"HIPAA_AWS"`, `"SOC2_GCP"`).
