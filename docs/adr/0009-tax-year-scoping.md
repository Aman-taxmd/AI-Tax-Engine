# ADR 0009: Year-agnostic `tax_year` scoping, database-backed tax constants, and the self-employment/W-2/refund build-out

## Status
Accepted

## Context
Everything built through Phase 5 (the HSA pilot: Form 8889 → Schedule 1 →
Form 1040, plus Schedule 1-A) implicitly assumed exactly one tax year.
Three concrete gaps made this explicit:

1. **No `tax_year` column.** `canonical_fields`, `calc_rules`,
   `intake_questions`, and `pdf_field_mappings` had a single global
   namespace keyed only by `field_name`/`rule_id` — there was no way for a
   2026 canonical field with the *same name* (e.g. `form_8889_line_2`, whose
   meaning is year-stable) to coexist with its 2025 counterpart if the
   *rule* behind it changes (e.g. a contribution limit or bracket).
2. **Hardcoded Python constants.** `runtime/tax_constants.py` was a flat
   dict of 2025 dollar amounts (`_2025` suffix baked into every constant
   name in `runtime/condition_rules.py`), not sourced from any table —
   adding a second year meant duplicating every function, not adding a row.
3. **No taxpayer-facing year selection.** The Streamlit app had no concept
   of "which year is this return for" at all.

Separately, the plan called for extending the pilot beyond HSA/1040-core
into three new chains that make the "one year, hardcoded" problem worse if
left unaddressed before building them: Schedule C → Schedule SE → Schedule
2 (self-employment tax), a multi-box W-2 (Box 2/3/12-W), and Form 1040's
Payments/Refund/Amount-You-Owe section (Lines 25-38) — four more IRS
documents, each with their own year-specific dollar constants (OASDI wage
base, mileage rate) that would otherwise have been hardcoded a second time.

`TaxMD-TaxCore` was reviewed as a reference point (not copied wholesale —
its own `tax_constants_2025.json` was found to have a stale, pre-OBBBA
standard deduction and a mislabeled HSA catch-up unit; only its *pattern*
was adopted, not its *values*): a denormalized `tax_year` integer column on
every year-scoped table, plus a single `TaxConstants` model storing a
year-keyed JSON blob rather than one column per constant.

## Decision

### 1. `tax_year` as a denormalized column, not a separate scenario table
`CanonicalField`, `CalcRule`, `IntakeQuestion`, and `PdfFieldMapping` each
gained a `tax_year: int` column (default `2025`, `nullable=False`), and
their uniqueness constraints were extended to include it (e.g.
`UniqueConstraint("field_name", "tax_year")`). `scripts/migrate_tax_year_columns.py`
performs this as idempotent `ALTER TABLE` statements (SQLAlchemy's
`Base.metadata.create_all()` only creates missing tables, never alters
existing ones — see `db/session.py`'s `init_db()`). Every DAG-loading query
in `runtime/engine.py`, every synthesis/consolidation/export/evaluation
module, and every UI data-access call was threaded with an explicit
`tax_year` parameter (default `2025`) rather than relying on an implicit
single-year assumption.

### 2. `TaxConstants`: one year-keyed JSON blob, not N hardcoded dicts
A new `TaxConstants` table (`tax_year` primary/unique key, `constants: JSON`)
replaces `runtime/tax_constants.py` entirely (deleted).
`scripts/seed_tax_constants.py` seeds 2025's row — standard deduction (by
filing status), HSA contribution limits + catch-up, Schedule 1-A thresholds
(tips/senior deductions), self-employment tax rates + OASDI wage base, and
the standard mileage rate — every value carrying its own IRS citation in
the JSON itself, not just in a code comment. `runtime/tax_constants_lookup.py`
provides `get_tax_constant(tax_year, dotted.path)` — a single database-backed
lookup function — and `runtime/condition_rules.py`'s hand-authored
structured conditions (age-55 HSA catch-up, coverage-type limits) now accept
`tax_year` and call this lookup instead of importing a `_2025`-suffixed
constant.

Hardcoded numeric literals still exist in the five new hand-authored bridge
files (`_OASDI_WAGE_BASE_2025 = 176100.0` etc.) — this is a **documented,
temporary exception**, not an oversight: bridges are Python modules invoked
once per `tax_year` argument, and wiring every last multiplier through the
lookup table was out of scope for this round (see "Future 2026 rollout"
below for what actually blocks a second year today).

### 3. Ephemeral, session-scoped tax year selection in the UI
`ui/data_access.py::render_tax_year_selector()` renders a sidebar
`st.selectbox` over `AVAILABLE_TAX_YEARS` (today: `[2025]` — a year is
"available" once it has a seeded `TaxConstants` row and built-out
canonical fields/calc rules, not just because the calendar turned over),
storing the choice in `st.session_state` — never persisted to the database,
consistent with this pilot's existing "taxpayer sessions are ephemeral"
design (ADR 0007). Every page threads the selected year into every
`data_access` call for that render.

### 4. Self-employment / W-2 / refund build-out, using the same scoping
Five new hand-authored bridges were added on top of this scaffolding, each
accepting `tax_year` and each following the existing bridges' "delete and
rewrite every rule/edge this module owns, every re-run" idempotency
convention:
- `schedule_c_bridge.py` — Schedule C Parts I/II (single business, regular
  method; mileage-rate-based car/truck expense).
- `schedule_se_bridge.py` — Schedule SE Part I (single nonfarm business,
  regular method), including Box 3 from every W-2 via `sum_instances`.
- `schedule1_income_bridge.py` — wires Schedule C's net profit into
  Schedule 1 Part I's total, which (newly) actually reaches Form 1040 line
  8 (previously a raw, disconnected taxpayer input).
- `schedule_2_bridge.py` — Schedule 2 Part II (self-employment tax +
  Form 8889 Part II/III HSA-distribution additional taxes, including the
  20%-tax Exceptions-checkbox gate).
- `form1040_refund_bridge.py` — Form 1040 Lines 25-38 (payments, refund,
  amount owed).

Three new engine formula types were added to support these
(`runtime/engine.py`): `multiply_unless_flag` (a checkbox gates a
multiplication to `$0`), `multiply_floor_zero`, and `min_multiply`.

### 5. Phase 8 override scripts for hand-authored worksheet arithmetic
As with `scripts/override_tax_computation_rules.py` (Form 1040 Lines
16-24), the Phase 8 LLM grounding judge frequently misjudges hand-authored,
verbatim-quoted, pure form-arithmetic rules — either false-positive "wrong
formula type" complaints about a deliberate, documented scope decision
(e.g. a constant-`$0` not-modeled schedule, or a "sum with empty operands"
representing a fixed printed dollar constant), or outright hallucinations
(claiming a condition block exists in a formula with none at all). Twice
during this round, its automated repair loop **actively regressed** a
correct rule (spliced two `CheckboxType` fields into a `sum` for Schedule
1 line 10; downgraded `subtract_floor_zero` to plain `subtract` for Form
1040 lines 34/37, which can then go negative) — caught only by re-running
`build/evaluation/golden_cases.py` afterward, not by the judge itself.
`scripts/override_selfemployment_bridge_rules.py` promotes all 63
rules from the five new bridges to `validated` in one pass, after manual
verification against golden cases, exactly like the Lines 16-24 precedent.

## Rationale
A denormalized `tax_year` column (not a separate `Scenario`/`TaxReturn`
join table, and not year-specific table names) was chosen because every
consumer of these tables already keys everything off a string name
(`field_name`/`rule_id`), never a numeric primary key relationship — adding
one more filter column to an existing query is additive, not a schema
redesign. A single JSON-blob `TaxConstants` row per year (rather than one
column per constant) means adding a genuinely new constant (say, a new
2026-only threshold) never requires a migration, only a new key in next
year's seed script — the same flexibility `TaxMD-TaxCore` gets from its own
JSON-blob approach, without inheriting its stale/mislabeled data.

## Consequences
- Every synthesis/consolidation/export/evaluation call site now takes an
  explicit `tax_year` (default `2025`) instead of assuming a single global
  year — auditable via a grep for `tax_year: int = 2025` across `build/`
  and `runtime/`.
- `golden_cases.py`'s scenarios each carry their own `tax_year`, so a
  future 2026 golden case runs against 2026's constants/rules without
  touching 2025's.
- Hand-authored bridges reset every rule they own to `status="candidate"`
  on every re-run (by design, for their own idempotency) — this means
  **`evaluate` must be re-run (or the corresponding override script
  re-applied) after any bridge re-run**, exactly like
  `tax_computation_bridge.py` already required. This is a known, accepted
  operational sequencing cost, not a bug.
- Five hardcoded numeric literals remain outside the `TaxConstants` lookup
  (see "Future 2026 rollout" below) — a deliberate, tracked scope
  boundary, not a silent gap.

## Future 2026 rollout process
Bringing up a second tax year is intended to be additive, not a rewrite.
Concretely, in order:

1. **Seed 2026's constants.** Write `scripts/seed_tax_constants.py`'s 2026
   equivalent (or extend it to accept `--tax-year`) once the IRS publishes
   final 2026 amounts (standard deduction, HSA limits, OASDI wage base,
   mileage rate, Schedule 1-A thresholds) — each with its own citation, same
   convention as 2025's row. Add `2026` to `ui/data_access.py`'s
   `AVAILABLE_TAX_YEARS` only after this step, not before.
2. **Re-run discovery/ingestion selectively.** Most canonical fields (same
   line, same meaning) carry over unchanged except their year tag — but
   IRS instruction *text* and dollar amounts printed directly on forms
   (e.g. Schedule SE line 7's `$176,100`) do change per year. Re-run
   `discover`/`download`/`parse`/`extract` only for documents whose
   `source_url` actually changed (the 2025 → 2026 IRS instructions URL
   pattern, e.g. `irs.gov/instructions/i1040sse` moving from a 2025 to a
   2026 revision) — Phase 8's `baseline_diff` evaluation type exists
   specifically to flag what changed between two tax years' runs of the
   same form (see `build/evaluation/run_all.py`'s module docstring;
   numeric/baseline-diff execution itself is still future work beyond this
   round).
3. **Re-run synthesis with `--tax-year 2026`.** `canonical_field_writer.py`,
   `calc_rule_writer.py`, `question_registry.py`, and `pdf_field_mapper.py`
   all already accept `tax_year` — running them for `2026` creates a
   parallel, non-destructive set of `tax_year=2026` rows alongside the
   existing `tax_year=2025` ones (uniqueness constraints are
   `(field_name, tax_year)`-scoped, never a bare `field_name`).
4. **Re-run every hand-authored bridge with `--tax-year 2026`**, in the
   same dependency order as this round (W-2 → Schedule C → Schedule SE →
   Schedule 1 income → Schedule 2 → tax computation → refund/owe →
   HSA/Schedule-1-A worksheets → cross-form bridge) — update any hardcoded
   numeric literal in a bridge (e.g. `_OASDI_WAGE_BASE_2025`,
   `_MILEAGE_RATE_2025`) to read from `tax_constants_lookup.get_tax_constant(2026, ...)`
   or its 2026-dated equivalent, per bridge, as each is touched — this is
   the point at which the "hardcoded literal in a bridge" exception noted
   above gets closed out incrementally, not all at once.
5. **Add 2026 golden cases**, mirroring 2025's (a plain-W-2 HSA case, the
   Tax Table/Worksheet `$100,000` boundary case, a self-employment case,
   an HSA-distribution case) with 2026's own expected numbers, and run
   `run-golden-cases` to confirm no regression to 2025's existing cases
   (each golden case is `tax_year`-scoped, so old and new coexist).
6. **`evaluate --form <form> --tax-year 2026`** for every form, then apply
   or extend the relevant override script(s) for any hand-authored
   worksheet-arithmetic rule the judge misjudges (expect the same handful
   of forms as this round: tax computation, self-employment chain,
   refund/owe) — verified against step 5's golden cases before promoting.
7. **Flip `AVAILABLE_TAX_YEARS` to `[2025, 2026]`** in
   `ui/data_access.py` (already reads as a plain list, no code path change
   needed) once steps 1-6 are verified — taxpayers can then pick either
   year in the sidebar, each fully isolated by `tax_year`.

## Addendum: XSD line-number collision bug (found while testing Schedule C)

While walking through the self-employment chain's taxpayer-facing questions,
Schedule C's Line 1 ("Gross receipts or sales") rendered as a yes/no
checkbox question ("Does this apply to you: Statutory Employee...") instead
of a dollar amount. Root cause, confirmed by grepping every pilot XSD: real
IRS MeF schemas routinely reuse one printed `LineNumber` across more than
one element — e.g. `IRS1040ScheduleC.xsd`'s line `1` covers BOTH
`TotalGrossReceiptsAmt` (the dollar figure) AND `StatutoryEmployeeFromW2Ind`
(an unrelated attachment checkbox). `canonical_field_writer.py`'s original
logic built `field_name` purely from the line number and skipped creating a
field if that name already existed — so whichever element happened to
appear *first in the XSD file* silently won the name, and the other was
dropped entirely, with no warning.

A scan of every pilot form's XSD found 14 such collisions total. Two more
(Schedule 1 lines 4 and 7) turned out to be live bugs, not just cosmetic:
both had been documented in `schedule1_income_bridge.py`'s original
docstring as "no dollar element exists for this line" and deferred to $0 —
which was factually wrong, caused by this same bug hiding
`OtherGainLossAmt` (line 4) and `UnemploymentCompAmt` (line 7) behind a
checkbox that won the collision instead. The other 11 collisions were
checked individually and found to be harmless: either legitimate checkbox
pairs already handled correctly (e.g. Form 8889 line 1's self-only/family
boxes), or fields fully overridden by an existing hand-authored `CalcRule`
(e.g. Form 1040 lines 15/24/35a), where the XSD metadata is cosmetically
imprecise but the computed value is unaffected.

Fix, applied in two parts:
1. `canonical_field_writer.py` now resolves these collisions generically for
   any future form/year: within a colliding line-number group, the one
   non-checkbox ("real value") element keeps the plain line number; every
   other element gets a distinguishing suffix (e.g.
   `form_1040sc_line_1_statutory_employee_from_w2_ind`) instead of being
   silently dropped. A small manual override table
   (`_MANUAL_PRIMARY_OVERRIDES`) settles the rare case where more than one
   non-checkbox element collides (Schedule 1 line 7: `RepaymentAmt` vs.
   `UnemploymentCompAmt` — verified against the real `f1040s1.pdf`, which
   prints line 7 as "Unemployment compensation").
2. `scripts/fix_line_collision_fields.py` is a one-time repair for the three
   already-built rows this bug affected (`form_1040sc_line_1`,
   `form_1040s1_line_4`, `form_1040s1_line_7`), correcting each in place and
   creating the previously-dropped secondary fields. Schedule 1 lines 4 and
   7 are now real modeled pure inputs, wired into `form_1040s1_line_10`'s
   sum in `schedule1_income_bridge.py`.

This is the same lesson as the rest of this ADR: don't let build-order or
file-order accidents silently decide correctness — surface every collision,
resolve it with a stated reason, and re-verify with golden cases (all 5
still pass unchanged after this fix).
