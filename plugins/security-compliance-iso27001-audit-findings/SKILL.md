---
name: iso27001-audit-findings
description: >
  ISO/IEC 27001:2022 internal audit assistant. Use this skill whenever the user wants to:
  review uploaded policies or evidence against ISO 27001 requirements, populate an internal
  audit findings spreadsheet, assess conformity of uploaded documents, identify gaps or
  nonconformities in their ISMS, complete audit finding fields (Finding Category, Description,
  Improvement Plan), or generate a completed audit findings .xlsx file. Trigger on phrases
  like "review my policy", "assess this evidence", "fill in the audit findings", "check this
  against ISO 27001", "audit my ISMS", "complete the findings sheet", or any time the user
  uploads a document alongside an audit-related request.
---

# ISO 27001:2022 Internal Audit Findings Skill

This skill helps complete an ISO/IEC 27001:2022 internal audit findings spreadsheet by
reviewing uploaded policies and evidence, assessing conformity, identifying gaps, and
populating the relevant columns.

---

## Spreadsheet Structure

The audit findings sheet has these columns to fill:

| Column | Description |
|---|---|
| Nr. | Row number (pre-populated) |
| Clause / Control | ISO clause or Annex A control (pre-populated) |
| Control/Clause Requirement | What the standard requires (pre-populated) |
| Evidence Recommendation | What evidence auditors expect (pre-populated) |
| Reviewed on Oneleet Platform | Yes / No / Blank |
| **Finding Category** | **Must populate: see categories below** |
| **If Finding Identified: Description** | **Must populate if finding exists** |
| **Improvement Plan** | **Must populate if finding exists** |
| Improvement Plan Owner | Ask user or leave blank |
| To Be Completed By | Ask user or leave blank |
| Status | Open / In Progress / Closed |

### Finding Categories
- **Conformity** — Requirement is fully met by the evidence provided
- **Observation** — Minor concern or opportunity for improvement; not yet a nonconformity
- **Minor Nonconformity** — Partial or incomplete implementation; risk is low
- **Major Nonconformity** — Systematic failure or complete absence of a required control

---

## Workflow

### Step 1 — Understand what the user has uploaded

When the user uploads files, identify what each one is:
- Policy documents (Access Control Policy, Incident Response Plan, Risk Management Policy, etc.)
- Evidence artifacts (screenshots, logs, reports, training records, audit reports, etc.)
- The audit template itself (the CSV/XLSX)

Ask if anything is unclear about what was uploaded.

### Step 2 — Identify which clauses/controls each document covers

Map each uploaded document to the relevant ISO 27001:2022 clause(s) or Annex A control(s).
Use the reference guide at the bottom of this skill for clause-to-document mappings.

### Step 3 — Assess each covered clause/control

For each clause or control covered by the uploaded materials:

1. **Read the Control/Clause Requirement** for that row
2. **Read the Evidence Recommendation** for that row
3. **Evaluate the uploaded document** against both
4. **Assign a Finding Category**:
   - Conformity: all evidence requirements are addressed
   - Observation: mostly met but missing minor details or best practices
   - Minor Nonconformity: partially implemented, missing key elements
   - Major Nonconformity: control is absent or fundamentally not implemented
5. **Write the Finding Description** (if not Conformity):
   - Be specific — reference what's missing or incomplete
   - Quote the clause/control requirement
   - Note which evidence recommendation was not satisfied
6. **Write the Improvement Plan** (if not Conformity):
   - Actionable and specific
   - Tie back to what the evidence recommendation calls for

### Step 4 — Generate the completed XLSX

After completing the assessment, use the xlsx skill to produce a properly formatted
`.xlsx` file with all assessed rows populated. Follow these rules:

**Before writing any code, read `/mnt/skills/public/xlsx/SKILL.md`** for formatting
requirements.

Use `openpyxl` to build the file. Key formatting rules:
- Preserve the two-row header (merged cells on row 1 for section labels)
- Column widths: Nr.(5), Clause(25), Requirement(40), Evidence Rec.(40),
  Oneleet(12), Finding Category(18), Description(45), Improvement Plan(45),
  Owner(18), Deadline(15), Status(12)
- Finding Category cell colors:
  - Conformity → light green fill `#C6EFCE`
  - Observation → light yellow fill `#FFEB9C`
  - Minor Nonconformity → light orange fill `#FFCC99`
  - Major Nonconformity → light red fill `#FFC7CE`
- Wrap text in all content cells
- Freeze the top 2 rows (header rows)
- Font: Arial 10pt for data rows

---

## Handling Partial Uploads

The user may not upload evidence for every clause. In that case:
- Rows with no uploaded evidence → leave Finding Category blank, or note
  "Not reviewed — no evidence provided" in the Description column
- Only assess rows where evidence was actually provided
- At the end, summarize which clauses were reviewed and which were skipped

---

## Asking for Missing Information

If the user's uploaded documents don't address a specific evidence requirement but
the clause seems important, note it as an **Observation** and flag it in the
Improvement Plan as "Confirm whether this is documented elsewhere."

Always ask the user:
- Who owns the improvement items (Improvement Plan Owner)?
- What deadline to set (To Be Completed By)?
- Should unreviewed rows be left blank or marked "Not Reviewed"?

---

## Clause-to-Document Quick Reference

Use this to quickly identify which policies are expected for each clause/control group:

| Clause/Control Area | Expected Documents |
|---|---|
| Clauses 4.1–4.4 (Context) | ISMS scope, ISMS manual |
| Clause 5.x (Leadership) | IS Policy, roles & responsibilities, management review records |
| Clause 6.1–6.3 (Planning) | Risk assessment, risk treatment plan, SOA, change mgmt policy |
| Clause 6.2 (Objectives) | IS objectives, KPIs |
| Clause 7.x (Support) | Training records, doc control policy, awareness acknowledgments |
| Clause 8.x (Operation) | Risk register, operational procedures, change records |
| Clause 9.x (Performance) | Internal audit report, management review minutes |
| Clause 10.x (Improvement) | Corrective action plan, nonconformance records |
| Controls 5.1–5.4 (Policies/Org) | All topic-specific policies, employee agreements |
| Controls 5.15–5.18 (Access) | Access Control Policy, access review records |
| Controls 5.19–5.22 (Suppliers) | Third-Party Management Policy, vendor agreements |
| Controls 5.24–5.28 (Incidents) | Incident Response Plan, incident reports |
| Controls 5.29–5.30 (Continuity) | BCDR Plan, DR test records |
| Controls 6.1–6.8 (HR) | HR Security Policy, training records, NDAs, exit interviews |
| Controls 7.x (Physical) | Physical Security Policy, infra provider certs |
| Controls 8.1–8.9 (Technical) | Access Control, Operations Security, config baselines |
| Controls 8.24–8.34 (Development) | Secure Development Policy, pen test reports, QA records |

---

## Output Format

When presenting results to the user before generating the XLSX, structure your
assessment as a summary table:

```
| Nr. | Clause | Finding Category | Key Finding |
|-----|--------|-----------------|-------------|
| 31  | Control 5.1 | Conformity | All policies present and approved |
| 45  | Control 5.15 | Minor Nonconformity | Access request evidence missing |
...
```

Then ask for confirmation before generating the final XLSX file.
