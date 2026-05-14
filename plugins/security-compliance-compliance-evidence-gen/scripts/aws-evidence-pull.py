#!/usr/bin/env python3
"""aws-evidence-pull.py — skeleton AWS evidence collector for compliance audits.

Pulls a small set of common evidence artifacts (IAM password policy, S3 bucket
encryption status, CloudTrail trails, GuardDuty detectors) and writes them as
JSON under ./evidence/<account-id>/<timestamp>/.

Auditor-ready packaging is the responsibility of the /security-compliance-compliance-evidence-gen
prompt; this script's job is to fetch the raw facts.

Usage:
    AWS_PROFILE=audit python3 aws-evidence-pull.py
    python3 aws-evidence-pull.py --regions us-east-1,us-west-2 --out ./out

Requires: boto3 (pip install boto3) and AWS credentials configured via env,
profile, or instance role.
"""
from __future__ import annotations

import argparse
import datetime as dt
import json
import os
import sys
from pathlib import Path


def require_boto3():
    try:
        import boto3  # noqa: F401
    except ImportError:
        sys.stderr.write(
            "boto3 not installed. Install with: pip install boto3\n"
        )
        sys.exit(127)


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument(
        "--regions",
        default="us-east-1",
        help="Comma-separated list of regions for per-region collectors.",
    )
    p.add_argument(
        "--out",
        default="./evidence",
        help="Output root directory (default ./evidence).",
    )
    return p.parse_args()


def safe(fn):
    """Decorator: log and skip on AWS errors instead of aborting the whole run."""

    def wrapper(*args, **kwargs):
        try:
            return fn(*args, **kwargs)
        except Exception as exc:  # noqa: BLE001 — best-effort evidence pull
            sys.stderr.write(f"  [!] {fn.__name__} failed: {exc}\n")
            return {"error": str(exc)}

    return wrapper


@safe
def get_iam_password_policy(boto3_):
    iam = boto3_.client("iam")
    return iam.get_account_password_policy().get("PasswordPolicy", {})


@safe
def list_s3_bucket_encryption(boto3_):
    s3 = boto3_.client("s3")
    out = []
    for b in s3.list_buckets().get("Buckets", []):
        name = b["Name"]
        try:
            enc = s3.get_bucket_encryption(Bucket=name)
            out.append({"bucket": name, "encryption": enc.get("ServerSideEncryptionConfiguration")})
        except s3.exceptions.ClientError as ce:
            out.append({"bucket": name, "encryption": None, "error": str(ce)})
    return out


@safe
def list_cloudtrail_trails(boto3_, region):
    ct = boto3_.client("cloudtrail", region_name=region)
    return ct.describe_trails().get("trailList", [])


@safe
def list_guardduty_detectors(boto3_, region):
    gd = boto3_.client("guardduty", region_name=region)
    return gd.list_detectors().get("DetectorIds", [])


def main() -> int:
    args = parse_args()
    require_boto3()
    import boto3  # local import after the check

    sts = boto3.client("sts")
    account = sts.get_caller_identity()["Account"]
    ts = dt.datetime.utcnow().strftime("%Y%m%dT%H%M%SZ")
    out_dir = Path(args.out) / account / ts
    out_dir.mkdir(parents=True, exist_ok=True)

    sys.stderr.write(f"Collecting evidence for account {account} into {out_dir}\n")

    artifacts = {
        "iam_password_policy.json": get_iam_password_policy(boto3),
        "s3_bucket_encryption.json": list_s3_bucket_encryption(boto3),
    }
    for region in [r.strip() for r in args.regions.split(",") if r.strip()]:
        artifacts[f"cloudtrail_{region}.json"] = list_cloudtrail_trails(boto3, region)
        artifacts[f"guardduty_{region}.json"] = list_guardduty_detectors(boto3, region)

    for name, payload in artifacts.items():
        (out_dir / name).write_text(json.dumps(payload, default=str, indent=2))
        sys.stderr.write(f"  [+] {name}\n")

    print(str(out_dir))
    return 0


if __name__ == "__main__":
    sys.exit(main())
