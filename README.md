# AI Tax Engine — HSA + Self-Employment + W-2 Pilot (Form 8889/Schedule C/SE/1/1-A/2 → Form 1040)

A content-addressed, incremental knowledge compiler that converts
authoritative IRS sources into immutable, versioned, evidence-backed
canonical fields and calculation rules — plus a minimal runtime engine that
executes them. This pilot covers three converging chains end to end:
**Form 8889** (HSA activity, including Part II/III distribution taxes) →
**Schedule 1** (deductions/additional income, plus **Schedule 1-A**'s new
2025 additional deductions) → **Form 1040**; **Form W-2** (multi-instance,
Boxes 1/2/3/5/12-W) → **Schedule C** (self-employment income) →
**Schedule SE** (self-employment tax) → **Schedule 2** → **Form 1040**,
all the way through tax computation (Lines 16-24) and
payments/refund/amount-owed (Lines 25-38). Every canonical field, calc
rule, intake question, and PDF field mapping is scoped by an explicit
`tax_year` (today: 2025 only) — see `docs/adr/0009-tax-year-scoping.md` for
the year-agnostic architecture and the process for bringing up 2026. See
`docs/plan.md`-equivalent (the original plan document) for full rationale;
`docs/adr/` for the individual design decisions.

## Repository layout

```
build/            # everything that turns IRS documents into rules (build-time only)
  contracts/      # Pydantic schemas for pipeline artifacts
  sources/catalog/# seed catalog of IRS URLs per form (form_8889.yaml, form_1040.yaml)
  ingestion/      # discovery, download, version store, structural parser, pattern detector
  graph/          # LangGraph knowledge-extraction workflow + Bedrock client (extract + judge)
  consolidation/  # concept dedup, dependency graph (field->concept only, see ADR 0008), cross-form bridge (8889 -> Sched 1 -> 1040)
  synthesis/      # canonical field writer (XSD-based) + calc rule agent (LLM, ADR 0008) + pdf_field_mapper.py (LLM, ADR 0008)
  evaluation/     # Phase 8: grounding check (LLM-as-judge) + bounded repair loop (ADR 0008); numeric/baseline-diff are future work
  export/         # writes canonical fields / calc rules / form mappings out to output/*.json
runtime/          # calculation engine + explainability trace (never imports build/)
  engine.py       # compute(): deterministic DAG executor (canonical_fields/calc_rules/dependency_edges)
  condition_rules.py # hand-authored structured conditions (age-55 catch-up, coverage-type limit), IRS-cited
  chain.py        # ancestor_closure(): backward BFS scoping the pilot to the modeled HSA field set
db/               # SQLAlchemy models + session (shared data-access layer) + schema.sql (Postgres DDL)
ui/               # Streamlit app (see "Streamlit app" below) — sits on top of build/ + runtime/ + db/
  pdf_render.py   # fills + renders the actual IRS PDF with computed values (ADR 0008) — presentation-only
docs/adr/         # Architecture Decision Records
scripts/          # one-off maintenance/migration/override scripts (see ADR 0009; each is self-documenting)
golden_cases/     # hand-authored + baseline-sourced test scenarios (build/evaluation/golden_cases.py)
output/           # JSON projection of the DB (see "Evaluation, export, and form mapping" below) — gitignored
data/             # local artifact storage (documents, evidence) — gitignored
var/              # local SQLite dev database — gitignored
```

`build/consolidation/` also holds every **hand-authored bridge** — pure
form-printed worksheet arithmetic with no instructions-prose paragraph of
its own for the general LLM pipeline to extract from (e.g. "add lines 10
and 11"). Each is independently re-runnable via its own `build.cli`
command, accepts `--tax-year`, and documents its exact modeled/deferred
scope in its own module docstring: `w2_bridge.py`, `w2_pdf_bridge.py`,
`hsa_worksheet_bridge.py`, `schedule_1a_bridge.py`, `form1040_income_bridge.py`,
`tax_computation_bridge.py` (+ `tax_computation_pdf_bridge.py`),
`schedule_c_bridge.py`, `schedule_se_bridge.py`, `schedule1_income_bridge.py`,
`schedule_2_bridge.py`, `form1040_refund_bridge.py`, `cross_form_bridge.py`,
`checkbox_field_bridge.py`.

## Running

```bash
uv venv .venv && source .venv/bin/activate
uv pip install -e .
cp .env.example .env   # then fill in AWS credentials for real Bedrock calls
python -m build.cli run-pilot --form 8889
```

`run-pilot` runs one form's full phase sequence (discover → parse →
detect-patterns → extract → consolidate → synthesize → evaluate → export →
form-mapping → generate-questions → map-pdf-fields). To build out the whole
HSA chain from scratch:

```bash
python -m build.cli run-pilot --form 8889     # the pilot form itself
python -m build.cli run-pilot --form 1040     # ingests Form 1040 + Schedule 1 (see catalog note below)
python -m build.cli synthesize --form 1040s1  # Schedule 1's own canonical fields (see "Multiple forms" below)
python -m build.cli bridge-forms              # links 8889 line 13 -> Schedule 1 line 13 -> 1040 line 10
python -m build.cli evaluate --form 1040s1 && python -m build.cli evaluate --form 1040
python -m build.cli export --form 1040s1 && python -m build.cli form-mapping --form 1040s1
```

Cost segregation + W-2 (IRS-grounded hybrid — see `docs/adr/0012-irs-grounded-hybrid-provenance.md`):

```bash
python -m build.cli cost-seg-irs-setup --tax-year 2025   # 4562 + 1040se pipeline + bridges + PDF promotion
python -m build.cli w2-irs-setup --tax-year 2025         # W-2 XSD catalog + w2-bridge + PDF promotion
python -m build.cli cost-seg-setup --tax-year 2025       # bridges only (after synthesize)
python -m build.cli promote-pdf-ground-truth --form 4562 # re-apply verified widget codes after map-pdf-fields
```

## Streamlit app

A taxpayer-facing app and a reviewer-facing queue, both built entirely on
top of the pipeline above (no separate backend). Launch it once the DB has
at least `8889` built (`python -m build.cli run-pilot --form 8889` — see
above):

```bash
streamlit run ui/app.py
```

It opens with three pages in the sidebar:

- **1 · Build Control** — a sidebar tax-year selector (see "Tax years"
  below) plus per-form status (documents/fields/rules/questions counts,
  rule status breakdown, pending Phase 8 reviews) for every pilot form
  (`8889`, `1040s1`, `1040s1a`, `1040sc`, `1040sse`, `1040s2`, `1040`, plus
  W-2 as a special multi-instance case), plus buttons that shell out to the
  exact same
  `python -m build.cli <phase> --form <form>` commands documented below
  (streaming stdout/stderr back into the page) — nothing here is a
  lookalike of the CLI, it *is* the CLI. Built on a form-agnostic
  `run_phase(phase, form)` helper in `ui/data_access.py`, so onboarding a
  new form later is an additive button, not a rewrite.
- **2 · Answer Questions** — the taxpayer flow. The sidebar asks the
  Question Registry's questions (`build/synthesis/question_registry.py`'s
  output, `intake_questions` table): a few hand-authored profile questions
  (age, HDHP coverage type, filing status —
  `build/sources/profile_questions.yaml`) plus one auto-derived question
  per raw input field on Form 8889/Schedule 1/Form 1040, each with an
  expandable "why am I being asked this" justification and exact IRS quote.
  Every answer triggers a live, 100%-deterministic, LLM-free recompute via
  `runtime/engine.py`, rendered as a 3-tab form view (8889 → Schedule 1 →
  1040) — each line shows its value, computation status, and the rule's
  status (`candidate`/`validated`/`production`, badged, never hidden), with
  an expandable trace (formula, upstream fields, IRS quote, Phase 8
  grounding result). Each form's tab also has a "Realistic form view"
  expander that fills and renders the **actual IRS PDF** (via
  `ui/pdf_render.py` + PyMuPDF, using `pdf_field_mappings` — see ADR 0008)
  live as you answer questions, plus a "Download filled PDF" button — not a
  replacement for the line-by-line view above, an additional, literal one.
  A "Review my return" button runs the third, on-demand LLM ("CPA review" —
  advisory only, see `docs/adr/0007`), which can flag implausible values or
  cross-reference a Phase 8 grounding failure but can never change a
  computed number. The taxpayer's answers themselves live only in the
  browser's `st.session_state` (ephemeral — nothing is written to the DB);
  only the review's *findings* are logged, to `runtime_review_findings`,
  for audit.
- **3 · Human Review Queue** — replaces the `resolve-review` /
  `resolve-calc-rule-review` / `resolve-pdf-field-mapping-review` CLI
  commands. Lists every pending `human_review_items` row across three kinds
  (each fully self-contained via `HumanReviewItem.detail` — source URL,
  exact quote, draft/rule, issues — no extra joins needed):
  - **Extraction** (Phase 5 pauses): accept / correct /
    **retry-with-feedback** (re-invokes the LLM with your note injected
    into the prompt, `llm_client.extract_with_feedback`).
  - **Calc rule** (Phase 8 grounding flags that survived the bounded
    automated repair loop — see ADR 0008): accept / manually-correct-the-
    formula. The UI surfaces how many automated repair attempts already
    ran and their `likely_cause` classification before this needed a human.
  - **PDF field mapping** (low-confidence or unmapped canonical-field ->
    PDF-field-code proposals — see ADR 0008): accept / manually map to a
    field code by hand.

See `docs/adr/0005-build-runtime-separation.md`'s amendment and
`docs/adr/0007-runtime-review-is-advisory-only.md` for why the app is
allowed to read `candidate`/`validated` rules (not just `production`) and
exactly how the advisory LLM review is scoped as a deliberate, documented
exception rather than a quiet violation of build/runtime separation.

### Multiple forms in one database ("form" identities)

Line numbers collide across forms (8889, Schedule 1, and 1040 each have their
own unrelated "line 13"), so every canonical field is namespaced by a form
identity string, not just the literal form number:

| identity | what it is | catalog | own instructions doc? |
|---|---|---|---|
| `8889`   | Form 8889 (HSA) | `build/sources/catalog/form_8889.yaml` | yes (`i8889`) |
| `1040`   | Form 1040 itself | `build/sources/catalog/form_1040.yaml` | yes (`i1040gi`) |
| `1040s1` | Schedule 1 (Form 1040) | *(discovered from the same 1040 catalog — Schedule 1 has no separate "About" page)* | no — its line instructions are printed inside `i1040gi`, not extracted by this pilot; its canonical fields come from its own XSD (`IRS1040Schedule1.xsd`) only |
| `1040s1a`| Schedule 1-A (Form 1040), new for 2025 | `build/sources/catalog/form_1040s1a.yaml` | no — same situation as Schedule 1 |
| `1040sc` | Schedule C (Form 1040) | `build/sources/catalog/form_1040sc.yaml` | yes (`i1040sc`) |
| `1040sse`| Schedule SE (Form 1040) | `build/sources/catalog/form_1040sse.yaml` | yes (`i1040sse`) — though its own worksheet lines are hand-authored, see below |
| `1040s2` | Schedule 2 (Form 1040) | `build/sources/catalog/form_1040s2.yaml` | no — same situation as Schedule 1 |
| `4562`   | Form 4562 (cost seg pilot) | `build/sources/catalog/form_4562.yaml` | yes — `synthesize --canonical-only`; engine authoritative (ADR 0012) |
| `1040se` | Schedule E (cost seg pilot) | `build/sources/catalog/form_1040se.yaml` | yes — `synthesize --canonical-only`; engine authoritative (ADR 0012) |
| `w2`     | Form W-2 (multi-instance) | `build/sources/catalog/form_w2.yaml` | yes (`iw2w3` + `IRSW2.xsd`) — `run-pilot --form w2` + `w2-bridge` for sum_instances (ADR 0012) |

Cross-form connections that aren't separately extractable line-by-line
(because the destination form's own instructions don't restate the source
form's arithmetic) are wired by hand-authored bridges instead of the
general LLM pipeline — `build/consolidation/cross_form_bridge.py` (8889 →
Schedule 1 → 1040), `schedule1_income_bridge.py` (Schedule C → Schedule 1 →
1040), `schedule_2_bridge.py` (Schedule SE + Form 8889 Part II/III →
Schedule 2 → 1040), each grounded in a verbatim IRS quote already in the
database (never invented). Read each file's module docstring for its exact
modeled/deferred scope.

### Tax years

Every canonical field, calc rule, intake question, and PDF field mapping
carries an explicit `tax_year` column (default `2025`) — see
`docs/adr/0009-tax-year-scoping.md` for the full architecture and the
step-by-step process for bringing up a second year. In short:

- **Constants live in the database, not in code.** `TaxConstants` (one
  row per year, a JSON blob) replaces what used to be a hardcoded Python
  dict — `scripts/seed_tax_constants.py` seeds 2025's row (standard
  deduction, HSA limits, Schedule 1-A thresholds, self-employment rates,
  mileage rate), each value citation-tagged. `runtime/tax_constants_lookup.py`
  is the one place anything reads a constant from.
- **The taxpayer picks a year once per session**, in the Streamlit
  sidebar (`ui/data_access.py::render_tax_year_selector()`) — stored only
  in `st.session_state`, never the database, consistent with this pilot's
  ephemeral-session design (see ADR 0007). `AVAILABLE_TAX_YEARS` is a
  plain list; a year only appears there once it actually has seeded
  constants and built-out rules.
- **2026 is additive, not a rewrite** — new `tax_year=2026` rows coexist
  with `tax_year=2025` rows for the exact same `field_name`/`rule_id`
  (uniqueness constraints are `(name, tax_year)`-scoped). See ADR 0009's
  "Future 2026 rollout process" for the exact 7-step sequence.

### Database

`db/session.py` resolves the connection in this order: `DATABASE_URL` env var
(if set) → `DB_NAME`/`DB_USER`/`DB_PASSWORD`/`DB_HOST`/`DB_PORT` env vars
(same convention as TaxMD-TaxCore's `.env`, assembled into a Postgres URL) →
a local SQLite file at `var/ai_tax_engine.db` as a last resort.

This project's Postgres database is named **`ai_tax_engine`** (a fresh
database, separate from TaxCore's `taxcore`/`taxcore_dev`/`taxcore_vector`).
`.env.example`/`.env` are already set up for it:

```bash
DB_NAME=ai_tax_engine
DB_USER=postgres
DB_PASSWORD=postgres123
DB_HOST=localhost
DB_PORT=5432
```

`python -m build.cli init-db` (or `run-pilot`, which calls it first)
provisions all tables via SQLAlchemy metadata (`db/models.py`) — this is what
actually runs day to day, against SQLite or Postgres alike. `db/schema.sql`
documents the authoritative production DDL (JSONB columns, CHECK constraints,
enums) for a DBA hand-provisioning a fresh Postgres instance; it isn't
required for local development.

### LLM (Bedrock)

`build/graph/llm_client.py` calls AWS Bedrock the same way TaxMD-TaxCore's
intent classifier does (`apps/ai_chatbot/intent_classification/intent_classifier.py`
+ `utils/aws.py` in that repo): a boto3 `bedrock-runtime` client using explicit
`AWS_ACCESS_KEY_ID`/`AWS_SECRET_ACCESS_KEY` from `.env` when present, otherwise
the default boto3 credential chain, invoking `invoke_model` with the Anthropic
Claude Messages format. The model is **Claude Sonnet 4.5**
(`us.anthropic.claude-sonnet-4-5-20250929-v1:0`, region `us-east-1` by
default) — the same model TaxCore uses for intent classification
(`INTENT_CLASSIFICATION_MODEL_ID` in its `.env.example`). Override via
`BEDROCK_MODEL_ID` / `AWS_BEDROCK_REGION_NAME` / `BEDROCK_MAX_TOKENS` /
`BEDROCK_TEMPERATURE` in `.env`.

If no AWS credentials resolve (or the call fails for any reason), extraction
falls back to a clearly-labeled deterministic stub
(`model_version="stub-deterministic-v1"`) so the pipeline still runs
end-to-end and produces inspectable output — no code changes are needed to
switch between stub and real LLM, only credentials. Check
`evidence_bundles.model_version` in the DB (or any exported calc rule's
`irs_reference`) to confirm which one actually ran.

**Temporary credentials (SSO / AssumeRole, `AWS_ACCESS_KEY_ID` starting with
`ASIA...`)** also need `AWS_SESSION_TOKEN` set in `.env` — a permanent IAM
user key (`AKIA...`) doesn't. Temporary tokens expire (often in 1–12h) and
need refreshing periodically (e.g. `aws sso login --profile <profile>`, then
copy the refreshed `aws_session_token` into `.env`).

There are five independent LLM call sites, at five different phases, doing
five different jobs — this was a deliberate requirement, not a coincidence
(see `docs/adr/0008-llm-driven-calc-rule-synthesis.md` for the full
rationale behind adding the last three):

1. **Extraction** (`build/graph/nodes/extractor.py` → `llm_client.extract()`,
   Phase 4) — reads raw IRS instruction text and drafts a knowledge packet.
2. **Calc rule agent** (`build/synthesis/calc_rule_writer.py` →
   `llm_client.synthesize_calc_rule()`, Phase 7) — decides, per canonical
   field, whether it's a pure taxpayer input or computed, and if computed,
   its formula/operands/conditions — constrained to a real candidate-operand
   list, replacing the old regex-based dependency-graph/formula-writer
   heuristics (which had four confirmed bugs: no negation detection, silent
   line-ref resolution failures, a hard 500-char quote truncation, and an
   unsafe "sum" default).
3. **Grounding judge** (`build/evaluation/grounding_check.py` →
   `llm_client.judge_grounding()`, Phase 8) — a *separate* call that re-reads
   the already-synthesized rule (formula + operands) against the exact quote
   it cites, judges whether it's faithful, and classifies a `likely_cause`
   for any failure. A bounded (`MAX_REPAIR_ATTEMPTS = 3`) loop routes
   failures back to the calc rule agent (or a re-extraction, if the *quote*
   itself was incomplete) before ever falling to human review — see
   `run_grounding_check`'s module docstring.
4. **PDF field mapping** (`build/synthesis/pdf_field_mapper.py` →
   `llm_client.map_pdf_fields()`, run once per form) — matches each in-scope
   canonical field to the real IRS PDF's cryptic AcroForm field code (e.g.
   `f1_2[0]`), using page/position evidence since the codes carry no
   description text. Low-confidence or unmatched proposals go to human
   review rather than silently mis-filling a box on the real form.
5. **Return review** (`ui/data_access.py` → `llm_client.review_return()`,
   on-demand, advisory only — see `docs/adr/0007`) — a taxpayer/reviewer-
   triggered "CPA sanity check" on the already-computed return; never
   changes a number.

## Evaluation, export, and form mapping

```bash
python -m build.cli evaluate --form 8889      # Phase 8: LLM-as-judge grounding check + bounded repair loop
python -m build.cli evaluate --form all       # judge every candidate rule regardless of form

python -m build.cli export --form 8889        # -> output/ty2025/8889/{canonical_fields,calc_rules}/*.json
python -m build.cli form-mapping --form 8889  # -> output/ty2025/form_mappings/form_mapping_8889.json
python -m build.cli map-pdf-fields --form 8889 # LLM-proposed canonical-field -> real PDF field code mapping
```

`evaluate` runs the grounding check (`run_type='grounding_check'` in
`evaluation_runs`) with a bounded, automated repair loop (see ADR 0008) —
numeric golden-case execution and baseline-diff need a runtime calc engine
and a loaded baseline rule set respectively, both future work (see
`build/evaluation/run_all.py`). A rule that passes (immediately, or after a
successful repair attempt) moves `candidate` → `validated` (never straight
to `production` — that still needs those two checks); a rule that still
fails after `MAX_REPAIR_ATTEMPTS` (or that the judge couldn't classify a
fixable cause for) stays `candidate` and gets a `human_review_items` row,
per the plan's "AI → Validator → Human if needed → Production" flow.
`map-pdf-fields` requires the form's PDF to be catalogued (`doc_type='form'`
in its `build/sources/catalog/form_{form}.yaml`'s `include_doc_types`).

**Hand-authored bridges and the Phase 8 judge.** The LLM grounding judge is
tuned for prose-extracted rules; it frequently misjudges pure form-printed
worksheet arithmetic (a deliberate constant-`$0` scope decision, a fixed
printed dollar constant, a carryover total) as "wrong", and its bounded
repair loop has, on occasion, actively regressed an already-correct
hand-authored formula (see `docs/adr/0009-tax-year-scoping.md`). Every
hand-authored bridge also resets the rules it owns back to `candidate` on
every re-run, by design, for its own idempotency — so `evaluate` (or the
matching override script) needs re-running after any bridge re-run.
`scripts/override_tax_computation_rules.py` (Form 1040 Lines 16-24) and
`scripts/override_selfemployment_bridge_rules.py` (Schedule C/SE/1/2, Form
8889 Parts II/III, Form 1040 Lines 25-38) promote their respective rules
straight to `validated` after manual verification against
`build/evaluation/golden_cases.py` — read either script's module docstring
before re-running it, and re-run it again after re-running its bridge(s).

`export` writes the DB's current state as plain JSON files (one per
canonical field, one per calc rule, plus an aggregate of each) — a read-only
projection for anyone who wants to open a file instead of querying Postgres,
in the same spirit as `TaxMD-Schema-Automation-New`'s `output/ty2025/`
convention. `form-mapping` answers "which canonical field lives on which
form line, and where does its value flow to next" in one file per form —
open `output/ty2025/form_mappings/form_mapping_8889.json` and search for
`"line": "13"` to see the whole HSA chain (`flows_to` on each hop) in one
place.

## Phases

Each phase is independently runnable via `python -m build.cli <command>`;
see `build/cli.py --help` (module docstring lists every command with the
order they're meant to run in).
