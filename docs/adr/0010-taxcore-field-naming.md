# ADR 0010: Align canonical field names with TaxCore's domain paths (Form 8889 pilot)

## Status
Accepted (Form 8889 pilot complete; other forms still on `form_{form}_line_N`)

## Context
This repo's job is to *generate accurate schema* — canonical fields, calc
rules, form mappings — grounded in real IRS XSDs/instructions via discovery
→ extraction → LLM synthesis → judge/grounding. The AI infrastructure stays
here forever; TaxCore only needs the **output artifacts**.

TaxCore's schema (under `data/schema/`) is load-bearing for real product
features: dual-write into `CalculationRule` rows, `dependency_graph()`,
what-if simulation diffs keyed by dot-path, avatar-driven module composition.
Their field names are **domain-semantic** (`adjustments.hsa_contribution_amount`),
ours were **form-line** (`form_8889_line_2`). A permanent translator between
the two would accumulate debt as we add forms.

## Decision
1. **Rename in our own DB** (not just at export) onto TaxCore's existing
   domain paths for every form we migrate, starting with Form 8889.
2. **Keep dollars** everywhere (IRS convention). TaxCore's own codebase is
   inconsistent about cents vs dollars; we do not absorb that inconsistency.
3. **Core = ours, format = theirs.** Our IRS-cited formulas replace their
   thinner stubs. Additive formula types / fields are fine when they make
   the engine more correct.
4. **Export TaxCore-shaped JSON** via `python -m build.cli export-taxcore
   --form 8889` into `output/ty{year}/taxcore/{form}/`, ready to drop into
   TaxCore's `data/schema/` and load with `manage.py load_schemas`.

## Form 8889 mapping (ours → TaxCore)

| Old name | New name (TaxCore) | Line |
|---|---|---|
| `form_8889_line_1` | `deductions.is_hdhp_self_only_coverage` + `deductions.is_hdhp_family_coverage` (primary); `deductions.hdhp_coverage_type` kept as engine/PDF compat mirror only | 1 |
| `form_8889_line_2` | `adjustments.hsa_contribution_amount` | 2 |
| `form_8889_line_3` | `adjustments.hsa_limited_annual_deductible_amount` | 3 |
| `form_8889_line_4` | `adjustments.total_archer_msa_contribution_amount` | 4 |
| `form_8889_line_5` | `adjustments.hsa_limited_deductible_allowed_amount` | 5 |
| `form_8889_line_6` | `adjustments.hsa_family_deductible_amount` | 6 |
| `form_8889_line_7` | `adjustments.hsa_additional_contribution_amount` | 7 |
| `form_8889_line_8` | `adjustments.hsa_limited_gross_contribution_amount` | 8 |
| `form_8889_line_9` | `adjustments.hsa_employer_contribution_amount` | 9 |
| `form_8889_line_10` | `adjustments.hsa_qualified_funding_distribution_amount` | 10 |
| `form_8889_line_11` | `adjustments.total_hsa_contribution_amount` | 11 |
| `form_8889_line_12` | `adjustments.hsa_limited_contribution_amount` | 12 |
| `form_8889_line_13` | `adjustments.health_savings_account_deduction_amount` | 13 |
| `form_8889_line_14a` | `income.total_hsa_distribution_amount` | 14a |
| `form_8889_line_14b` | `adjustments.hsa_distribution_rollover_amount` | 14b |
| `form_8889_line_14c` | `income.hsa_net_distribution_amount` | 14c |
| `form_8889_line_15` | `deductions.unreimbursed_qualified_medical_dental_expenses_amount` | 15 |
| `form_8889_line_16` | `income.taxable_hsa_distribution_amount` | 16 |
| `form_8889_line_17a` | `income.is_hsa_distribution_additional_tax_exception` | 17a |
| `form_8889_line_17b` | `taxes.hsa_distribution_additional_percent_tax_amount` | 17b |
| `form_8889_line_18` | `deductions.hdhp_coverage_fail_partial_year_amount` | 18 |
| `form_8889_line_19` | `adjustments.hdhp_coverage_fail_fund_distribution_amount` | 19 |
| `form_8889_line_20` | `income.hdhp_coverage_income_amount` | 20 |
| `form_8889_line_21` | `taxes.hdhp_coverage_additional_tax_amount` | 21 |

Encoded in `runtime/chain.py`'s `FORM_FIELD_NAME_OVERRIDES["8889"]` and applied
by `scripts/rename_8889_fields_to_taxcore.py`.

## Formula vocabulary translation (export-time)

| Ours | TaxCore export |
|---|---|
| `sum` / `subtract` / `multiply` | same |
| `min` / `max` | `minimum` / `maximum` |
| `carryover` | `sum` with one field operand |
| `subtract_floor_zero` | `maximum(subtract(...), 0)` nested |
| `multiply_unless_flag` | `conditional` on the flag |
| `sum_instances` | `aggregate` (engine-supported; schema enum is narrower — additive) |

## TaxCore import package (FormSpec / target tree)

`export-taxcore` emits a full import contract under
`output/ty{year}/taxcore/{form}/`, driven by
`build/export/taxcore_targets/` (Form 8889 pilot):

| Artifact | Role |
|---|---|
| `rules/*.json` | Worksheet writers (`output_field` = `form_8889_hsa_deduction_worksheet.*`) |
| `calculation_schema_patch_*.json` | Replace that worksheet key in calculation_schema |
| `canonical_schema_patch_*.json` | Upsert section leaves (never whole-replace) |
| `canonical_field_metadata_patch_*.json` | Key-level metadata merge (mutable flags, HDHP booleans) |
| `form_mapping_irs_*.json` | Replace form mapping |
| `module_hsa.json` | Avatar module: `calc_rules` + `output_mappings` |
| `target_tree_*.json` | Single sketch of both trees + promotions |
| `import_notes_*.json` | Retire old chain / collision / smoke-test runbook |
| `MANIFEST.json` | Checklist status + drop paths |

**Two-tree rule:** calc rules never use a canonical path as `output_field`.
Promotion into `canonical_data` is via module `output_mappings` only.
`canonical_target` on a rule is a documentation / wiring hint.

**Import decision:** replace the old HSA chain (avatar module `hsa` + colliding
`calc_form_8889_hsa_deduction_worksheet_*` writers). Do not run both.

## Form W-2 — export projection (not DB rename)

W-2 is **multi-instance** and uses a different shape in each system:

| AI_TAX_ENGINE (engine/UI) | TaxCore import |
|---|---|
| Parallel lists: `intake_w2_box1_wages: [65000, …]` | Nested records: `multi_instance.w2_records[i].wages_amount` |
| `sum_instances` → `form_1040_line_1a` / `25a` | `aggregate` → `w2_employer_use_worksheet.*` → promoted scalars |

**Decision:** keep `intake_w2_*` in our DB; `export-taxcore --form w2` projects
to TaxCore paths via `build/export/taxcore_targets/form_w2.py`. Golden cases
and UI unchanged.

Pilot field map (7 intake fields → `multi_instance.w2_records.*` leaves).
Synthetic aggregate rules replace TaxCore `w2_income` module writers for Box 1
→ `income.wages_salaries_tips` and Box 2 → `payments.w2_withholding_amount`.
Box 12W HSA aggregate stays in the **8889** package (module `hsa`).

Form mapping / metadata: **merge by `canonical_field`** — do not wipe TaxCore's
other ~41 W-2 leaves.

## Form 1040 (export projection — like W-2)

Form 1040 keeps `form_1040_line_*` in our DB/engine/UI/goldens. TaxCore uses
domain paths (`income_calculated.*`, `taxes.*`, `payments.*`, `refund.*`) and
**six worksheets** (`form_1040_agi_worksheet`, `form_1040_taxable_income_worksheet`,
`form_1040_total_tax_worksheet`, `form_1040_refund_worksheet`,
`form_1040_amount_owed_worksheet`, plus their income-tax worksheet for QDCG).

**Decision:** `export-taxcore --form 1040` projects via
`build/export/taxcore_targets/form_1040.py`:

| Category | Handling |
|---|---|
| Pilot calc chain (16 rules) | Mapped to TaxCore `rule_id` + worksheet leaf via `rule_projections` |
| Lines 1a / 25a | **Skipped** — owned by `w2_income` package |
| Lines 8 / 10 / 13b (schedule carryovers) | **Skipped as rules** — operands rewrite to schedule canonical paths |
| Stub constant-$0 lines (17, 19–20, 27a–31, 36, 38) | **Skipped** — referenced operands zeroed in exported formulas |
| Line 16 `federal_income_tax` | Export → `tax_table` on `income_calculated.taxable_income_amount` |
| Line 12e standard deduction | Condition field in our engine; maps to `deductions.standard_deduction_amount` |

Module: `form_1040_base` (pilot subset). Import: **REPLACE** pilot calc rules;
**MERGE** form_mapping / metadata by `canonical_field`.

## Integration bundle (Schema-Automation-compatible)

Per-form packages stay at `output/ty{year}/taxcore/{form}/` for review.
One command builds a **flat, deploy-ready** tree matching
TaxMD-Schema-Automation-New's layout:

```bash
python -m build.cli export-taxcore-bundle --tax-year 2025
# optional baseline merge from sibling TaxCore checkout:
python -m build.cli export-taxcore-bundle --taxcore-root ../TaxMD-TaxCore
```

Writes `output/ty{year}/taxcore_bundle/`:

| Artifact | Role |
|---|---|
| `calculation_rules/*.json` | Flat rules (additive `load_schemas --type rules`) |
| `form_mappings/form_mapping_irs_*.json` | Merged with TaxCore baseline when `--taxcore-root` set |
| `calculation_schema.json` | Baseline worksheets + our patch upserts |
| `canonical_schema.json` | Baseline + patch leaf upserts |
| `field_metadata.json` | Merged metadata (automation naming alias) |
| `modules/*.json` | Avatar wiring (manual step before load) |
| `deploy_to_taxcore.sh` | Copy into `TaxMD-TaxCore/data/schema/` |
| `import_notes.json` | Unified load order + per-form notes |

TaxCore import after deploy: `uv run python manage.py load_schemas --update-latest`

**Not generated** (stay in TaxCore / Schema Automation): `tax_constants`,
full `avatars`/`scenarios`, `field_registry`. Our engine/goldens unchanged.

## What we deliberately leave alone in TaxCore
- Spouse fields (`spouse.*`) — we don't model joint/spouse yet; leave theirs.
- Their broader 8889 worksheet rule set that duplicates / stubs lines we
  haven't replaced — disable via avatar module swap + `import_notes`, not by
  deleting files from this repo.
- `canonical_schema` whole-file replace — we only ship **patches** (key-level
  upsert / worksheet-key replace).

## Consequences
- Build modules must use `form_field_condition()` / `FORM_FIELD_NAME_OVERRIDES`
  instead of `field_name.like("form_8889_line_%")`.
- Golden cases for 8889 use TaxCore names in both inputs and expected outputs.
- `export-taxcore` produces drop-in files under `output/ty{year}/taxcore/{form}/`.
- Next forms follow: rename **or** export projection (W-2) → bridge → golden
  cases → add `build/export/taxcore_targets/form_XXXX.py` → `export-taxcore`.
