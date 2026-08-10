#!/usr/bin/env bash
# Thin wrapper: export bundle from AI_TAX_ENGINE, then import into TaxMD-TaxCore.
#
# Usage:
#   ./scripts/import_to_taxcore.sh [TAXCORE_ROOT] [FORM ...]
#   ./scripts/import_to_taxcore.sh ../TaxMD-TaxCore 8889
#
# Requires sibling checkouts:
#   AI_TAX_ENGINE/  (this repo)
#   TaxMD-TaxCore/
set -euo pipefail

AI_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TAXCORE_ROOT="${1:-${AI_ROOT}/../TaxMD-TaxCore}"
shift || true
FORMS=("$@")
TAX_YEAR="${TAX_YEAR:-2025}"

echo "== AI_TAX_ENGINE export-taxcore-bundle (ty${TAX_YEAR}) =="
cd "${AI_ROOT}"
python -m build.cli export-taxcore-bundle \
  --tax-year "${TAX_YEAR}" \
  --taxcore-root "${TAXCORE_ROOT}"

BUNDLE="${AI_ROOT}/output/ty${TAX_YEAR}/taxcore_bundle"
echo ""
echo "== TaxMD-TaxCore import =="
if ((${#FORMS[@]})); then
  exec "${BUNDLE}/deploy_to_taxcore.sh" "${TAXCORE_ROOT}" "${FORMS[@]}"
else
  exec "${BUNDLE}/deploy_to_taxcore.sh" "${TAXCORE_ROOT}"
fi
