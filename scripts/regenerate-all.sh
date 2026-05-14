#!/usr/bin/env bash
# regenerate-all.sh — run every regenerator. Use after editing plugin.json
# files by hand or after merging a PR that adds new plugins.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
"$SCRIPT_DIR/regenerate-marketplace.sh"
"$SCRIPT_DIR/regenerate-readme-table.sh"
"$SCRIPT_DIR/regenerate-workflows.sh"
echo "All manifests regenerated."
