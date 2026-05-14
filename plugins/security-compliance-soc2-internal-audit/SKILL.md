---
name: soc2-internal-audit
description: >
  SOC 2 Type II internal audit assistant. Use this skill whenever the user wants to:
  review uploaded policies or evidence against SOC 2 Trust Services Criteria (TSC),
  populate a SOC 2 control audit tracker spreadsheet, assess whether controls are
  implemented and operating effectively, identify gaps or deficiencies in their SOC 2
  controls, complete audit finding fields (Result, Exception Details, Risk Rating,
  Remediation), or generate a completed SOC 2 audit findings .xlsx file. Trigger on
  phrases like "review my SOC 2 controls", "assess this evidence for SOC 2", "fill in
  the audit tracker", "check this against SOC 2", "audit my SOC 2 controls", "complete
  the SOC 2 findings", "test my controls", or any time the user uploads a document
  alongside a SOC 2 audit-related request. Also trigger when the user mentions Trust
  Services Criteria, Common Criteria (CC), Availability criteria, Confidentiality
  criteria, or references control IDs like CC 6.1, CC 7.2, A 1.1, C 1.1, etc.
---

# SOC 2 Type II Internal Audit Skill

This skill helps complete a SOC 2 internal audit by reviewing uploaded policies and
evidence against the AICPA Trust Services Criteria, assessing control design and
operating effectiveness, identifying gaps, and populating a control audit tracker.

---

## Data Sources

This skill uses two key files:

### 1. Requirements Source: `soc2.json`

The JSON file is the **authoritative source** for all SOC 2 control requirements. It
is bundled in `assets/soc2.json`. The user may also upload their own copy.

**JSON structure:**
```json
{
  "catalog": {
    "securityControls": [
      {
        "controlId": "CC1.1",
        "title": "CC1.1 - The entity demonstrates a commitment to integrity...",
        "description": "COSO Principle 1: The entity demonstrates...",
        "family": "CONTROL ENVIRONMENT",
        "objectives": [
          {
            "name": "Objective 1",
            "description": "Sets the Tone at the Top — The board of directors..."
          },
          ...
        ]
      },
      ...
    ]
  }
}
```

**Key fields to use:**
- `controlId` → maps to the **Control ID** column (e.g., "CC1.1", "A1.2", "P3.1")
- `title` → maps to the **Control Description** column
- `family` → the TSC domain (e.g., "CONTROL ENVIRONMENT", "Logical and Physical Access Controls")
- `objectives[]` → each objective maps to a **Point of Focus** row. Generate **one row
  per objective** in the output tracker. The objective's `description` field contains the
  Point of Focus text.

**Row generation rule:** For a control with N objectives, generate N rows — all sharing
the same Control ID and Control Description, but each with a different Point of Focus
from the objective descriptions.

### 2. Output Target: SOC 2 Control Audit Tracker (CSV/XLSX)

The CSV file is the **output template** where audit results are written. The user uploads
a blank copy of this tracker, and the skill populates it with findings.

---

## Output Spreadsheet Columns

The SOC 2 Control Audit Tracker has these columns (23 total):

| Column | Description |
|---|---|
| Control ID | From JSON `controlId` (e.g., CC1.1, CC6.2, A1.1, PI1.3, P3.1) |
| Control Description | From JSON `title` |
| Point of Focus | From JSON `objectives[].description` — one row per objective |
| **Documents** | **Policies, procedures, and/or plans that fulfill this control (semicolon-separated if multiple). See `references/evidence-guide.md` for the full per-control document mapping.** |
| **Implemented (Y/N)** | **Whether the control is implemented** |
| **How to Close The Gap** | **Guidance on closing any identified gap** |
| **Control Owner** | **Team or Role: Security, IT, DevOps, HR, Compliance** |
| **Frequency** | **Daily, Weekly, Monthly, Quarterly, Annually, Ad Hoc** |
| **Control Type** | **Preventive or Detective** |
| **Evidence Required** | **What evidence to collect (logs, screenshots, reports, configs, tickets, policies, alerts)** |
| **Test Procedure** | **Inquiry, Inspection, Reperformance, Observation** |
| **Sample Size** | **Number or % of Population** |
| **Population** | **Total Count** |
| **Test Performed (Y/N)** | **Whether the test was performed** |
| **Result (Pass/Fail)** | **Outcome of the test** |
| **Exceptions Found (#)** | **Number of exceptions** |
| **Exception Details** | **Description of exceptions found** |
| **Risk Rating** | **Low, Medium, High, Critical** |
| **Remediation Required (Y/N)** | **Whether remediation is needed** |
| **Remediation Owner** | **Team or role responsible for fix** |
| **Target Remediation Date** | **YYYY-MM-DD** |
| **Status** | **Not Started, In Progress, Complete, Blocked** |
| **Notes** | **Free text for additional context** |

---

## SOC 2 Trust Services Criteria Overview

The JSON contains 69 controls across 13 families. Here is the full mapping:

| Criteria Series | JSON `family` Value | Key Focus |
|---|---|---|
| CC 1.x | CONTROL ENVIRONMENT | Integrity, ethics, board oversight, org structure, HR, accountability |
| CC 2.x | COMMUNICATION AND INFORMATION | Information quality, internal/external communication |
| CC 3.x | RISK ASSESSMENT | Objectives, risk identification, fraud risk, change assessment |
| CC 4.x | MONITORING ACTIVITIES | Ongoing/separate evaluations, deficiency communication |
| CC 5.x | CONTROL ACTIVITIES | Risk mitigation controls, technology controls, policy deployment |
| CC 6.x | Logical and Physical Access Controls | Access management, authentication, encryption, physical security, disposal, boundary protection, data transmission, malware prevention |
| CC 7.x | System Operations | Configuration management, vulnerability scanning, monitoring, incident detection, incident response, recovery |
| CC 8.x | Change Management | SDLC, change authorization, testing, approval, deployment, emergency changes |
| CC 9.x | Risk Mitigation | Business continuity, insurance, vendor management, third-party risk |
| A 1.x | ADDITIONAL CRITERIA FOR AVAILABILITY | Capacity management, environmental protections, backup, recovery testing |
| C 1.x | ADDITIONAL CRITERIA FOR CONFIDENTIALITY | Confidential information identification, retention, disposal |
| PI 1.x | ADDITIONAL CRITERIA FOR PROCESSING INTEGRITY | Input completeness/accuracy, processing validation, output delivery, error correction |
| P 1.x–P 8.x | ADDITIONAL CRITERIA FOR PRIVACY | Notice, choice/consent, collection, use/retention/disposal, access, disclosure, quality, monitoring/enforcement |

---

## Workflow

### Step 1 — Load the requirements from JSON

Read the `soc2.json` file (either from the skill's `assets/` directory or the user's
upload). Parse the `catalog.securityControls` array. This gives you all 69 controls
with their objectives.

Build the full row list: for each control, create one row per objective. This typically
produces 280+ rows in the output tracker.

### Step 2 — Understand what the user has uploaded

When the user uploads files alongside the JSON/CSV, identify what each one is:

- **Policy documents** (Access Control Policy, Incident Response Plan, Change Management Policy, etc.)
- **Evidence artifacts** (screenshots, access review exports, vulnerability scan reports, change tickets, training records, config exports, alert dashboards, etc.)
- **The audit tracker CSV** (the blank output template)
- **The soc2.json** (the requirements source)

Ask clarifying questions if it's unclear what a document is or which controls it relates to.

### Step 3 — Map documents to SOC 2 control areas

Use the Control-to-Document Reference in `references/evidence-guide.md` to map each
uploaded document to the relevant Control IDs. Read this file before assessing:

```
Read references/evidence-guide.md from the skill directory
```

A single policy may cover many control IDs. For example, an Access Control Policy
could cover CC6.1 through CC6.3. Map broadly, then narrow during assessment.

### Step 4 — Assess each control

For each control covered by the uploaded materials, evaluate and populate these fields:

1. **Documents**: List all policies, procedures, and plans that fulfill this control. Use the
   comprehensive per-control mapping in `references/evidence-guide.md` (the "Documents by Control ID"
   section). A single control often requires multiple documents — list them all, separated by
   semicolons. For example: "Access Control Policy; Identity & Access Management Procedure;
   User Access Review Report". When the user uploads a document, match it to the controls it
   covers and populate this field. If no document exists for a control, leave blank or note
   "No document provided."
2. **Implemented (Y/N)**: Based on whether the policy/evidence demonstrates the control exists
3. **How to Close The Gap**: If not implemented or partially implemented, describe what's missing
4. **Control Owner**: Infer from the document (e.g., "Security Team" if it's a security policy) or ask the user
5. **Frequency**: Determine from the evidence how often the control operates
6. **Control Type**: Classify as Preventive (stops bad things) or Detective (finds bad things after the fact)
7. **Evidence Required**: List what evidence an auditor would need to see for this control
8. **Test Procedure**: Select the appropriate method:
   - **Inquiry**: Asking personnel about the control
   - **Inspection**: Examining documents, records, or reports
   - **Reperformance**: Re-executing the control to verify it works
   - **Observation**: Watching the control being performed
9. **Sample Size / Population**: Recommend based on frequency and risk (see sampling guidance below)
10. **Test Performed**: Y if evidence was actually tested, N if only policy was reviewed
11. **Result (Pass/Fail)**: Based on evidence review:
    - **Pass**: Evidence demonstrates the control is designed appropriately AND operating effectively
    - **Fail**: Evidence shows the control is missing, poorly designed, or not operating as intended
12. **Exceptions Found**: Count of issues identified
13. **Exception Details**: Specific description of what failed and why
14. **Risk Rating**: Assign based on the risk rating matrix below
15. **Remediation Required**: Y if Result is Fail, N if Pass
16. **Remediation Owner**: The team or role that should fix it (ask user if unsure)
17. **Target Remediation Date**: Suggest reasonable timeline based on risk rating
18. **Status**: Not Started (default for new findings), or as user specifies
19. **Notes**: Any additional context, caveats, or observations

### Step 5 — Generate the completed output

After completing the assessment, write the results to the CSV tracker or produce a
formatted `.xlsx` file. Two output paths:

**Path A — Write to CSV:** If the user provided a blank CSV tracker, read it, populate
the rows by matching Control ID + Point of Focus, and write the updated CSV back.

**Path B — Generate XLSX:** Use the xlsx skill to produce a properly formatted `.xlsx`
file. **Before writing any code, read the xlsx SKILL.md** for formatting best practices.

Use `openpyxl` to build the file. Key formatting rules:

- Header row with all 23 column names
- Pre-populate Control ID, Control Description, and Point of Focus from the JSON
- Column widths: Control ID(14), Control Description(40), Point of Focus(50),
  Documents(45), Implemented(12), Gap Closure(35), Owner(18), Frequency(14),
  Type(14), Evidence(35), Test Procedure(18), Sample(12), Population(12),
  Tested(12), Result(10), Exceptions(12), Exception Details(40), Risk Rating(12),
  Remediation Req(14), Remediation Owner(18), Target Date(16), Status(14), Notes(35)
- Result cell colors:
  - Pass -> light green fill `#C6EFCE`
  - Fail -> light red fill `#FFC7CE`
- Risk Rating cell colors:
  - Low -> light green fill `#C6EFCE`
  - Medium -> light yellow fill `#FFEB9C`
  - High -> light orange fill `#FFCC99`
  - Critical -> light red fill `#FFC7CE`
- Status cell colors:
  - Complete -> light green fill `#C6EFCE`
  - In Progress -> light blue fill `#BDD7EE`
  - Not Started -> light yellow fill `#FFEB9C`
  - Blocked -> light red fill `#FFC7CE`
- Wrap text in all content cells
- Freeze the top row (header)
- Font: Arial 10pt for data rows, Arial 11pt bold for header
- Auto-filter on all columns

---

## Risk Rating Matrix

| Criteria | Low | Medium | High | Critical |
|---|---|---|---|---|
| Control gap severity | Minor documentation gap | Partial implementation | Significant design flaw | Control completely absent |
| Likelihood of exploitation | Unlikely | Possible | Likely | Almost certain |
| Business impact | Minimal | Moderate | Significant | Severe / regulatory |
| Example | Missing version on a policy | Access reviews done but not documented | No MFA on admin accounts | No incident response plan at all |

When multiple factors point to different ratings, weight toward the highest severity.

---

## Sampling Guidance

| Control Frequency | Recommended Sample Size | Population Basis |
|---|---|---|
| Daily (365/yr) | 25-30 samples | Total daily occurrences in audit period |
| Weekly (52/yr) | 5-10 samples | Total weekly occurrences in audit period |
| Monthly (12/yr) | 2-4 samples | Total monthly occurrences in audit period |
| Quarterly (4/yr) | 2 samples | All quarterly occurrences in audit period |
| Annually (1/yr) | 1 sample (the instance) | 1 |
| Ad Hoc / Event-driven | 3-5 samples minimum | Total events in audit period |

For higher-risk controls, increase sample sizes by 25-50%.

---

## Handling Partial Uploads

The user may not upload evidence for every control. In that case:

- Rows with no uploaded evidence: leave audit fields blank, or note "Not reviewed — no evidence provided" in Notes
- Only assess rows where evidence was actually provided
- At the end, summarize which control areas were reviewed and which were skipped
- Suggest which missing areas to prioritize based on risk

---

## Asking for Missing Information

Always ask the user:

- Who owns the remediation items (Remediation Owner)?
- What are reasonable target dates (Target Remediation Date)?
- Should unreviewed rows be left blank or marked "Not Reviewed"?
- What is the audit period (needed for population counts)?
- Are there any controls the organization has formally excluded from scope?
- Which TSC categories are in scope? (Security is always required; Availability,
  Confidentiality, Processing Integrity, and Privacy are optional add-ons)

If the user's documents don't address a specific evidence requirement but the control
seems important, note it in the Gap Closure column as "Confirm whether this is
documented or implemented elsewhere."

---

## Output Format

When presenting results to the user before generating the XLSX, structure your
assessment as a summary table:

```
| Control ID | Point of Focus | Documents | Result | Risk Rating | Key Finding |
|------------|---------------|-----------|--------|-------------|-------------|
| CC6.1 | Identifies and Authenticates Users | Access Control Policy; MFA Config Export | Pass | — | MFA enforced per policy |
| CC7.1 | Conducts Vulnerability Scans | (none provided) | Fail | High | No scan reports provided |
...
```

Then ask for confirmation before generating the final output file.

---

## Design vs. Operating Effectiveness

SOC 2 Type II audits evaluate both dimensions. Help the user distinguish:

- **Design Effectiveness**: Is the control designed to meet the criteria? (Does the policy exist and address the requirement?)
- **Operating Effectiveness**: Is the control actually working as designed over the audit period? (Is there evidence it was executed consistently?)

A control can be well-designed but poorly operated (e.g., great access review policy but reviews weren't actually done), or poorly designed but coincidentally effective. Flag both dimensions in the Exception Details when relevant.
