# Builder Data Schema

The `build_evidence_package.py` script consumes a single JSON file describing the (framework, CSP, controls, ...) and writes the DOCX + XLSX pair.

## Top-level shape

```json
{
  "framework":               { ... },          // REQUIRED — see frameworks/<slug>.md
  "csp":                     { ... },          // REQUIRED — see csps/<slug>.md
  "deliverable_name_stem":   "HIPAA_AWS",      // OPTIONAL — default: "<framework.short_name>_<csp.short_name>"
  "version":                 "1.0",            // OPTIONAL — default: "1.0"
  "date":                    "May 2026",       // OPTIONAL

  "purpose_paragraph":       "This guide maps ...",   // REQUIRED — appears in DOCX cover purpose box
  "evidence_sourcing_principles": [             // REQUIRED — DOCX section 2 bullets
    {"name": "Six-year retention.", "body": "§164.316(b)(2)(i) requires ..."}
  ],
  "evidence_retention_bullets": [              // REQUIRED — DOCX section 5 bullets
    "Retain audit logs for the full audit period plus one year ..."
  ],
  "references": [                              // REQUIRED — DOCX section 6 bullets
    "AICPA TSP Section 100 ..."
  ],

  "categories": [                              // REQUIRED — at least one
    {
      "name": "Administrative Safeguards (§164.308)",
      "rows": [
        {
          "id":          "164.308(a)(1)(i)",
          "name":        "Security Management Process",
          "type":        "R",                  // OPTIONAL — only if framework.type_column is set
          "description": "Implement policies ...",
          "services":    "AWS Security Hub; AWS CloudTrail",
          "evidence":    "Information security program charter; ...",
          "path":        "Security Hub -> Settings -> General",
          "frequency":   "Annual + continuous",
          "owner":       "Security / Compliance",
          "default_risk": "Medium"             // OPTIONAL — default: "Medium"
        }
      ]
    }
  ],

  "inherited": [                               // OPTIONAL — appears in DOCX section 1 bullets and XLSX Inherited tab
    {
      "id":       "164.310(a)(1)",
      "why":      "Physical access to AWS data centers is operated and controlled by AWS.",
      "evidence": "AWS SOC 2 Type II report (AWS Artifact -> Reports)."
    }
  ],

  "xlsx_instructions": [                       // OPTIONAL — overrides default instructions on XLSX cover sheet
    "1. Confirm the BAA is accepted before ePHI is uploaded.",
    "2. ..."
  ],

  "derivation_note": "Evidence statements ...", // OPTIONAL — overrides default amber note on XLSX cover

  "extra_xlsx_tabs": [                         // OPTIONAL — extra sheets after Inherited tab
    {
      "title":   "Required vs Addressable",
      "headers": ["Type", "Definition"],
      "rows": [
        ["Required (R)",    "Implementation is mandatory ..."],
        ["Addressable (A)", "..."]
      ]
    }
  ]
}
```

## Validation rules

The builder script does NOT do strict schema validation — it tolerates missing optional fields and unrecognized keys. To validate your data file before building, run:

```bash
python3 -c "import json; json.load(open('path/to/data.json'))"
```

This catches malformed JSON. Beyond that, the builder will simply omit missing optional fields from the output.

## Field-by-field notes

### `framework` block

See each `references/frameworks/<slug>.md` for the framework's specific metadata block.

### `csp` block

See each `references/csps/<slug>.md` for the CSP's specific metadata block (including `foundational_services`, which gets copied into the DOCX Section 3).

### `categories[].name`

Used as both the XLSX category column value AND the DOCX section heading. Use the framework's official section names verbatim.

### `categories[].rows[].id`

Use the framework's exact control ID format (e.g., `CC6.1`, `164.308(a)(1)(i)`, `A.5.15`, `AC-2(3)`, `1.2.5`).

### `categories[].rows[].type`

Only set if `framework.type_column` is configured. The value must match one of the keys in `framework.type_column.values`.

### `categories[].rows[].description`

The control's authoritative text, pulled verbatim or near-verbatim from the framework standard. Keep paraphrasing minimal — auditors compare to the standard.

### `categories[].rows[].services`

The CSP services that produce evidence, joined with semicolons. Pull names verbatim from the CSP reference file (e.g., `references/csps/aws.md`). Use the CSP's preferred capitalization.

### `categories[].rows[].evidence`

The artifact(s) the auditor will accept. Be specific:
- Bad: "logs"
- Good: "Organization trail covering all accounts/regions, log file validation enabled, destination S3 bucket with KMS-CMK encryption and Object Lock"

### `categories[].rows[].path`

Console click-path or CLI command. Use the format conventions in the CSP reference file (e.g., `Console -> IAM & Admin -> Privileged Access Manager` for GCP; `IAM -> Policies` for AWS).

### `categories[].rows[].frequency`

Cadence aligned with the framework's expectation (e.g., "Continuous" for detective controls, "Annual" for risk analyses, "Quarterly" for access reviews, "Per event" for incident records).

### `categories[].rows[].owner`

The function responsible (e.g., "Security / Compliance", "SRE", "HR / Legal"). Used to set defaults in the XLSX matrix — the customer overrides during fieldwork.

## Build command

```bash
python3 scripts/build_evidence_package.py path/to/package_data.json --out-dir path/to/outputs
```

Produces `<stem>_Evidence_Guide.docx` and `<stem>_Evidence_Matrix.xlsx` in the output directory.
