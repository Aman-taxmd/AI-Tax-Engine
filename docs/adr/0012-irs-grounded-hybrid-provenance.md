# ADR 0012: IRS-Grounded Hybrid Provenance (Cost Seg + W-2)

## Status
Accepted

## Context

Phase 2 cost segregation and W-2 used hand-authored canonical fields and PDF
bridges for speed. That left parallel truth outside the standard pipeline
(discover → extract → synthesize → map-pdf-fields → evidence bundles) used
for Form 8889.

We still require:
- Multi-instance projection (4562 per activity, Schedule E A/B/C pagination, W-2 per row)
- Deterministic depreciation math (not LLM calc rules)
- Cross-form `sum_instances` (W-2 → 1040 / 8889)

## Decision

Three layers of truth:

| Layer | Authority | Mechanism |
|---|---|---|
| **Catalog** | IRS XSD + instructions | `synthesize` canonical fields, knowledge packets, evidence bundles |
| **Amounts** | Engine / deterministic bridges | `runtime/depreciation/*`, `sum_instances`, goldens |
| **Presentation** | Projection adapters + reviewed PDF mappings | `cost_seg_projection.*`, `map-pdf-fields` + human review |

### Cost segregation (4562 / Schedule E)

- Run full build pipeline with `synthesize --canonical-only` (no LLM calc rules).
- Link `CostSegFieldTemplate` rows to synthesized canonical fields via XSD element.
- Keep `cost_seg.{activity_id}.*` runtime binding and engine as amount authority.
- Keep `cost_seg_projection.*` as PDF FK targets; promote PDF mappings via review using hand-verified ground truth.

### W-2

- Ingest `IRSW2.xsd`, run full `run-pilot --form w2`.
- `w2_synthesized_link_bridge` grounds `intake_w2_*` fields in synthesized XSD catalog.
- `w2_bridge` writes only `sum_instances` cross-form rules with `deterministic_parse` evidence.
- PDF mappings via `map-pdf-fields` + promotion from hand ground truth.

## Consequences

- Hand PDF bridge modules remain as regression reference; promotion script applies ground truth.
- Re-running `synthesize` on engine-authoritative forms must use `--canonical-only`.
- Provenance export includes field → XSD → PDF → computation_source chain.
