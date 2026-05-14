#!/usr/bin/env python3
"""Evidence Freshness Watchdog scanner.

Walks an evidence root looking for `*.evidence.json` sidecars, compares each
artifact's `collected_at` date against a renewal window, and writes a JSON
report. Optionally prints a one-line banner to stdout for the shell wrapper.
"""

from __future__ import annotations

import argparse
import json
import sys
from datetime import date, datetime, timezone
from pathlib import Path

DEFAULT_RENEWAL_DAYS = {
    "soc2-log": 90,
    "iso-doc": 365,
}
DUE_SOON_THRESHOLD_DAYS = 14


def load_config(path: Path) -> dict:
    if not path.is_file():
        return {}
    try:
        return json.loads(path.read_text())
    except Exception:
        return {}


def parse_date(value: str) -> date | None:
    if not isinstance(value, str):
        return None
    for fmt in ("%Y-%m-%d", "%Y-%m-%dT%H:%M:%S", "%Y-%m-%dT%H:%M:%SZ"):
        try:
            return datetime.strptime(value, fmt).date()
        except ValueError:
            continue
    try:
        return datetime.fromisoformat(value.replace("Z", "+00:00")).date()
    except ValueError:
        return None


def classify(item: dict, today: date) -> dict:
    due_at: date = item["due_at"]
    delta = (due_at - today).days
    if delta < 0:
        item["status"] = "stale"
        item["days_overdue"] = -delta
    elif delta <= DUE_SOON_THRESHOLD_DAYS:
        item["status"] = "due-soon"
        item["days_remaining"] = delta
    else:
        item["status"] = "fresh"
        item["days_remaining"] = delta
    return item


def scan(root: Path, renewal_map: dict[str, int]) -> list[dict]:
    today = date.today()
    items: list[dict] = []

    for sidecar in root.rglob("*.evidence.json"):
        artifact_path = sidecar.with_name(sidecar.name[: -len(".evidence.json")])
        rel = str(sidecar.relative_to(root))

        try:
            data = json.loads(sidecar.read_text())
        except Exception as exc:
            items.append(
                {
                    "artifact": rel,
                    "status": "malformed",
                    "error": f"unreadable sidecar: {exc}",
                }
            )
            continue

        type_ = data.get("type")
        collected_at = parse_date(data.get("collected_at", ""))
        renewal = data.get("renewal_days") or renewal_map.get(type_)

        base = {
            "artifact": str(artifact_path.relative_to(root))
            if artifact_path.exists()
            else rel,
            "sidecar": rel,
            "type": type_,
            "collected_at": data.get("collected_at"),
            "control_id": data.get("control_id"),
            "owner": data.get("owner"),
        }

        if not type_ or collected_at is None:
            base["status"] = "malformed"
            base["error"] = "missing type or collected_at"
            items.append(base)
            continue

        if not renewal:
            base["status"] = "unknown-policy"
            base["error"] = f"no renewal_days for type '{type_}'"
            items.append(base)
            continue

        try:
            due_at = collected_at.replace(year=collected_at.year)
            # add renewal_days
            from datetime import timedelta

            due_at = collected_at + timedelta(days=int(renewal))
        except Exception as exc:
            base["status"] = "malformed"
            base["error"] = f"bad renewal_days: {exc}"
            items.append(base)
            continue

        base["renewal_days"] = int(renewal)
        base["due_at"] = due_at.isoformat()
        base_with_due = dict(base)
        base_with_due["due_at"] = due_at  # for classify
        classified = classify(base_with_due, today)
        classified["due_at"] = due_at.isoformat()
        items.append(classified)

    return items


def build_report(root: Path, items: list[dict]) -> dict:
    counts = {
        "fresh": 0,
        "due_soon": 0,
        "stale": 0,
        "unknown_policy": 0,
        "malformed": 0,
    }
    key_map = {
        "fresh": "fresh",
        "due-soon": "due_soon",
        "stale": "stale",
        "unknown-policy": "unknown_policy",
        "malformed": "malformed",
    }
    for it in items:
        counts[key_map.get(it.get("status", ""), "malformed")] += 1

    return {
        "generated_at": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "root": str(root),
        "counts": counts,
        "items": items,
    }


def banner_line(items: list[dict]) -> str:
    soc2 = iso = other = 0
    for it in items:
        if it.get("status") != "stale":
            continue
        t = it.get("type")
        if t == "soc2-log":
            soc2 += 1
        elif t == "iso-doc":
            iso += 1
        else:
            other += 1
    total = soc2 + iso + other
    if total == 0:
        return ""
    return (
        f"[evidence-freshness] {total} stale "
        f"({soc2} SOC2 / {iso} ISO / {other} other) "
        f"— run /evidence-freshness for details"
    )


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--root", required=True, type=Path)
    ap.add_argument("--report", required=True, type=Path)
    ap.add_argument("--config", type=Path, default=None)
    ap.add_argument("--banner", action="store_true")
    args = ap.parse_args()

    if not args.root.is_dir():
        print(f"evidence root not found: {args.root}", file=sys.stderr)
        return 1

    renewal_map = dict(DEFAULT_RENEWAL_DAYS)
    if args.config:
        cfg = load_config(args.config)
        for k, v in (cfg.get("types") or {}).items():
            try:
                renewal_map[k] = int(v)
            except (TypeError, ValueError):
                continue

    items = scan(args.root, renewal_map)
    report = build_report(args.root, items)

    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, indent=2, default=str))

    if args.banner:
        line = banner_line(items)
        if line:
            print(line)
    return 0


if __name__ == "__main__":
    sys.exit(main())
