---
name: compliance-evidence-guide
description: Generates auditor-ready compliance evidence packages — a DOCX narrative guide plus an XLSX evidence matrix — by mapping any framework (SOC 2, HIPAA, PCI DSS, ISO 27001, NIST 800-53, FedRAMP, CMMC, HITRUST) to any CSP's native services (AWS, Azure, GCP). Use whenever the user asks for an "evidence collection guide", "evidence matrix", "control matrix mapped to AWS/Azure/GCP", "audit evidence package", or pairs a framework name with a CSP and wants documentation listing each control plus the specific CSP services, console paths, and artifacts that satisfy it. Trigger on casual phrasing — "make me a HIPAA Azure evidence guide", "SOC 2 Type 2 package for GCP", "PCI DSS on AWS". Always trigger when the user names BOTH a framework AND a CSP and asks for documentation. Produces both DOCX and XLSX with consistent structure, conditional formatting, dropdowns, and an Inherited tab for controls evidenced via the CSP's own attestation.
---

# Compliance Evidence Guide Generator

Produces a matched pair of deliverables for any (framework, CSP) combination:

1. **`<FW>_<CSP>_Evidence_Guide.docx`** — narrative guide with shared responsibility, evidence sourcing principles, foundational services, and one block per control listing services + evidence + console path + cadence + owner.

2. **`<FW>_<CSP>_Evidence_Matrix.xlsx`** — trackable workbook with Cover, Evidence Matrix (status + risk dropdowns, conditional formatting), Inherited from CSP, framework-specific extra tabs, and Legend & Summary with COUNTIF roll-ups.

The two outputs have the same structure across every (framework, CSP) combination — what varies is the data plugged in. This skill's job is to assemble that data correctly and run the builder.

---

## Workflow

### Step 1 — Identify the framework and CSP

The user names both. Common phrasings:
- "HIPAA AWS evidence collection guide"
- "Make me a SOC 2 Azure package"
- "I need PCI DSS for GCP"
- "ISO 27001 control matrix for our Azure tenant"

If either is missing or ambiguous, ask. Don't guess.

For the framework, check `references/frameworks/README.md` to map the user's wording to the right reference file. For the CSP, check `references/csps/README.md`. If the user names something not yet bundled, offer to write a stub using `_template.md`.

### Step 2 — Read the framework and CSP references

Read these two files end to end before drafting any data:

- `references/frameworks/<slug>.md` — control inventory, ID format, sections, R/A or other type flag, inherited citations, framework-specific evidence principles, retention requirements
- `references/csps/<slug>.md` — service catalog, foundational services list, attestation portal, BAA/agreement (if framework needs one), inherited controls, region/sovereign considerations, gotchas

The framework reference tells you WHAT controls to cover. The CSP reference tells you WHAT services produce evidence. Your job is the mapping between the two.

### Step 3 — Read the architecture and schema references

- `references/architecture.md` — the DOCX/XLSX structure the builder produces
- `references/data_schema.md` — the JSON shape the builder consumes

These are short and important. Skim them.

### Step 4 — Build the data file

Assemble a JSON file matching the schema in `references/data_schema.md`. Structure:

1. `framework` block — copy from the framework reference's metadata block
2. `csp` block — copy from the CSP reference's metadata block; include `foundational_services` (paste the JSON array from the CSP reference)
3. `deliverable_name_stem` — `<FW_SHORT>_<CSP_SHORT>` (e.g., `HIPAA_AWS`)
4. `purpose_paragraph` — write a 4–6 sentence cover paragraph naming the framework, the CSP, what the guide covers, the shared responsibility split, and (for HIPAA/regulated data) the BAA prerequisite
5. `evidence_sourcing_principles` — 4–6 bullets. Start from the framework reference's principles list, then add CSP-specific bullets (e.g., GCP's Data Access logs being off by default, AWS CloudTrail Data Events being off by default)
6. `categories` — for each section in the framework, list every control with:
    - `id` — exact ID from the framework
    - `name` — short name
    - `type` — if framework has a type column (e.g., HIPAA R/A)
    - `description` — text from the standard (verbatim or close)
    - `services` — semicolon-separated CSP services from the catalog
    - `evidence` — concrete artifact name(s), specific, not vague
    - `path` — console click-path or CLI command following the CSP's conventions
    - `frequency` — cadence
    - `owner` — function name
7. `inherited` — citations evidenced by the CSP's attestation (from the framework reference's "Standard inherited citations" list)
8. `extra_xlsx_tabs` — framework-mandated extras (e.g., HIPAA needs Required vs Addressable; ISO 27001 needs Statement of Applicability)
9. `evidence_retention_bullets` — 5–8 bullets for the DOCX retention section, framework-anchored
10. `references` — citation list with URLs

### Step 5 — Validate the data file shape

```bash
python3 -c "import json; json.load(open('<path>/<stem>_package_data.json'))"
```

JSON syntax check. The builder is tolerant of missing optional fields.

### Step 6 — Run the builder

```bash
python3 <skill-path>/scripts/build_evidence_package.py \
    <path>/<stem>_package_data.json \
    --out-dir <user-output-directory>
```

This writes:
- `<stem>_Evidence_Guide.docx`
- `<stem>_Evidence_Matrix.xlsx`

The builder installs `python-docx` and `openpyxl` if not present.

### Step 7 — Validate the outputs

Quick sanity check:

```bash
python3 -c "
import zipfile, xml.etree.ElementTree as ET
with zipfile.ZipFile('<stem>_Evidence_Guide.docx') as z:
    ET.fromstring(z.read('word/document.xml'))
    print('DOCX OK')
from openpyxl import load_workbook
wb = load_workbook('<stem>_Evidence_Matrix.xlsx')
print('XLSX OK — sheets:', wb.sheetnames)
em = wb['Evidence Matrix']
print('Matrix rows:', em.max_row)
"
```

### Step 8 — Share with the user

Save the deliverables to the user's workspace folder. Provide `computer://` links to both files and a 2–3 sentence summary of what's in each. Do not re-explain the contents at length — the user can open the files.

---

## Large frameworks (>100 controls)

PCI DSS, NIST 800-53 Moderate/High, FedRAMP, full HIPAA, and ISO 27001 Annex A all approach or exceed 100 sub-requirements. Trying to author the full data in one in-memory pass produces inconsistencies and runs into context limits.

Use the multi-file Python + JSON intermediate pattern:

```
build/
├── <fw>_data_part1.py        # Controls 1.x or family AC
├── <fw>_data_part2.py        # Controls 2.x or family AU
├── ...
├── merge.py                  # Imports all parts, writes <fw>_data.json
└── <fw>_data.json            # Single source of truth
```

Each data file exports a dict keyed by control ID. The merge script combines them in framework-required order, serializes to JSON, and the builder consumes the merged JSON.

See `references/architecture.md` (the "Build approach for large frameworks" section) for details.

---

## Quality checklist before delivering

Spot-check before handing the files to the user:

- [ ] Framework and CSP names appear correctly on the DOCX cover and XLSX cover
- [ ] At least one inherited citation appears in both the DOCX bullets and the XLSX Inherited tab
- [ ] The Evidence Matrix freezes panes at `C2` so headers stay visible
- [ ] Services + Evidence columns have amber headers and amber cell fills (the "this is the action block" treatment)
- [ ] Status and Risk Level dropdowns work; conditional formatting colors them
- [ ] If the framework has a type column (HIPAA R/A, etc.), the type cells are color-coded
- [ ] Legend & Summary's COUNTIF formulas reference the correct columns
- [ ] Console paths follow the CSP's conventions (e.g., "Cloud Storage -> Lifecycle management" for GCP, not "S3 -> Lifecycle")
- [ ] Service names use the CSP's preferred capitalization (e.g., "Microsoft Entra ID" not "Azure AD"; "Amazon S3" not "S3 bucket")

---

## Adding a new framework or CSP

**New framework** — copy `references/frameworks/_template.md` to `<slug>.md` and fill in: builder metadata block, sections list, ID format, standard inherited citations, framework-specific evidence principles, citation text source. Add to the `references/frameworks/README.md` table.

**New CSP** — copy `references/csps/_template.md` to `<slug>.md` and fill in: builder metadata block, service catalog by control domain, standard inherited controls, foundational services list, console/CLI conventions, region/sovereign considerations, gotchas. Add to the `references/csps/README.md` table.

After adding, the skill workflow picks up the new framework or CSP automatically — no code changes needed.

---

## Why this skill exists

Compliance evidence guides are high-leverage but mechanical: the same 60–250 controls map to the same set of cloud services in the same way, over and over. The variance is in how the user describes the engagement (which framework, which CSP, which baseline, which regulatory overlay) — not in the underlying structure of the output. This skill captures the structure once so each new (framework, CSP) combination is a data-assembly exercise, not a from-scratch authoring exercise.

The pattern proved out across five hand-built guides (SOC 2 on AWS / Azure / GCP, HIPAA on AWS / GCP). The DOCX/XLSX shape, the amber treatment for the evidence-source columns, the Inherited tab, the immutable-storage guidance, and the COUNTIF roll-ups all turn out to be invariant across frameworks. What changes is which controls and which services — exactly what the references parameterize.
