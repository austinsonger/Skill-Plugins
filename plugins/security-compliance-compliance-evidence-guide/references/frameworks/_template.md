# Framework Reference Template

Copy this file to `references/frameworks/<framework-slug>.md` and fill in the sections. The skill's main workflow reads this file when the user asks for a guide for the framework, so the more thorough this reference, the better the generated guide.

## Authoritative source

Cite the exact standard, version, and section ranges.

## Builder metadata block

```json
"framework": {
  "name":        "Human-readable name including version",
  "short_name":  "FILESAFE",
  "scope":       "One-sentence scope statement",
  "id_label":    "Column header for the control ID",
  "type_column": {                           // OPTIONAL — only if the framework has a per-control type flag
    "header": "Type",
    "values": {
      "R": {"label": "Required",    "fill": "C00000", "text": "FFFFFF"},
      "A": {"label": "Addressable", "fill": "FFC000", "text": "000000"}
    }
  },
  "authoritative_source": "Citation to the standard document"
}
```

Omit `type_column` if not applicable.

## Sections (categories)

List the framework's top-level groupings (e.g., control families, requirement groups, sections). The builder uses these as XLSX categories and DOCX H2 headings. Use verbatim official names.

## ID format

Show the exact ID format used in the standard with examples.

## Standard inherited citations (most CSPs)

List the citations typically satisfied by the CSP's own attestation report. Reduces customer-side test burden and goes on the Inherited tab.

## Required extra_xlsx_tabs

List any framework-mandated extra tabs (e.g., HIPAA needs a Required vs Addressable tab; ISO 27001 needs a Statement of Applicability tab). Include the JSON shape for each.

## Framework-specific evidence sourcing principles

3-5 bullets that the generated guide should include in its Evidence Sourcing Principles section.

## Citation text source

Where to pull the exact citation text from (and any copyright considerations).

## Build pattern (for large frameworks)

If the framework has > 100 sub-requirements / controls, recommend the multi-file Python + JSON intermediate pattern (see `references/architecture.md`).

## Typical evidence retention bullets

3-5 bullets for the generated guide's Evidence Retention section, anchored to the framework's specific retention requirements.
