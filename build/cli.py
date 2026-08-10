"""CLI entrypoint. Each phase is runnable independently:

    python -m build.cli init-db
    python -m build.cli discover --form 8889
    python -m build.cli parse --form 8889
    python -m build.cli detect-patterns --form 8889
    python -m build.cli extract --form 8889
    python -m build.cli consolidate --form 8889
    python -m build.cli synthesize --form 8889
    python -m build.cli evaluate --form 8889
    python -m build.cli export --form 8889           # writes output/ty2025/8889/*.json
    python -m build.cli form-mapping --form 8889      # writes output/ty2025/form_mappings/*.json
    python -m build.cli generate-questions --form 8889  # writes output/ty2025/8889/questions.json
    python -m build.cli map-pdf-fields --form 8889   # LLM-proposed canonical-field -> PDF field code mapping
    python -m build.cli run-pilot --form 8889        # runs all phases above in order

Cross-form-only commands (run once ALL relevant forms have been through the
phases above — see build/consolidation/cross_form_bridge.py):

    python -m build.cli bridge-forms
"""
from __future__ import annotations

import typer

app = typer.Typer(help="AI Tax Engine build pipeline")


@app.command("init-db")
def init_db_cmd():
    """Phase 0: create all tables (idempotent)."""
    from db.session import get_database_url, init_db

    init_db()
    typer.echo(f"Database initialized at {get_database_url()}")


@app.command("discover")
def discover_cmd(form: str = typer.Option(..., "--form")):
    """Phase 1: discover + download + version source documents for a form."""
    from build.ingestion.discovery import run_discovery

    run_discovery(form)


@app.command("parse")
def parse_cmd(form: str = typer.Option(..., "--form")):
    """Phase 2: structural parsing into Section records."""
    from build.ingestion.structural_parser import run_structural_parse

    run_structural_parse(form)


@app.command("detect-patterns")
def detect_patterns_cmd(form: str = typer.Option(..., "--form")):
    """Phase 3: citation / carryover / cardinality pattern detection."""
    from build.ingestion.pattern_detector import run_pattern_detection

    run_pattern_detection(form)


@app.command("extract")
def extract_cmd(form: str = typer.Option(..., "--form")):
    """Phase 4-5: LangGraph knowledge extraction + consistency + review."""
    from build.graph.build_graph import run_extraction

    run_extraction(form)


@app.command("review-queue")
def review_queue_cmd():
    """Phase 5: list pending human review items (paused graph threads)."""
    from build.graph.build_graph import list_pending_reviews

    items = list_pending_reviews()
    if not items:
        typer.echo("No pending review items.")
    for item in items:
        typer.echo(f"[{item.id[:8]}] thread={item.related_id}  reason={item.reason}")


@app.command("resolve-review")
def resolve_review_cmd(
    thread_id: str = typer.Option(..., "--thread-id"),
    action: str = typer.Option("accept", "--action", help="accept | correct | retry_with_feedback"),
    reviewer: str = typer.Option(..., "--reviewer"),
    core_text: str = typer.Option(None, "--core-text", help="required when --action correct"),
    feedback: str = typer.Option(None, "--feedback", help="required when --action retry_with_feedback"),
):
    """Phase 5: resume a paused extraction thread with a human decision."""
    from build.graph.build_graph import resolve_review

    resolution = {"action": action, "reviewer": reviewer}
    if action == "correct":
        resolution["core_text"] = core_text
        resolution["exceptions"] = []
    elif action == "retry_with_feedback":
        resolution["feedback"] = feedback
    resolve_review(thread_id, resolution)


@app.command("resolve-calc-rule-review")
def resolve_calc_rule_review_cmd(
    item_id: str = typer.Option(..., "--item-id"),
    action: str = typer.Option(..., "--action", help="accept | manual_correct"),
    reviewer: str = typer.Option(..., "--reviewer"),
):
    """Phase 8: resolve a calc_rule grounding-check review item (no LLM
    retry — see build/evaluation/grounding_check.py's resolve_calc_rule_review
    docstring; use the UI for manual_correct's formula payload)."""
    from build.evaluation.grounding_check import resolve_calc_rule_review

    resolve_calc_rule_review(item_id, action, reviewer)


@app.command("resolve-pdf-field-mapping-review")
def resolve_pdf_field_mapping_review_cmd(
    item_id: str = typer.Option(..., "--item-id"),
    action: str = typer.Option(..., "--action", help="accept | manual_map"),
    reviewer: str = typer.Option(..., "--reviewer"),
    pdf_field_code: str = typer.Option(None, "--pdf-field-code", help="required when --action manual_map"),
):
    """Resolve a pdf_field_mapping review item (low-confidence or unmapped
    field -> real PDF field code proposal)."""
    from build.synthesis.pdf_field_mapper import resolve_pdf_field_mapping_review

    resolve_pdf_field_mapping_review(item_id, action, reviewer, pdf_field_code=pdf_field_code)


@app.command("consolidate")
def consolidate_cmd(form: str = typer.Option(..., "--form")):
    """Phase 6: concept normalization + dependency graph."""
    from build.consolidation.concepts import run_concept_consolidation
    from build.consolidation.dependency_graph import run_dependency_graph_build

    run_concept_consolidation(form)
    run_dependency_graph_build(form)


@app.command("bridge-forms")
def bridge_forms_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Phase 6 (extension): hand-specified cross-form bridges (8889 -> Schedule 1 -> 1040).

    See build/consolidation/cross_form_bridge.py's module docstring for why
    this can't be fully automatic yet."""
    from build.consolidation.cross_form_bridge import run_cross_form_bridge

    run_cross_form_bridge(tax_year)


@app.command("synthesize")
def synthesize_cmd(
    form: str = typer.Option(..., "--form"),
    tax_year: int = typer.Option(2025, "--tax-year"),
):
    """Phase 7: canonical field + calc rule synthesis."""
    from build.synthesis.canonical_field_writer import run_canonical_field_synthesis
    from build.synthesis.calc_rule_writer import run_calc_rule_synthesis

    run_canonical_field_synthesis(form, tax_year)
    run_calc_rule_synthesis(form, tax_year)


@app.command("hsa-worksheet-bridge")
def hsa_worksheet_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Phase 6 (extension): hand-specified Form 8889 internal worksheet chain
    (lines 4-12 -- see build/consolidation/hsa_worksheet_bridge.py's module
    docstring for why these lines have no IRS-instructions-derived
    KnowledgePacket for the general LLM calc-rule agent to work from).

    Must be run AFTER `synthesize --form 8889` (same operational caveat as
    bridge-forms) -- re-running `synthesize --form 8889` later will delete
    these rules and NOT recreate them, so re-run this afterward if that
    happens."""
    from build.consolidation.hsa_worksheet_bridge import run_hsa_worksheet_bridge

    run_hsa_worksheet_bridge(tax_year)


@app.command("w2-bridge")
def w2_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-specified W-2 multi-instance intake bridge (Box 1/2/3/5/12-W
    canonical fields + form_1040_line_1a / form_1040_line_25a /
    adjustments.hsa_employer_contribution_amount's (Form 8889 line 9) calc
    rules) -- see build/consolidation/w2_bridge.py's module docstring.

    Must be run AFTER `synthesize --form 1040` and `synthesize --form
    8889`."""
    from build.consolidation.w2_bridge import run_w2_bridge

    run_w2_bridge(tax_year)


@app.command("w2-pdf-bridge")
def w2_pdf_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-verified PDF field mappings for the real fw2.pdf Copy B page --
    see build/consolidation/w2_pdf_bridge.py's module docstring.

    Must be run AFTER `discover --form w2` and `w2-bridge`."""
    from build.consolidation.w2_pdf_bridge import run_w2_pdf_bridge

    run_w2_pdf_bridge(tax_year)


@app.command("form1040-income-bridge")
def form1040_income_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-specified Form 1040 Income/AGI/Deductions worksheet chain
    (lines 1z, 9, 11a, 14, 15) -- see
    build/consolidation/form1040_income_bridge.py's module docstring.

    Must be run AFTER `synthesize --form 1040`, `w2-bridge`, and
    `schedule-1a-bridge` (line 14 depends on line 13b, which
    schedule-1a-bridge creates) -- re-running `synthesize --form 1040`
    later will delete these rules and NOT recreate them, so re-run this
    afterward if that happens."""
    from build.consolidation.form1040_income_bridge import run_form1040_income_bridge

    run_form1040_income_bridge(tax_year)


@app.command("schedule-1a-bridge")
def schedule_1a_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-specified Schedule 1-A calc rules (Part I MAGI, Part II Tips,
    Part V Seniors, Part VI Total) -- see
    build/consolidation/schedule_1a_bridge.py's module docstring.

    Must be run AFTER `synthesize --form 1040s1a` (creates Schedule 1-A's
    own canonical fields from its real XSD) and `synthesize --form 1040`
    (creates form_1040_line_11a/13b) -- re-running `synthesize --form
    1040s1a` later will delete these rules and NOT recreate them, so
    re-run this afterward if that happens."""
    from build.consolidation.schedule_1a_bridge import run_schedule_1a_bridge

    run_schedule_1a_bridge(tax_year)


@app.command("checkbox-field-bridge")
def checkbox_field_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-specified checkbox-choice PDF field mappings (Form 8889 Line 1's
    self-only/family boxes, Form 1040's 5 filing-status boxes) -- see
    build/consolidation/checkbox_field_bridge.py's module docstring.

    Must be run AFTER `map-pdf-fields --form 8889` (same operational caveat
    as hsa-worksheet-bridge) -- re-running `map-pdf-fields --form 8889`
    later will delete its 2 rows for deductions.hdhp_coverage_type (Form
    8889 line 1) (it does NOT touch form_1040_filing_status, which isn't in
    scope for `--form 1040`'s mapper), so re-run this afterward if that
    happens."""
    from build.consolidation.checkbox_field_bridge import run_checkbox_field_bridge

    run_checkbox_field_bridge(tax_year)


@app.command("schedule-c-bridge")
def schedule_c_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-specified Schedule C Part I/II calc rules (income lines 1-7,
    expense lines 8-27b, totals 28/29/31) -- see
    build/consolidation/schedule_c_bridge.py's module docstring.

    Must be run AFTER `synthesize --form 1040sc` -- re-running that
    synthesize later will delete these rules and NOT recreate them, so
    re-run this afterward if that happens."""
    from build.consolidation.schedule_c_bridge import run_schedule_c_bridge

    run_schedule_c_bridge(tax_year)


@app.command("schedule-se-bridge")
def schedule_se_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-specified Schedule SE Part I calc rules (regular method, single
    nonfarm business, lines 2-13) -- see
    build/consolidation/schedule_se_bridge.py's module docstring.

    Must be run AFTER `synthesize --form 1040sse`, `schedule-c-bridge`
    (line 2 depends on Schedule C's line 31), and `w2-bridge` (line 8a
    depends on the W-2 Box 3 intake field) -- re-running `synthesize
    --form 1040sse` later will delete these rules and NOT recreate them,
    so re-run this afterward if that happens."""
    from build.consolidation.schedule_se_bridge import run_schedule_se_bridge

    run_schedule_se_bridge(tax_year)


@app.command("schedule1-income-bridge")
def schedule1_income_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-specified Schedule 1 Part I calc rules connecting Schedule C's
    net profit into Form 1040 line 8 (Business income -> line 3 -> line 9
    -> line 10 -> Form 1040 line 8) -- see
    build/consolidation/schedule1_income_bridge.py's module docstring.

    Must be run AFTER `synthesize --form 1040s1`, `synthesize --form
    1040`, and `schedule-c-bridge` -- re-running `synthesize --form
    1040s1` or `synthesize --form 1040` later will delete the rules this
    module owns for that form and NOT recreate them, so re-run this
    afterward if that happens."""
    from build.consolidation.schedule1_income_bridge import run_schedule1_income_bridge

    run_schedule1_income_bridge(tax_year)


@app.command("schedule-2-bridge")
def schedule_2_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-specified Schedule 2 Part II calc rules (self-employment tax on
    line 4, Form 8889 Part II/III HSA-distribution additional taxes on
    lines 17c/17d, total other taxes on line 21) plus the Form 1040 line
    23 hand-off from tax-computation-bridge -- see
    build/consolidation/schedule_2_bridge.py's module docstring.

    Must be run AFTER `synthesize --form 1040s2`, `synthesize --form
    8889`, `schedule-se-bridge`, and `tax-computation-bridge` (this
    module takes over form_1040_line_23's rule from it) -- re-running
    `synthesize --form 1040s2`/`synthesize --form 8889` later will delete
    the rules this module owns for that form and NOT recreate them, so
    re-run this afterward if that happens."""
    from build.consolidation.schedule_2_bridge import run_schedule_2_bridge

    run_schedule_2_bridge(tax_year)


@app.command("form1040-refund-bridge")
def form1040_refund_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-specified Form 1040 Payments/Refund/Amount-You-Owe calc rules
    (lines 25d, 27a-38) -- see
    build/consolidation/form1040_refund_bridge.py's module docstring.

    Must be run AFTER `synthesize --form 1040`, `w2-bridge`, and
    `tax-computation-bridge` -- re-running `synthesize --form 1040` later
    will delete these rules and NOT recreate them, so re-run this
    afterward if that happens."""
    from build.consolidation.form1040_refund_bridge import run_form1040_refund_bridge

    run_form1040_refund_bridge(tax_year)


@app.command("seed-golden-cases")
def seed_golden_cases_cmd():
    """Populates db/models.py's GoldenCase table with hand-authored
    end-to-end scenarios -- see build/evaluation/golden_cases.py."""
    from build.evaluation.golden_cases import seed_golden_cases

    seed_golden_cases()


@app.command("run-golden-cases")
def run_golden_cases_cmd():
    """CI-ready: runs every seeded GoldenCase through runtime.engine.compute()
    and asserts the expected outputs -- see build/evaluation/golden_cases.py.
    Exits non-zero if any case fails."""
    from build.evaluation.golden_cases import run_golden_cases

    ok = run_golden_cases()
    raise typer.Exit(code=0 if ok else 1)


@app.command("tax-computation-bridge")
def tax_computation_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-authored calc rules for Form 1040 Lines 16-24 (Tax and Credits
    section) -- see build/consolidation/tax_computation_bridge.py's module
    docstring. Requires `extract-tax-table` to have been run first (Line 16
    depends on the Tax Table / Tax Computation Worksheet dataset it loads)."""
    from build.consolidation.tax_computation_bridge import run_tax_computation_bridge

    run_tax_computation_bridge(tax_year)


@app.command("extract-tax-table")
def extract_tax_table_cmd(
    tax_year: int = typer.Option(2025, "--tax-year"),
    check: bool = typer.Option(False, "--check", help="Dry-run: validate only, don't write to the database (CI-ready exit code)."),
):
    """Deterministic build-time extraction of the IRS Tax Table + Tax
    Computation Worksheet (Form 1040 Line 16) from the stored i1040gi HTML
    into Postgres -- see build/ingestion/tax_table_extractor.py."""
    if check:
        from build.ingestion.tax_table_extractor import check_tax_table_extraction

        ok = check_tax_table_extraction(tax_year)
        raise typer.Exit(code=0 if ok else 1)

    from build.ingestion.tax_table_extractor import run_tax_table_extraction

    run_tax_table_extraction(tax_year)


@app.command("tax-computation-pdf-bridge")
def tax_computation_pdf_bridge_cmd(tax_year: int = typer.Option(2025, "--tax-year")):
    """Hand-verified PDF field mappings for Form 1040 Line 11b (AGI
    redisplay) and Lines 16-24 (tax computation) -- see
    build/consolidation/tax_computation_pdf_bridge.py's module docstring."""
    from build.consolidation.tax_computation_pdf_bridge import run_tax_computation_pdf_bridge

    run_tax_computation_pdf_bridge(tax_year)


@app.command("evaluate")
def evaluate_cmd(
    form: str = typer.Option(..., "--form", help="form number, or 'all' for every candidate rule"),
    tax_year: int = typer.Option(2025, "--tax-year"),
):
    """Phase 8: LLM-as-judge grounding check (numeric/baseline checks are future work)."""
    from build.evaluation.run_all import run_all_evaluations

    run_all_evaluations(form, tax_year)


@app.command("export")
def export_cmd(
    form: str = typer.Option(..., "--form"),
    tax_year: int = typer.Option(2025, "--tax-year"),
):
    """Write this form's canonical fields + calc rules to output/ty{year}/{form}/*.json
    (individual file per field/rule, plus an aggregate file of each) — a
    read-only projection of the DB for reviewers who want plain JSON files."""
    from build.export.json_export import run_export

    run_export(form, tax_year)


@app.command("form-mapping")
def form_mapping_cmd(
    form: str = typer.Option(..., "--form"),
    tax_year: int = typer.Option(2025, "--tax-year"),
):
    """Write output/ty{year}/form_mappings/form_mapping_{form}.json: which
    canonical field lives on which form line, and where its value flows to
    next (Schedule 1 -> Form 1040, etc.)."""
    from build.export.form_mapping import run_form_mapping_export

    run_form_mapping_export(form, tax_year)


@app.command("export-taxcore")
def export_taxcore_cmd(
    form: str = typer.Option(..., "--form"),
    tax_year: int = typer.Option(2025, "--tax-year"),
):
    """Write TaxCore-shaped import package under output/ty{year}/taxcore/{form}/
    (rules, form_mapping, calculation/canonical schema patches, metadata patch,
    module wiring, target_tree, import_notes, MANIFEST) driven by
    build/export/taxcore_targets/. See docs/adr/0010-taxcore-field-naming.md."""
    from build.export.taxcore_export import run_taxcore_export

    run_taxcore_export(form, tax_year)


@app.command("export-taxcore-bundle")
def export_taxcore_bundle_cmd(
    tax_year: int = typer.Option(2025, "--tax-year"),
    taxcore_root: str | None = typer.Option(
        None,
        "--taxcore-root",
        help="TaxMD-TaxCore repo path for baseline merge (default: ../TaxMD-TaxCore if present)",
    ),
    skip_per_form_export: bool = typer.Option(
        False,
        "--skip-per-form-export",
        help="Only aggregate existing output/ty{year}/taxcore/{form}/ dirs",
    ),
):
    """Export all TaxCore FormSpecs + write integration bundle under
    output/ty{year}/taxcore_bundle/ (Schema-Automation-compatible layout).

    Does not change our DB, engine, UI, or goldens — export projection only.
    Produces deploy_to_taxcore.sh + merged schemas for one-shot TaxCore import."""
    from pathlib import Path

    from build.export.taxcore_bundle import run_taxcore_bundle

    root = Path(taxcore_root).resolve() if taxcore_root else None
    run_taxcore_bundle(
        tax_year,
        taxcore_root=root,
        skip_per_form_export=skip_per_form_export,
    )


@app.command("generate-questions")
def generate_questions_cmd(
    form: str = typer.Option(..., "--form"),
    tax_year: int = typer.Option(2025, "--tax-year"),
):
    """Question Registry: auto-derive form-line questions (input fields with
    no calc rule), merge in hand-authored profile questions, and write
    output/ty{year}/{form}/questions.json."""
    from build.export.json_export import run_question_export
    from build.synthesis.question_registry import run_question_registry_synthesis

    run_question_registry_synthesis(form, tax_year)
    run_question_export(form, tax_year)


@app.command("map-pdf-fields")
def map_pdf_fields_cmd(
    form: str = typer.Option(..., "--form"),
    tax_year: int = typer.Option(2025, "--tax-year"),
):
    """Map this form's in-scope (ancestor-closure) canonical fields to the
    real IRS PDF's AcroForm field codes, via a scoped LLM call. Requires
    the form's PDF to be catalogued (doc_type='form') — see
    build/sources/catalog/form_{form}.yaml's include_doc_types."""
    from build.synthesis.pdf_field_mapper import run_pdf_field_mapping

    run_pdf_field_mapping(form, tax_year)


@app.command("run-pilot")
def run_pilot_cmd(
    form: str = typer.Option("8889", "--form"),
    tax_year: int = typer.Option(2025, "--tax-year"),
):
    """Run every phase in order for the pilot form."""
    init_db_cmd()
    discover_cmd(form)
    parse_cmd(form)
    detect_patterns_cmd(form)
    extract_cmd(form)
    consolidate_cmd(form)
    synthesize_cmd(form, tax_year)
    evaluate_cmd(form, tax_year)
    export_cmd(form, tax_year)
    form_mapping_cmd(form, tax_year)
    generate_questions_cmd(form, tax_year)
    map_pdf_fields_cmd(form, tax_year)
    typer.echo("Pilot pipeline complete.")


if __name__ == "__main__":
    app()
