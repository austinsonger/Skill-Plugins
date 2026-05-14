# HIPAA (Security Rule + Breach Notification Rule)

**Authoritative source.** 45 CFR Parts 160 and 164 — Security Rule (Subpart C, §164.302–318), Breach Notification Rule (Subpart D, §164.400–414), and where applicable Privacy Rule (Subpart E).

**Use this for**: HIPAA Security Rule attestation, OCR audit preparation, business-associate readiness, or any deliverable mapping HIPAA citations to cloud-native evidence.

## Builder metadata block

```json
"framework": {
  "name":        "HIPAA Security & Breach Notification Rules",
  "short_name":  "HIPAA",
  "scope":       "45 CFR Parts 160 & 164 — Administrative, Physical, Technical Safeguards; Breach Notification",
  "id_label":    "Citation",
  "type_column": {
    "header": "Type (R/A)",
    "values": {
      "R": {"label": "Required",    "fill": "C00000", "text": "FFFFFF"},
      "A": {"label": "Addressable", "fill": "FFC000", "text": "000000"}
    }
  },
  "authoritative_source": "45 CFR Parts 160 & 164"
}
```

## Sections (use verbatim as category names)

| Category name | Range |
|---|---|
| `Administrative Safeguards (§164.308)` | §164.308(a)(1)–(b)(3) — 30 standards/specs |
| `Physical Safeguards (§164.310)` | §164.310(a)(1)–(d)(2)(iv) — 12 standards/specs |
| `Technical Safeguards (§164.312)` | §164.312(a)(1)–(e)(2)(ii) — 13 standards/specs |
| `Organizational & Documentation (§164.314, §164.316)` | §164.314(a)(1)–164.316(b)(2)(iii) — 7 standards/specs |
| `Breach Notification Rule (§164.400–414)` | §164.402, 404, 406, 408, 410, 414(b) — 6 items |

## Required (R) vs Addressable (A)

**R (Required):** mandatory; implement as written.

**A (Addressable):** the entity must (1) implement, OR (2) implement an equivalent alternative, OR (3) document why neither is reasonable and appropriate. **Addressable is NOT optional.** The decision and rationale must be retained 6 years per §164.316(b)(2)(i).

## Full citation inventory

(The complete list of 67 standards / implementation specifications is too long to reproduce here. The reference HIPAA evidence guides already built — `HIPAA_GCP_Evidence_Guide.docx` and `HIPAA_AWS_Evidence_Guide.docx` — contain the full text. Pull the citation, name, R/A flag, and description from those guides. The list is stable and authoritative.)

### Quick R/A counts
- Required: 45
- Addressable: 22
- Total: 67

## Standard inherited citations (most CSPs)

- §164.308(b)(1) — Business Associate Contracts (CSP is the BA; evidenced by signed BAA)
- §164.310(a)(1) — Facility Access Controls (data center)
- §164.310(a)(2)(i)–(iv) — Facility contingency, security plan, validation, maintenance
- §164.310(d)(2)(i) — Disposal (data center media)
- §164.310(d)(2)(ii) — Media re-use (data center)
- §164.314(a) — BA contract terms (governed by BAA)

## Required extra_xlsx_tabs

A "Required vs Addressable" tab must be included. Suggested rows:

```json
{
  "title": "Required vs Addressable",
  "headers": ["Type", "Definition"],
  "rows": [
    ["Required (R)", "Implementation is mandatory. The covered entity / business associate must implement the specification as written."],
    ["Addressable (A)", "The covered entity / business associate must (1) implement if reasonable and appropriate, OR (2) implement an equivalent alternative measure, OR (3) document why neither is required and what is done in its place. Addressable is NOT optional. The decision and rationale must be retained 6 years per §164.316(b)(2)(i)."]
  ]
}
```

## HIPAA-specific evidence sourcing principles

- **Six-year retention** (§164.316(b)(2)(i)). All documentation, risk analyses, audits, training records, and breach analyses must be retained ≥ 6 years. Configure immutable storage (Object Lock / locked retention) accordingly.
- **Audit logs for ePHI access**. §164.312(b) Audit Controls requires data-access logging. Many CSPs leave data-access logging OFF by default — it must be explicitly enabled per service that holds ePHI.
- **Defined data perimeter**. Use the CSP's perimeter controls (VPC Service Controls, VPC endpoints + SCPs, Private Endpoints) around ePHI workloads. Perimeter logs are evidence for §164.312(a)(1) and §164.312(e)(1).
- **Tie controls to SRA findings**. §164.308(a)(1)(ii)(A) Risk Analysis is the anchor — every control should be traceable to a risk it addresses.
- **BAA prerequisite**. A signed Business Associate Agreement with the CSP is the precondition for storing ePHI; the BAA acceptance record is itself evidence for §164.308(b)(1) and §164.314(a).
- **Eligible-services discipline**. Each CSP publishes a HIPAA-eligible services list under the BAA. Only those services may handle ePHI; preventive guardrails (SCPs / Organization Policies / Azure Policy) should block ePHI from non-eligible services.

## Citation text source

Pull each citation's text from 45 CFR Parts 160 and 164. The two reference HIPAA guides already built contain the full set with practitioner-tested descriptions.

## Typical evidence retention bullets

- 6-year retention rule (§164.316(b)(2)(i)) — configure Object Lock / locked retention policy ≥ 2,200 days.
- Enable data-access audit logs for every CSP service holding ePHI.
- Annual Security Risk Analysis (SRA), refreshed after every significant change.
- Quarterly access reviews; semi-annual at minimum.
- Annual DR test; backup restore tests quarterly.
- Walk OCR through inherited controls first (BAA + CSP SOC 2 Type II), then customer-side configuration evidence, then policies.
