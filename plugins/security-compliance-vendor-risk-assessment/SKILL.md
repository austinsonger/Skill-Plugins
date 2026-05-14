---
name: vendor-risk-assessment
description: >
  Perform a third-party vendor risk assessment across 12 domains (security, compliance, privacy, financial, legal, incidents, BCP, HR, due diligence, risk scoring) using web search OSINT. Produces a structured Markdown report with per-section risk scores (1-10) and an overall risk tier. Trigger on: "vendor risk assessment", "assess [vendor]", "vendor due diligence", "third-party risk", "TPRM", "evaluate [company] as a vendor", "vendor security review", "onboard [vendor]", "vendor questionnaire", "[company] risk assessment", or when someone asks about a company's security posture, compliance, breach history, or suitability as a vendor.
---

# Vendor Risk Assessment Skill

## Purpose

This skill conducts an automated, OSINT-driven vendor risk assessment. Given a vendor name (and optionally a website or additional context), it researches the vendor across 12 risk domains using web search and produces a professional Markdown report suitable for GRC teams, procurement reviews, or TPRM programs.

The goal is to give security and compliance teams a solid starting point — not to replace a full questionnaire-based assessment, but to frontload the publicly available intelligence so the team can focus their questionnaire and interview time on the gaps.

## Workflow

### Step 1: Gather Input

Ask the user for the vendor name. Optionally ask for:
- Vendor website URL (helps disambiguate common names)
- Type of service the vendor provides (e.g., "cloud hosting", "HR SaaS", "payment processing")
- Any specific concerns or focus areas

If the user just gives a vendor name, that's enough to proceed.

### Step 2: Research the Vendor

Use `WebSearch` to gather publicly available information. Run multiple targeted searches to cover all 12 domains. Here are the search strategies — run as many as needed in parallel to be thorough:

**Profile & Background**
- `"[vendor name]" site:linkedin.com company`
- `"[vendor name]" headquarters location offices`
- `"[vendor name]" founded leadership CEO`
- `"[vendor name]" parent company subsidiary acquisition`

**Due Diligence**
- `"[vendor name]" lawsuit litigation legal action`
- `"[vendor name]" sanctions OFAC watchlist`
- `"[vendor name]" controversy reputation`
- `"[vendor name]" SEC filing investor`

**Security & Compliance**
- `"[vendor name]" trust center security`
- `"[vendor name]" SOC 2 Type II report`
- `"[vendor name]" ISO 27001 certification`
- `"[vendor name]" FedRAMP authorized`
- `"[vendor name]" PCI DSS HITRUST`
- `"[vendor name]" penetration test vulnerability`
- `"[vendor name]" encryption security practices`

**Data Privacy**
- `"[vendor name]" privacy policy`
- `"[vendor name]" GDPR CCPA compliance`
- `"[vendor name]" data processing agreement DPA`
- `"[vendor name]" subprocessors sub-processors`

**Incident History**
- `"[vendor name]" data breach incident`
- `"[vendor name]" security incident disclosure`
- `"[vendor name]" outage downtime`

**Business Continuity & Financial**
- `"[vendor name]" disaster recovery business continuity`
- `"[vendor name]" SLA uptime availability`
- `"[vendor name]" revenue funding valuation`
- `"[vendor name]" layoffs financial stability`

After searching, use `WebFetch` to pull details from the vendor's trust/security page, privacy policy, and any other high-value pages you find. Always try to visit:
- The vendor's trust center / security page
- The vendor's privacy policy
- The vendor's compliance/certifications page
- The vendor's subprocessor list (if SaaS)

### Step 3: Produce the Report

Generate a Markdown report following the exact template below. For each section:

1. **Fill in every field** with the information you found. Use direct quotes and source URLs where possible.
2. **If information is unavailable**, write "Insufficient information available — recommend requesting directly from vendor via security questionnaire." Never fabricate data.
3. **Score each section** on a 1–10 risk scale where:
   - 1–3 = Low risk (strong controls, good track record, transparent)
   - 4–6 = Moderate risk (some gaps, limited public info, minor concerns)
   - 7–10 = High risk (known incidents, weak controls, lack of transparency, financial instability)
4. **Cite your sources** inline using `[Source](URL)` format.

### Step 4: Calculate Overall Risk

After completing all 12 sections, calculate:
- **Inherent Risk Score**: Average of all section scores (before considering any mitigating context)
- **Residual Risk Score**: Adjusted score factoring in certifications, compensating controls, and contractual protections
- **Risk Tier**: Based on residual risk score:
  - 1.0–3.0 = Low
  - 3.1–5.0 = Medium
  - 5.1–7.0 = High
  - 7.1–10.0 = Critical

### Step 5: Save and Deliver

Save the completed report as a Markdown file named `{vendor_name}_vendor_risk_assessment.md` in the outputs directory.

---

## Report Template

Use this exact structure for the output. Replace placeholder text with researched findings.

```markdown
# Vendor Risk Assessment: {Vendor Name}

**Assessment Date:** {Today's Date}
**Assessed By:** Automated OSINT Assessment (Claude)
**Assessment Type:** Third-Party Vendor Risk Assessment

---

## 1. Vendor Profile Information

| Field | Details |
|-------|---------|
| **Vendor Name** | {Vendor Name} |
| **Legal Business Name** | {Legal entity name from SEC/state filings, or "Insufficient information available"} |
| **Website** | {URL} |
| **Primary Contact(s)** | {If publicly available, otherwise "Not publicly available — request from vendor"} |
| **Type of Service** | {Description of services provided} |
| **Geographic Locations** | {HQ, offices, data center regions} |
| **Relationship Terms** | {If known, otherwise "Not applicable — pre-assessment"} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 2. Due Diligence and Background Checks

| Field | Details |
|-------|---------|
| **Business Credit Report** | {Summary or "Insufficient information available"} |
| **Litigation / Legal History** | {Known lawsuits, settlements, regulatory actions} |
| **Ownership & Parent Companies** | {Corporate structure, investors, parent co} |
| **Watchlist / Sanctions Screening** | {OFAC/sanctions status or "No adverse findings in public records"} |
| **Media & Reputation Scan** | {Summary of recent press coverage, Glassdoor sentiment} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 3. Information Security Controls

| Field | Details |
|-------|---------|
| **Data Encryption Practices** | {At-rest, in-transit encryption details} |
| **Network Security** | {Firewalls, IDS/IPS, WAF, DDoS protection} |
| **Endpoint Protection** | {EDR/EPP solutions mentioned} |
| **Access Control & MFA** | {SSO, MFA, least-privilege details} |
| **Logging / Monitoring** | {SIEM, log retention, monitoring practices} |
| **Secure SDLC / DevSecOps** | {SDLC maturity, bug bounty, code review practices} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 4. Data Handling and Privacy

| Field | Details |
|-------|---------|
| **Data Classification & Segregation** | {How vendor classifies and isolates customer data} |
| **Data Residency / Jurisdiction** | {Where data is stored, applicable jurisdictions} |
| **Data Retention & Destruction** | {Retention periods, deletion practices} |
| **Privacy Compliance** | {GDPR, CCPA, HIPAA status and evidence} |
| **Subcontractors / 4th Parties** | {Known subprocessors, sub-processor list availability} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 5. Compliance and Certifications

| Field | Details |
|-------|---------|
| **SOC Reports** | {SOC 1/2 Type I/II status, date of last report} |
| **ISO Certifications** | {ISO 27001, 27017, 27018, etc.} |
| **FedRAMP / NIST Alignment** | {FedRAMP status, NIST 800-53 alignment} |
| **Other Frameworks** | {PCI-DSS, HIPAA, HITRUST, CSA STAR, etc.} |
| **External Pen Tests / Vuln Scans** | {Frequency, third-party testing practices} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 6. Incident Management

| Field | Details |
|-------|---------|
| **Breach History** | {Known breaches with dates and scope} |
| **Incident Response Plan** | {IRP status, whether it's documented and tested} |
| **Detection / Containment Metrics** | {TTD/TTC if disclosed} |
| **Notification & Escalation** | {Breach notification commitments, SLA for notification} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 7. Business Continuity & Disaster Recovery

| Field | Details |
|-------|---------|
| **BCP/DRP Documentation** | {Whether BC/DR plans exist and are documented} |
| **RTO & RPO** | {Recovery time/point objectives if published} |
| **DR/BCP Testing Frequency** | {How often plans are tested} |
| **Geo-Redundancy** | {Multi-region, failover capabilities} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 8. Human Resources and Training

| Field | Details |
|-------|---------|
| **Background Checks** | {Employee screening practices} |
| **Security Awareness Training** | {Training frequency and coverage} |
| **Insider Threat Mitigation** | {Controls against insider threats} |
| **Role-Based Access Control** | {RBAC implementation details} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 9. Financial Risk and Stability

| Field | Details |
|-------|---------|
| **Financial Health** | {Revenue, funding, profitability indicators} |
| **Profitability & Cash Flow** | {Cash position, burn rate if startup} |
| **Insurance Coverage** | {Cyber liability, E&O, general liability} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 10. Legal and Contractual Risk

| Field | Details |
|-------|---------|
| **MSA / DPA Review Notes** | {Standard contract terms, DPA availability} |
| **Termination / Liability** | {Limitation of liability, termination rights} |
| **SLA Terms** | {Uptime commitments, credit structure} |
| **Audit Rights** | {Right to audit, third-party audit provisions} |

**Section Summary:** {2-3 sentence summary}
**Section Risk Score:** {X}/10

---

## 11. Risk Scoring and Tiering

| Metric | Score |
|--------|-------|
| **Inherent Risk Score** | {Average of all section scores}/10 |
| **Residual Risk Score** | {Adjusted score}/10 |
| **Risk Tier** | {Critical / High / Medium / Low} |

**Justification:** {3-5 sentence summary explaining the overall risk posture, key strengths, and primary concerns. Reference the highest-risk sections and explain what drives the tier recommendation.}

---

## 12. External Sources and Supporting Links

| Resource | Link |
|----------|------|
| **SOC 2 Type II Report** | {URL or "Not publicly available"} |
| **ISO 27001 Certificate** | {URL or "Not publicly available"} |
| **Breach Disclosure** | {URL or "No known breaches"} |
| **Trust Center / Security Page** | {URL} |
| **Privacy Policy** | {URL} |
| **Subprocessor List** | {URL or "Not publicly available"} |
| **Status Page** | {URL or "Not found"} |

---

## Recommended Next Steps

Based on the gaps identified in this assessment, the following actions are recommended:

1. {Specific recommendation based on gaps found}
2. {Specific recommendation}
3. {Specific recommendation}

---

*This assessment is based on publicly available information gathered on {date}. It should be supplemented with a vendor security questionnaire, review of SOC 2 reports under NDA, and contractual review before making a final risk determination.*
```

## Important Guidelines

- **Never fabricate information.** If you can't find something, say so clearly. A risk assessment with honest gaps is far more valuable than one with made-up data.
- **Always cite sources.** Every factual claim should link back to where you found it.
- **Be specific about dates.** When referencing certifications, breaches, or filings, include dates so the reader can assess recency.
- **Consider the service type when scoring.** A vendor handling sensitive PII or financial data should be held to a higher standard than a vendor providing office supplies. Factor in data sensitivity when assigning risk scores.
- **Recommend next steps for gaps.** Don't just say "insufficient information" — tell the user what to do about it (e.g., "Request SOC 2 Type II report under NDA", "Include in vendor security questionnaire").
