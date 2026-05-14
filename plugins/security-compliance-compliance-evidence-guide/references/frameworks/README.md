# Supported Frameworks

When the user asks for a compliance evidence guide, identify the framework from their request and load the matching file from this directory. Each file contains the control inventory, ID format, inherited citations, and framework-specific evidence sourcing principles needed to generate a high-quality guide.

| Slug | File | Status |
|---|---|---|
| SOC 2 (Type 1, Type 2, SOC 3) | `soc2.md` | Bundled |
| HIPAA Security Rule + Breach | `hipaa.md` | Bundled |
| PCI DSS 4.0.1 | `pci_dss.md` | Bundled |
| ISO/IEC 27001:2022 | `iso27001.md` | Bundled |
| NIST SP 800-53 Rev 5 (incl. FedRAMP baselines) | `nist_800-53.md` | Bundled |

## Adding a new framework

Copy `_template.md` to `<framework-slug>.md` and fill in the sections. Then add a row to the table above. The skill workflow will pick up the new framework automatically as long as the file is in this directory.

## Mapping user requests to framework files

Match generously — users phrase framework names many ways. Some common aliases:

- "SOC2", "SOC 2", "SOC 2 Type 2", "Trust Services Criteria", "TSC" → `soc2.md`
- "HIPAA", "HIPAA Security Rule", "ePHI", "HHS OCR audit" → `hipaa.md`
- "PCI", "PCI DSS", "PCI DSS 4", "cardholder data", "ROC", "SAQ" → `pci_dss.md`
- "ISO 27001", "ISMS", "Annex A", "ISO27K" → `iso27001.md`
- "NIST 800-53", "FedRAMP", "FISMA", "DoD IL2/IL4/IL5", "CMMC L2/L3" → `nist_800-53.md`

If the user names a framework that doesn't yet have a reference file (e.g., HITRUST, GDPR, CCPA, FedRAMP Tailored Li-SaaS, Australian ISM), tell the user the framework isn't bundled, offer to write a stub using `_template.md`, then proceed with the best framework-native source you can find (web search, the standard's official PDF, etc.).
