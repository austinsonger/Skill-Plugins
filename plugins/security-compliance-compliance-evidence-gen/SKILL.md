---
name: compliance-evidence-gen
description: Generates specific, auditor-ready evidence collection statements from a security/compliance control name and description. Use this skill whenever a user provides a control name and description and asks for evidence statements, evidence guidance, or what artifacts auditors/assessors need to see. Trigger when someone says "generate evidence for this control", "what evidence do I need?", "what should I show an auditor?", "write evidence statements", "what proof do I need for this control?", or pastes a control description and wants to know how to demonstrate compliance. Also trigger when someone asks about evidence collection for specific security controls like MFA, network monitoring, access management, vulnerability management, encryption, logging, incident response, etc. — even if they don't use the word "evidence" explicitly.
---

# Compliance Evidence Generator

Your job is to read a security/compliance control name and description, then produce **3–5 specific, auditor-ready evidence bullet points** that a compliance team could use to demonstrate the control is implemented.

## How to Think About Evidence

Think about what an auditor sitting across from you would actually need to see. Evidence should be concrete artifacts they can inspect — not vague categories like "documentation" or "proof of implementation." Ask yourself: what would you pull up on a screen or hand across the table?

Cover different evidence *dimensions* so the bullet points don't all say the same thing:

- **Outcome evidence** — proof the control is actively working (live screenshots, alert histories, audit logs, reports)
- **Configuration evidence** — proof the right settings are turned on (config exports, feature toggles, enabled policies, admin console screenshots)
- **Input/source evidence** — proof the control is receiving the right data to do its job (log source configs, integration setups, data feed settings)
- **Process/human evidence** — proof that people are reviewing and acting on the control (ticket logs, review attestations, meeting minutes, assigned ownership records)

You won't always need all four — let the control description guide which dimensions are relevant.

## Naming Specific Tools

When the control clearly involves cloud infrastructure or cloud-native services, name the equivalent tools across AWS, Azure, and GCP — this helps assessors know what to look for in each environment. For example, if a control is about network traffic monitoring, mention VPC Flow Logs (AWS), NSG Flow Logs (Azure), and VPC Flow Logs (GCP).

If the control is generic or on-premises, name common tools appropriate to the control domain: Splunk, CrowdStrike, Tenable, Qualys, SailPoint, Okta, Palo Alto, etc. Don't force cloud examples where they don't fit — a physical access control doesn't need GuardDuty references.

## Output Format

Output **only the bullet points** — no introductory sentence, no closing remarks. Each bullet should:
- Start with `- `
- Lead with the evidence type or source
- Explain what the evidence should *demonstrate* (not just what it is)
- Include specific tool names, file formats, or configuration artifact names where helpful

```
- [Evidence type/source] demonstrating [what it proves about the control]. [Specifics: what to show, which settings, which tool names are acceptable examples.]
- ...
```

## What to Avoid

- Vague phrases like "documentation showing the policy exists" — say what the document should contain
- Bullet points that are near-duplicates of each other (e.g., "screenshot of alert" and "screenshot of notification" as two separate bullets)
- Cloud-specific tool names for controls that have nothing to do with cloud infrastructure
- Generating more than 5 bullets — keep it focused; assessors prefer quality over volume
- Preamble like "Here are the evidence statements for this control:"

## Examples

**Control Name:** Network Traffic Monitoring

**Control Description:** Implementing network monitoring mechanisms doesn't necessarily mean you need to invest in complex systems. Start by identifying the critical parts of your network that, if compromised, could cause the most damage. Then, put in place the necessary tools to monitor these areas constantly. This could be through in-built network monitoring software, or third-party tools. Ensure these tools are properly configured to alert the right team members when suspicious activities are detected.

**Output:**
- Screenshots from the customer's monitoring system demonstrating active monitoring of network activity affecting backend systems or infrastructure. Acceptable examples include GuardDuty findings, Azure Defender alerts or Network Watcher monitoring, or Security Command Center findings, along with screenshots showing configured alerting mechanisms such as AWS EventBridge or SNS notifications, Azure Monitor alerts, or Google Cloud Monitoring alert policies.
- Evidence demonstrating the network telemetry and log sources feeding the monitoring system, including configuration screenshots showing enabled telemetry sources such as AWS VPC Flow Logs, Azure NSG Flow Logs or Network Watcher flow logs, and Google Cloud VPC Flow Logs, as well as any additional network or security logs used for monitoring.
- Evidence demonstrating the enabled monitoring and detection capabilities within the monitoring platform, including screenshots or configuration exports showing which features are enabled or disabled within services such as AWS GuardDuty protection plans, Azure Defender protections, or Google Cloud Security Command Center detection services.

---

**Control Name:** Multi-Factor Authentication Enforcement

**Control Description:** All user accounts with access to sensitive systems or data must authenticate using a second factor in addition to their password. MFA must be enforced at the identity provider level and cannot be bypassed. Exceptions require documented approval and compensating controls.

**Output:**
- Screenshots from the identity provider's admin console demonstrating that MFA is enforced organization-wide, including the specific enforcement policy setting and the scope of accounts it applies to. Acceptable examples include Okta Adaptive MFA policy configuration, Azure AD Conditional Access policies requiring MFA, Google Workspace 2-Step Verification enforcement settings, or AWS IAM identity center MFA enforcement settings.
- Exported user account report or directory listing demonstrating that all active user accounts have MFA enrolled, showing enrollment status per account. Acceptable formats include CSV exports from the identity provider, admin console reports, or directory service exports showing each user's MFA registration status.
- Evidence demonstrating the exception management process for any accounts where MFA has not been enforced, including written approval records, risk acceptance documentation, and any compensating controls in place.
- Authentication log samples demonstrating that MFA challenges are occurring for user sign-ins, including timestamps, user identifiers, and MFA method used. Acceptable examples include Okta System Log exports, Azure AD Sign-in Logs, or Google Workspace Admin audit log entries filtered for 2FA events.
