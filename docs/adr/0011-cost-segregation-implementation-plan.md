# ADR 0011: Cost Segregation / Depreciation — Build in AI_TAX_ENGINE, Export to TaxCore

## Status
Proposed

## Context

TaxMD needs a cost-segregation strategy that is legally credible beyond a
Year-1 ROI worksheet. The agreed architecture separates three layers:

1. **Engine layer** — asset ledger, basis, classification, bonus, MACRS
2. **Form projection layer** — Form 4562 → Schedule E / Form 8825 → return
3. **Limitation layer** — basis → at-risk (6198) → passive (8582) → excess
   business loss (461)

Form 4562 is an **output** of the depreciation engine, not the calculation
engine itself.

TaxMD-TaxCore already has a **Phase-1 strategy shell**:

- Scenario: `scenario_buying_real_estate_cost_segregation`
- Worksheet rules: `calc_cost_seg_worksheet_*` (16 rules)
- Materialization: `CostSegMaterializationService` → Form 4562 child assets
- Modules: `form_4562`, `schedule_e`, `passive_activity_loss`
- Tests: `tests/unit/strategies/test_strategy_cost_seg.py`

That shell uses **percent-based reclassification** and a simplified bonus gate.
This ADR defines how to build the full engine **here first** (AI_TAX_ENGINE),
validate with goldens, then export to TaxCore using the same bundle pattern as
Form 8889 / W-2 / 1040.

## Decision

Build cost segregation as a **multi-module vertical slice** in AI_TAX_ENGINE:

```
build/depreciation/          ← pure calculation (tables, conventions, asset loop)
build/consolidation/         ← bridges into calc rules (like hsa_worksheet_bridge)
runtime/                     ← executes validated rules only
build/export/taxcore_targets/ ← FormSpec per form (4562, schedule_e, 8582, cost_seg)
tests/goldens/cost_seg/      ← numeric truth before TaxCore import
```

Export via `export-taxcore --form …` and `export-taxcore-bundle` after each
phase passes goldens. **Do not** hand-edit TaxCore rules until the bundle is
reviewed.

Align canonical field names with TaxCore's existing paths where they exist
(`multi_instance.depreciation_asset_records.*`, `cost_seg_worksheet.*`,
`limitations.*`). Add new leaves via canonical schema patches, not ad hoc
form-line names in calc rules.

## Locked workflows

### Individual rental (primary v1 path)

```
Property Intake
  → Cost Seg Study (asset classification)
  → Asset Ledger
  → [Look-back branch: Prior-year reconstruction → §481(a) → Form 3115]
  → Depreciation Engine (bonus → MACRS)
  → Form 4562 (projection)
  → Schedule E
  → Basis limitation (when applicable)
  → Form 6198 (at-risk)
  → Form 8582 (passive)
  → Form 461 (excess business loss)
  → Form 1040
```

### Partnership / S corporation rental (Phase 4)

```
Asset Ledger → [3115] → Depreciation Engine → Form 4562 → Form 8825
  → Form 1065 / Form 1120-S → K-1 → owner-level limitation stack → Form 1040
```

### Look-back branch (Phase 3)

- Trigger: property placed in service before current tax year **and** adopted
  depreciation method differs from cost-seg-correct method.
- Output: §481(a) estimate + **3115 workflow flag** (evaluate DCN — do not
  hardcode DCN 7).

## Implementation phases

Each phase ends with: (a) golden cases passing, (b) `export-taxcore` package
for touched forms, (c) `import_notes` runbook entry.

---

### Phase 0 — Foundation (1–2 weeks)

**Goal:** Architecture skeleton, canonical schema, and ingestion targets.

| Deliverable | Location / action |
|---|---|
| ADR acceptance + canonical field map | This doc + appendix below |
| IRS discovery targets | Form 4562 XSD/instructions, Pub 946 tables, Schedule E, Form 8582 |
| Canonical sections | `depreciation.*`, `cost_seg_worksheet.*`, `limitations.*`, extend `multi_instance.depreciation_asset_records.*` |
| Asset record schema | Per-asset: basis, class, recovery_period, placed_in_service, method, convention, prior_dep, section_1245/1250 |
| MACRS table data (TY2025) | `build/depreciation/data/macrs_gds_*.json` from Pub 946 |
| Bonus rate table (versioned) | `build/depreciation/data/bonus_rates_{year}.json` incl. acquisition-date splits |
| Test harness | `tests/goldens/cost_seg/` with YAML cases + `scripts/run_cost_seg_goldens.py` |

**Exit criteria:** One asset, straight-line 39-year, projects to a 4562 line
without LLM — table-driven only.

---

### Phase 1 — Strategy parity + credible Year 1 (2–3 weeks)

**Goal:** Match or exceed TaxCore's existing cost seg worksheet with
test-backed formulas; replace %-based magic numbers with explicit rules.

| Module | Rules / code |
|---|---|
| Property intake | land_pct by building type OR user override; depreciable basis |
| Cost seg classification | short-life % → explicit asset rows (structure, 5/7-yr, 15-yr land improv) |
| Asset ledger | `multi_instance.depreciation_asset_records[]` materialization spec |
| Bonus engine | TY2025 rates; placed-in-service + acquisition date gates |
| MACRS engine (Year 1 only) | 5/7/15 half-year; 27.5/39 mid-month straight-line |
| Cost seg worksheet | Port `calc_cost_seg_worksheet_*` logic with IRS citations |
| Form 4562 projection | Parts II–III aggregates → `form_4562_*` view fields |
| Passive gate | REPS / material participation / STR (existing TaxCore semantics) |

**Export package:**

- `build/export/taxcore_targets/cost_seg_worksheet.py` — worksheet writers
- `build/export/taxcore_targets/form_4562.py` — form mapping + module stub
- Register in `SPECS` + `BUNDLE_FORM_ORDER` (after W-2, before schedules)

**Golden cases (minimum):**

1. $1M residential SFH, 20% land, REPS → bonus + additional depreciation matches TaxCore test
2. Same property, no REPS → passive_gate=0, usable_deduction=0
3. Commercial office $500K → different reclassification table
4. Study cost reduces net Year 1 benefit

**Exit criteria:** All Phase 1 goldens pass; bundle diff vs TaxCore cost seg
rules documented in `scripts/compare_taxcore_bundle.py`.

---

### Phase 2 — Schedule E + limitation stack (2–3 weeks)

**Goal:** Depreciation flows through rental P&L; passive loss limit applied.

| Module | Rules / code |
|---|---|
| Schedule E integration | Line 18 depreciation from engine total; net rental loss |
| Basis limitation | Scaffold (N/A for direct Sch E v1; stub for passthrough) |
| Form 6198 | At-risk allowed loss from rental activity |
| Form 8582 | Passive allowed loss; suspended loss carryforward field |
| Form 461 | Excess business loss after 8582 (Pub 925 ordering) |
| 1040 bridge | Feed limited loss into AGI / taxable income chain |

**Export package:**

- `form_1040sse.py` extensions OR dedicated `schedule_e_rental.py`
- `form_8582.py`, `form_461.py` (projection-only; read engine outputs)
- Scenario fragment: `scenario_cost_seg_rental_chain.json`

**Golden cases:**

1. REPS + $60k W-2 → full loss offsets ordinary income
2. No REPS + $60k W-2 → 8582 suspends most loss; AGI barely moves
3. Multi-property: per-activity grouping, separate 8582 buckets

**Exit criteria:** End-to-end `4562 → Sch E → 8582 → 1040 AGI` golden passes
(same pattern as HSA `8889 → Sch1 → 1040`).

---

### Phase 3 — Look-back + §481(a) + Form 3115 workflow (3–4 weeks)

**Goal:** Detect look-back; compute catch-up; CPA-facing 3115 package (not
full PDF automation in v1).

| Module | Rules / code |
|---|---|
| Look-back detection | placed_in_service_year < tax_year AND method change |
| Prior-year reconstruction | Per-asset depreciation Year 1..N-1 under old vs corrected |
| §481(a) calculator | Cumulative diff through prior year |
| Form 3115 workflow | Flags, DCN candidate list, attachment checklist — **no auto-file** |
| Current-year 4562 | Includes normal depreciation + documents 481 adjustment separately |

**Export package:**

- `form_3115.py` — metadata + workflow fields only (Phase 3b adds lines)
- `import_notes` — CPA manual steps

**Golden cases:**

1. 39-year building placed 2022, cost seg in 2026 → negative §481(a)
2. Greenfield 2025 placed → no 3115 flag

**Exit criteria:** §481(a) number matches hand spreadsheet for 3 reference
properties.

---

### Phase 4 — Entity expansion (3–4 weeks)

**Goal:** Partnership / S-corp rental path.

| Module | Deliverable |
|---|---|
| Form 8825 projection | Rental depreciation from same engine |
| K-1 loss allocation | Suspended loss per owner |
| Owner limitation stack | Basis (7203) → 6198 → 8582 → 461 at shareholder level |

**Exit criteria:** One partnership golden + one S-corp golden.

---

### Phase 5 — Lifecycle / disposition (2+ weeks)

**Goal:** Asset-level tracking for future sale.

| Module | Deliverable |
|---|---|
| Per-asset adjusted basis rollforward | Year-over-year in asset ledger |
| Form 4797 projection | §1245 vs §1250 recapture split on disposal |

---

## Code layout (AI_TAX_ENGINE)

```
build/
  depreciation/
    __init__.py
    asset.py              # AssetRecord dataclass
    basis.py              # land split, business-use %
    classification.py     # cost seg buckets → asset rows
    bonus.py              # versioned bonus eligibility + amount
    macrs.py              # convention selection + table lookup
    engine.py             # orchestrates per-asset loop
    lookback.py           # 481(a) reconstruction (Phase 3)
    data/
      macrs_gds_5yr.json
      macrs_gds_7yr.json
      macrs_gds_15yr.json
      bonus_rates_2025.json
      cost_seg_profiles.json   # building_type → reclassification %
  consolidation/
    cost_seg_bridge.py    # asset engine → calc rules
    depreciation_4562_bridge.py
    schedule_e_bridge.py
  export/taxcore_targets/
    cost_seg_worksheet.py
    form_4562.py
    form_8582.py          # Phase 2
    form_3115.py          # Phase 3
tests/
  goldens/cost_seg/
    case_01_residential_reps.yaml
    case_02_residential_passive.yaml
    ...
  unit/depreciation/
    test_macrs_tables.py
    test_bonus_rates.py
    test_conventions.py
```

**Rule naming convention (TaxCore export):**

| Layer | output_field prefix | canonical promotion |
|---|---|---|
| Asset engine scratchpad | `depreciation_engine.*` | via output_mappings |
| Cost seg strategy worksheet | `cost_seg_worksheet.*` | existing TaxCore paths |
| Form 4562 view | `calculation_results` only | module output_mappings |
| Limitations | `limitations.*` | direct canonical |

Calc rules **never** write directly to `multi_instance.*` — materialization
service pattern stays in TaxCore; we export the **rules + mapping** that
TaxCore's executor runs.

## Canonical field map (align with TaxCore)

Reuse existing TaxCore paths:

| Domain path | Role |
|---|---|
| `multi_instance.depreciation_asset_records.cost_seg_building_type` | Intake |
| `multi_instance.depreciation_asset_records.cost_or_other_basis` | Intake |
| `multi_instance.depreciation_asset_records.date_placed_in_service` | Intake |
| `taxpayer.is_real_estate_professional` | Passive gate |
| `taxpayer.materially_participates_in_rental` | Passive gate |
| `cost_seg_worksheet.depreciable_basis` | Worksheet |
| `cost_seg_worksheet.bonus_depreciation_year1` | Worksheet |
| `cost_seg_worksheet.additional_depreciation` | Worksheet |
| `cost_seg_worksheet.passive_gate` | Worksheet |
| `cost_seg_worksheet.usable_tax_benefit_increment` | Worksheet |
| `cost_seg_worksheet.net_year1_benefit` | Worksheet |

Add (new leaves, patch export):

| Domain path | Role |
|---|---|
| `depreciation.total_current_year_amount` | Engine output |
| `depreciation.bonus_depreciation_amount` | Engine output |
| `depreciation.macrs_depreciation_amount` | Engine output |
| `depreciation.section_179_amount` | Engine output (often 0) |
| `limitations.at_risk_allowed_loss_amount` | After 6198 |
| `limitations.passive_allowed_loss_amount` | After 8582 |
| `limitations.excess_business_loss_allowed_amount` | After 461 |
| `cost_seg_worksheet.lookback_required_flag` | Phase 3 |
| `cost_seg_worksheet.section_481a_adjustment_amount` | Phase 3 |

## Testing strategy

| Layer | What | Where |
|---|---|---|
| Unit | MACRS tables, conventions, bonus gates | `tests/unit/depreciation/` |
| Golden | Full chain numeric truth | `tests/goldens/cost_seg/` |
| Regression | Bundle vs TaxCore diff | `scripts/compare_taxcore_bundle.py` |
| Integration | Import bundle → TaxCore `test_strategy_cost_seg.py` | Run in TaxMD-TaxCore after export |

Follow the 8889 pattern:

1. Goldens pass in AI_TAX_ENGINE with our engine
2. Export bundle
3. Import to TaxCore branch
4. TaxCore strategy tests pass (extend, do not replace, until cutover)

## Export / import workflow

```bash
# After Phase N goldens pass:
python -m build.cli export-taxcore --form cost_seg --tax-year 2025
python -m build.cli export-taxcore --form 4562 --tax-year 2025
python -m build.cli export-taxcore-bundle --tax-year 2025 \
  --taxcore-root ../TaxMD-TaxCore

# Review:
python scripts/compare_taxcore_bundle.py --taxcore-root ../TaxMD-TaxCore

# Deploy (from bundle):
./output/ty2025/taxcore_bundle/deploy_to_taxcore.sh /path/to/TaxMD-TaxCore
cd /path/to/TaxMD-TaxCore && uv run python manage.py load_schemas --update-latest
```

**Bundle order** (append to `BUNDLE_FORM_ORDER`):

```
w2 → 8889 → cost_seg → 4562 → 1040sse → 8582 → 461 → 1040s1 → 1040
```

Cost seg worksheet must load **before** 4562 and Schedule E so operands exist.

## What we deliberately defer

| Item | Reason |
|---|---|
| Full Pub 946 (every asset class, ADS, mid-quarter) | Phase 5+; cost seg subset first |
| §179 for real property | Rare in cost seg; stub at 0 |
| Listed property / vehicles (4562 Part V) | Out of scope for building studies |
| Automated Form 3115 PDF | CPA workflow; flag + numbers only in Phase 3 |
| State depreciation conformity | Separate module after federal goldens |
| LLM-synthesized MACRS formulas | Tables are deterministic — no LLM in engine |

## Risks and mitigations

| Risk | Mitigation |
|---|---|
| Bonus law changes mid-year | Version `bonus_rates_{year}.json` by acquisition date |
| TaxCore materialization diverges from our asset ledger | Export materialization rules; single source in `cost_seg_bridge.py` |
| 8582 grouping wrong for multi-property | Golden cases with 2+ activities before Phase 2 sign-off |
| Over-scoping 4562 | Parts II–III only until Phase 5 |
| Duplicate rules on import | `import_notes` RETIRE list for old `calc_cost_seg_worksheet_*` stubs |

## Success metrics

| Phase | Metric |
|---|---|
| 1 | 4+ goldens pass; TaxCore $1M REPS case matches within $1 |
| 2 | Passive vs REPS AGI delta correct on 1040 chain |
| 3 | §481(a) matches manual calc for 3 look-back scenarios |
| 4 | Partnership K-1 loss + shareholder 8582 correct |
| Export | `compare_taxcore_bundle.py` shows expected REPLACE/MERGE only |

## Consequences

- New `build/depreciation/` package is the single source for MACRS/bonus math;
  calc rules reference its outputs via bridge-generated rules.
- Form 4562 ingestion uses existing XSD at `xsd-files/xsl/2025/IRS4562.xsd`.
- TaxCore's `CostSegMaterializationService` may be replaced or fed by exported
  rules — decision at Phase 1 export review.
- CI should add `pytest tests/goldens/cost_seg` and `pytest tests/unit/depreciation`.

## Appendix — Phase 1 task checklist

- [ ] Create `build/depreciation/` package + asset dataclass
- [ ] Load Pub 946 MACRS tables for 5/7/15 yr GDS
- [ ] Implement half-year and mid-month convention (Year 1)
- [ ] Implement bonus rate lookup TY2025
- [ ] Port cost seg building profiles from TaxCore materialization %
- [ ] Write `cost_seg_bridge.py` → calc rules
- [ ] Add golden cases 01–04
- [ ] Create `taxcore_targets/cost_seg_worksheet.py`
- [ ] Create `taxcore_targets/form_4562.py` (Parts II–III mapping)
- [ ] Register forms in bundle export
- [ ] Run compare script vs TaxCore
- [ ] Document import RETIRE list for old worksheet rules
