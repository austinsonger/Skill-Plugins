# Supported CSPs

When the user names a cloud service provider, load the matching file from this directory. Each file contains the service catalog, console conventions, and inherited-control notes needed to generate a high-quality guide.

| Slug | File | Status |
|---|---|---|
| Amazon Web Services (AWS) | `aws.md` | Bundled |
| Microsoft Azure | `azure.md` | Bundled |
| Google Cloud Platform (GCP) | `gcp.md` | Bundled |

## Adding a new CSP

Copy `_template.md` to `<csp-slug>.md` and fill in the sections. Then add a row to the table above. The skill workflow will pick up the new CSP automatically.

Common CSPs not yet bundled:
- Oracle Cloud Infrastructure (OCI)
- IBM Cloud
- Alibaba Cloud
- Tencent Cloud
- DigitalOcean
- Cloudflare (for edge / Workers workloads)

## Mapping user requests to CSP files

- "AWS", "Amazon Web Services", "Amazon", "EC2", "S3" — `aws.md`
- "Azure", "Microsoft Azure", "Microsoft Cloud" — `azure.md`
- "GCP", "Google Cloud", "Google Cloud Platform" — `gcp.md`

If the user names a CSP that doesn't yet have a reference file, tell them the CSP isn't bundled, offer to write a stub using `_template.md`, then proceed with the best CSP-native documentation you can find (the CSP's compliance portal, their published shared responsibility model, their service catalog).
