---
name: control-testing-worksheet
description: >
  Generate control testing worksheets with test procedures, sample sizes, test methods (inquiry,
  observation, inspection, reperformance), and expected evidence. Supports NIST 800-53, ISO 27001,
  SOC 2, FedRAMP, and framework-agnostic controls. Use whenever the user wants to: create a
  control testing worksheet or test plan, generate test procedures for audit controls, determine
  sample sizes, build a testing matrix, or prepare audit workpapers. Trigger on: "test procedures
  for", "control testing worksheet", "how do I test this control", "sample size for testing",
  "audit test plan", "test matrix", "what's the test method for", or any time the user provides
  control IDs and wants to know how to test them. Also trigger when someone uploads an SSP or
  control matrix and asks for test procedures, or mentions "ToD/ToE", "test of design", "test of
  effectiveness", or "control sample". Even "how would an auditor test AC-2" or "test plan for my
  SOC 2 controls" should trigger this skill.
---

# Control Testing Worksheet Generator

You generate professional, auditor-ready control testing worksheets that define exactly how each control should be tested — the method, the sample, the steps, and what evidence to collect. These worksheets are what auditors and internal assessment teams use to systematically verify that controls are designed properly and operating effectively.

## Why This Matters

A control testing worksheet is the bridge between "we have controls" and "we can prove they work." Without well-defined test procedures, auditors either wing it (inconsistent results) or over-test (wasted effort). A good worksheet tells the tester exactly what to do, what to look for, how many items to check, and what a passing result looks like — so two different testers testing the same control would reach the same conclusion.

## Supported Frameworks

The skill adapts test procedures based on the framework context:

- **NIST 800-53 rev 4/5** — Control IDs like AC-2, SC-7, IA-5. Test procedures align with NIST SP 800-53A assessment procedures (examine, interview, test).
- **FedRAMP** — NIST 800-53 with FedRAMP parameter values and additional testing rigor. When FedRAMP context is detected (authorization boundary, 3PAO, JAB, FedRAMP-specific parameters), incorporate the stricter requirements.
- **ISO 27001:2022** — Annex A controls (A.5.1 through A.8.34) and ISMS clauses (4–10). Test procedures map to conformity assessment.
- **SOC 2 Trust Services Criteria** — CC-series, plus A (Availability), C (Confidentiality), PI (Processing Integrity). Test procedures address both design and operating effectiveness per AICPA guidance.
- **Framework-agnostic** — When the user provides control descriptions without a specific framework, generate sensible test procedures based on the control's nature.

Infer the framework from control ID format when not explicitly stated:
- `AC-2`, `SC-7`, `IA-5(1)` → NIST 800-53
- `A.5.1`, `A.8.12` → ISO 27001
- `CC6.1`, `A1.2`, `C1.1` → SOC 2

## Input Methods

The skill accepts controls from two sources:

### Direct Input
The user provides control IDs and/or descriptions in their prompt. Examples:
- "Generate test procedures for AC-2, AC-6, and IA-5"
- "Create a testing worksheet for CC6.1 through CC6.8"
- Pastes a list of control IDs

### Document Parsing
The user uploads a file (SSP, control matrix, policy document, or spreadsheet) and asks for test procedures. In this case:
1. Read the uploaded document
2. Extract the controls listed (look for control ID columns, section headers, or control descriptions)
3. Confirm the extracted control list with the user before generating procedures
4. Generate test procedures for each identified control

## Gathering Context

Before generating the worksheet, ask the user for relevant context (use judgment — not every question applies to every request):

1. **Audit type** — Internal audit, external audit prep, 3PAO assessment, readiness assessment? This affects the rigor and formality of test procedures.
2. **Audit period** — What time period is being tested? (e.g., Jan 1 – Dec 31, 2025). Needed for population counts and sample size calculations.
3. **Framework** — If not obvious from the control IDs.
4. **Output format** — .xlsx, .docx, or both? Default to .xlsx if unspecified since it's most practical for tracking.
5. **Organization context** — Tech stack, team size, key tools — useful for making evidence expectations specific rather than generic.
6. **Scope** — Test of Design only (ToD), Test of Effectiveness only (ToE), or both? Default to both.

If the user has provided context in prior messages, reuse it.

## Test Methods

Every control test uses one or more of these four methods. The right method depends on what aspect of the control you're verifying:

### Inquiry
Asking personnel about the control — how it works, who's responsible, what happens when exceptions occur. Inquiry alone is never sufficient for operating effectiveness; it must be corroborated with at least one other method.

**When to use:** Every control should include some inquiry to confirm understanding. Especially important for controls with human judgment components (risk acceptance decisions, exception approvals, incident triage).

**What it looks like in practice:** "Interview the IAM team lead and ask them to describe the account provisioning process, including how access requests are approved and who has authority to grant privileged access."

### Observation
Watching a control being performed in real time. The tester observes the control activity as it happens, rather than examining records after the fact.

**When to use:** Process-oriented controls where the *how* matters as much as the *what* — security operations center monitoring, physical access procedures, incident response drills, change advisory board meetings.

**What it looks like in practice:** "Observe a CAB meeting and verify that change requests are presented with risk assessments, tested results, and rollback plans before approval is granted."

### Inspection (Examination)
Examining documents, records, configurations, logs, or reports to determine whether the control operated as described. This is the most common method for operating effectiveness testing.

**When to use:** Any control that produces artifacts — access review reports, vulnerability scan results, configuration exports, policy documents, ticket histories, audit logs.

**What it looks like in practice:** "Inspect a sample of 25 access provisioning tickets from the audit period. For each ticket, verify that (a) a request form was submitted, (b) manager approval was documented before access was granted, and (c) access was provisioned within the scope requested."

### Reperformance
The tester independently re-executes the control or a portion of it to verify it produces the expected result. This is the strongest form of evidence but also the most resource-intensive.

**When to use:** Automated controls (firewall rules, automated alerts, access enforcement mechanisms), calculations, reconciliations, and any control where you can independently verify the output.

**What it looks like in practice:** "Attempt to authenticate to the VPN without MFA enabled on a test account. Verify that access is denied. Then enable MFA and confirm successful authentication."

## Recommended Method Selection

Use this as a starting point — the actual method depends on the specific control:

| Control Nature | Primary Method | Supporting Method |
|---|---|---|
| Policy / governance | Inspection | Inquiry |
| Access management (provisioning) | Inspection (of tickets/logs) | Inquiry, Reperformance |
| Access management (enforcement) | Reperformance | Inspection (config) |
| Monitoring / detection | Inspection (alerts/logs) | Reperformance, Observation |
| Change management | Inspection (change records) | Observation (CAB), Inquiry |
| Incident response | Inspection (incident reports) | Observation (drills), Inquiry |
| Physical security | Observation | Inspection (logs), Inquiry |
| Automated/technical controls | Reperformance | Inspection (config exports) |
| Training / awareness | Inspection (records) | Inquiry |
| Backup / recovery | Reperformance (restore test) | Inspection (backup logs) |
| Vendor management | Inspection (assessments/contracts) | Inquiry |

## Sample Size Determination

### Standard AICPA/ISACA Guidance (Default)

These are the widely accepted sample sizes based on control operating frequency. Use these as the default unless the user specifies custom requirements:

| Control Frequency | Occurrences/Year | Recommended Sample | Rationale |
|---|---|---|---|
| Multiple times daily | 365+ | 25 | Statistical sampling for high-frequency automated or manual controls |
| Daily | 365 | 25 | Standard daily control sample per AICPA guidance |
| Weekly | 52 | 5 | Covers ~10% of population, sufficient for moderate frequency |
| Biweekly | 26 | 3 | Proportional to occurrence frequency |
| Monthly | 12 | 2–3 | Small population; 2 covers ~17% |
| Quarterly | 4 | 2 | Half the population provides strong coverage |
| Semi-annually | 2 | 1–2 | Test all or nearly all occurrences |
| Annually | 1 | 1 | Only one occurrence; test it |
| Ad hoc / event-driven | Varies | 3–5 minimum | Enough to establish a pattern; may increase based on volume |

**Risk-based adjustments:**
- High-risk controls (privileged access, financial processing, data protection): increase sample by 25–50%
- Key controls (controls the external auditor will rely on): increase sample by 25%
- Controls with prior exceptions: increase sample by 50–100%
- New controls (implemented during the audit period): test all occurrences if feasible

### Population-Based Sampling

When the user provides a specific population size or requests statistical rigor, use this approach:

| Population Size | Sample Size (90% confidence, 10% error) | Sample Size (95% confidence, 5% error) |
|---|---|---|
| 50 | 25 | 44 |
| 100 | 39 | 80 |
| 250 | 49 | 152 |
| 500 | 55 | 217 |
| 1,000 | 58 | 278 |
| 5,000+ | 60 | 357 |

For most internal audits, 90% confidence / 10% error rate is acceptable. External audits and FedRAMP assessments typically expect 95% confidence / 5% error rate.

**Formula reference:** n = (Z² × p × (1-p)) / E², adjusted for finite population. Use p = 0.5 (maximum variability) when the expected exception rate is unknown.

Always show the user which approach you used and why.

## Output Columns

The testing worksheet includes these columns:

| Column | Description |
|---|---|
| Control ID | Framework control identifier (e.g., AC-2, CC6.1, A.8.5) |
| Control Title | Short name of the control |
| Control Description | What the control requires |
| Test of Design (ToD) | Procedure for verifying the control is *designed* properly — typically inspection of policies, procedures, and configurations |
| Test of Effectiveness (ToE) | Procedure for verifying the control *operated* correctly over the audit period — typically inspection of evidence samples, reperformance, or observation |
| Test Method(s) | Which methods apply: Inquiry, Observation, Inspection, Reperformance |
| Control Frequency | How often the control operates (Daily, Weekly, Monthly, Quarterly, Annually, Ad Hoc) |
| Population | Total number of control occurrences in the audit period |
| Sample Size | Number of items to test, with rationale |
| Expected Evidence | Specific artifacts the tester should request or collect |
| Pass Criteria | What "pass" looks like — the specific conditions that must be met |
| Fail Criteria | What constitutes a failure or exception |
| Risk Level | Inherent risk of the control area (Low, Medium, High, Critical) |
| Control Owner | Team or role responsible for the control |
| Tester | Blank — to be filled by the testing team |
| Test Date | Blank — to be filled during testing |
| Result | Blank — Pass/Fail to be filled during testing |
| Exceptions | Blank — to be filled if exceptions found |
| Notes | Blank — for tester observations |

## Writing Test Procedures

### Test of Design (ToD)

The ToD verifies that a control *exists* and is *designed* to address the risk. It typically involves:
- Inspecting the governing policy or procedure document
- Verifying the control description matches what's documented
- Confirming the control addresses the stated objective
- Reviewing the configuration or workflow design

**Template structure:**
```
1. Obtain and review [specific document/policy] to confirm it addresses [control requirement].
2. Verify the [policy/procedure] defines [specific elements: roles, frequency, scope, thresholds].
3. Confirm through inquiry with [role] that the documented process reflects actual practice.
4. Inspect [system/tool configuration] to verify settings align with the documented control design.
```

### Test of Effectiveness (ToE)

The ToE verifies the control *operated consistently* over the audit period. It involves testing actual evidence from the period:

**Template structure:**
```
1. Obtain the population of [control activity] for the audit period [date range].
2. Select a sample of [N] items using [random/systematic] selection.
3. For each sampled item, verify:
   a. [Specific attribute 1 — e.g., "a documented approval exists prior to access provisioning"]
   b. [Specific attribute 2 — e.g., "the approved scope matches the access actually granted"]
   c. [Specific attribute 3 — e.g., "provisioning occurred within the SLA defined in the policy"]
4. Document any exceptions where the attributes above are not met.
```

### Writing Principles

**Be specific about what to check.** Don't write "verify the control is working." Write "verify that each sampled change ticket includes (a) a description of the change, (b) a documented risk assessment, (c) test results, (d) approval by someone other than the requester, and (e) post-implementation verification."

**Include the sequence.** Test steps should follow the natural order a tester would follow: get the population → select samples → obtain evidence → verify attributes → document results.

**Name real artifacts.** Instead of "review relevant documentation," say "obtain the quarterly access review report from Okta" or "export the firewall rule set from Palo Alto Panorama."

**Use the user's tech stack throughout.** If the user said they use Okta, AWS, and CrowdStrike, apply those tools wherever they're relevant — not just for the "obvious" controls. For change management, that might mean "inspect AWS CloudTrail for deployment events" or "review Jira/ServiceNow change tickets." For monitoring it might mean "review CrowdStrike Falcon alerts." Don't let any row fall back to generic language when a specific tool was provided.

**Define pass/fail clearly.** "The control passes if all sampled items demonstrate [specific conditions]. An exception exists if any item is missing [specific element] or if [specific condition] is not met."

**Scale the procedure to the risk.** A high-risk control like privileged access management gets a detailed 6-step procedure with multiple verification points. A low-risk control like policy review gets a 3-step procedure confirming the document exists, is current, and was approved.

## Matching Output Scope to the Request

Before generating anything, pause and read the user's request for scope signals. Output scope should match what was actually asked for — not be maximized.

**Scope signals to watch for:**
- "just xlsx" / "just a spreadsheet" / "quick" / "simple" → produce the .xlsx only. No companion markdown files, no README, no guides, no supplementary docs.
- "both xlsx and docx" / "a document too" → produce both formats.
- "formal documentation" / "audit package" / "comprehensive" → produce the full docx plus any supporting materials.
- Unspecified → default to xlsx only (it's the most practical working format). Mention in your response that a docx is also available if they need it.

The reason this matters: audit teams are practical people who asked for a worksheet because they want to work in a spreadsheet. Unsolicited extra files create noise, clutter the output folder, and make them wonder what they're supposed to do with the extras. Resist the urge to over-deliver — a focused, high-quality worksheet is worth more than five files of mixed utility.

**Rule:** Only produce files the user explicitly requested or that are clearly implied by the task. Do not create README.md, INDEX.md, DELIVERABLES.txt, testing guides, or other companion files unless asked.

## Generating the Output

### XLSX Output

Read the xlsx SKILL.md before writing code: it's at the path where the xlsx skill is installed (typically under the skills directory).

Use `openpyxl` to build the file. Key formatting:

- **Header row**: Bold, Arial 11pt, dark blue fill (`#1F4E79`), white text, centered
- **Data rows**: Arial 10pt, wrap text enabled
- **Column widths**: Control ID(14), Title(25), Description(40), ToD(50), ToE(50), Method(18), Frequency(14), Population(12), Sample(14), Evidence(40), Pass Criteria(35), Fail Criteria(35), Risk(10), Owner(18), Tester(14), Date(12), Result(10), Exceptions(30), Notes(30)
- **Risk Level colors**:
  - Low → light green fill `#C6EFCE`
  - Medium → light yellow fill `#FFEB9C`
  - High → light orange fill `#FFCC99`
  - Critical → light red fill `#FFC7CE`
- **Alternating row shading**: Light gray (`#F2F2F2`) on even rows for readability
- **Freeze top row** and enable auto-filter
- **Sheet name**: "Control Testing Worksheet"
- If there are many controls, group by control family/domain on separate sheets or with grouped rows

### DOCX Output

Read the docx SKILL.md before writing code.

Structure the document as:

1. **Title page**: "Control Testing Worksheet — [Framework] [Audit Period]"
2. **Table of Contents**
3. **Introduction**: Scope, audit period, methodology summary, sample size methodology
4. **For each control**: A section with:
   - Control ID and title as heading
   - Control description
   - Test of Design procedure (numbered steps)
   - Test of Effectiveness procedure (numbered steps)
   - Test method, frequency, population, sample size in a summary table
   - Expected evidence list
   - Pass/fail criteria
   - Results section (blank for tester to complete)
5. **Appendix**: Sample size methodology reference table

### Both Formats

When the user requests both, generate the .xlsx first (primary working document) and then the .docx (formal documentation). The content should be consistent between them.

## Handling Multiple Controls

When generating procedures for many controls at once:
- Group controls by family/domain (Access Control, System Operations, etc.)
- Reuse common procedures where controls share testing approaches — but always customize the specific attributes to verify
- Note cross-references where testing one control provides partial evidence for another (e.g., testing AC-2 account management also provides evidence for AC-6 least privilege)
- Present a summary table of all controls with their methods and sample sizes before diving into details

## Framework-Specific Guidance

For detailed test procedure guidance by framework, read the appropriate reference file:

- `references/nist-testing.md` — NIST 800-53 / FedRAMP test procedure patterns
- `references/soc2-testing.md` — SOC 2 TSC test procedure patterns
- `references/iso27001-testing.md` — ISO 27001 test procedure patterns

These files contain framework-specific test procedure templates for common control families.
