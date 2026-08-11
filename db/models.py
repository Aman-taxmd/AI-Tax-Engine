"""SQLAlchemy ORM models mirroring db/schema.sql.

These models are dialect-agnostic (SQLite locally, Postgres in production) so
the pilot is actually runnable without a provisioned Postgres superuser in
every environment. db/schema.sql remains the authoritative Postgres DDL
(with JSONB, CHECK constraints, etc.) for production deployment; this file
is the application-facing data-access layer used by both build/ and
runtime/ code. Neither build/ nor runtime/ talk to the database any other
way — this is the single shared boundary (see docs/adr/0005-build-runtime-separation.md).
"""
from __future__ import annotations

import uuid
from datetime import datetime, timezone

from sqlalchemy import (
    CheckConstraint,
    DateTime,
    Float,
    ForeignKey,
    Integer,
    String,
    Text,
    UniqueConstraint,
)
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column
from sqlalchemy.types import JSON


def _uuid() -> str:
    return str(uuid.uuid4())


def _now() -> datetime:
    return datetime.now(timezone.utc)


class Base(DeclarativeBase):
    pass


class Document(Base):
    __tablename__ = "documents"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    source_url: Mapped[str] = mapped_column(Text, nullable=False)
    doc_type: Mapped[str] = mapped_column(String(32), nullable=False)
    form_number: Mapped[str] = mapped_column(String(32), nullable=False)
    tax_year: Mapped[int] = mapped_column(Integer, nullable=False)
    revision_date: Mapped[str | None] = mapped_column(String(32), nullable=True)
    fetched_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)
    content_hash: Mapped[str] = mapped_column(String(64), nullable=False, index=True)
    storage_path: Mapped[str] = mapped_column(Text, nullable=False)
    version: Mapped[int] = mapped_column(Integer, default=1)
    superseded_by: Mapped[str | None] = mapped_column(String(36), ForeignKey("documents.id"), nullable=True)

    __table_args__ = (
        CheckConstraint(
            "doc_type in ('instructions','publication','form','xsd','xsl','business_rules_csv')",
            name="ck_documents_doc_type",
        ),
    )


class Section(Base):
    __tablename__ = "sections"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    document_id: Mapped[str] = mapped_column(String(36), ForeignKey("documents.id"), nullable=False, index=True)
    heading: Mapped[str] = mapped_column(Text, nullable=False)
    anchor_id: Mapped[str | None] = mapped_column(String(255), nullable=True)
    irs_line_ref: Mapped[str | None] = mapped_column(String(64), nullable=True, index=True)
    parent_section_id: Mapped[str | None] = mapped_column(String(36), ForeignKey("sections.id"), nullable=True)
    order_index: Mapped[int] = mapped_column(Integer, nullable=False)
    text: Mapped[str] = mapped_column(Text, nullable=False)
    content_hash: Mapped[str] = mapped_column(String(64), nullable=False)


class CitationEdge(Base):
    __tablename__ = "citation_edges"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    from_section_id: Mapped[str] = mapped_column(String(36), ForeignKey("sections.id"), nullable=False, index=True)
    edge_type: Mapped[str] = mapped_column(String(32), nullable=False)
    raw_phrase: Mapped[str] = mapped_column(Text, nullable=False)
    to_document_hint: Mapped[str | None] = mapped_column(Text, nullable=True)
    to_section_id: Mapped[str | None] = mapped_column(String(36), ForeignKey("sections.id"), nullable=True)
    resolution_method: Mapped[str | None] = mapped_column(String(16), nullable=True)
    confidence: Mapped[float | None] = mapped_column(Float, nullable=True)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)

    __table_args__ = (
        CheckConstraint(
            "edge_type in ('exception_ref','carryover_ref','cardinality_ref')",
            name="ck_citation_edges_type",
        ),
    )


class EvidenceBundle(Base):
    __tablename__ = "evidence_bundles"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    source_type: Mapped[str] = mapped_column(String(32), nullable=False)
    document_version_id: Mapped[str | None] = mapped_column(String(36), ForeignKey("documents.id"), nullable=True)
    section_ids: Mapped[list] = mapped_column(JSON, default=list)
    exact_quotes: Mapped[list] = mapped_column(JSON, default=list)
    prompt_version: Mapped[str | None] = mapped_column(String(64), nullable=True)
    model_version: Mapped[str | None] = mapped_column(String(128), nullable=True)
    temperature: Mapped[float | None] = mapped_column(Float, nullable=True)
    extraction_timestamp: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)
    reviewer: Mapped[str | None] = mapped_column(String(128), nullable=True)
    raw_llm_response: Mapped[str | None] = mapped_column(Text, nullable=True)
    confidence_breakdown: Mapped[dict] = mapped_column(JSON, default=dict)
    content_hash: Mapped[str] = mapped_column(String(64), nullable=False, index=True)

    __table_args__ = (
        CheckConstraint(
            "source_type in ('llm_extraction','human_review','deterministic_parse')",
            name="ck_evidence_bundles_source_type",
        ),
    )


class KnowledgePacket(Base):
    __tablename__ = "knowledge_packets"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    version: Mapped[int] = mapped_column(Integer, default=1)
    evidence_bundle_id: Mapped[str] = mapped_column(String(36), ForeignKey("evidence_bundles.id"), nullable=False)
    form_number: Mapped[str] = mapped_column(String(32), nullable=False, index=True)
    irs_line: Mapped[str] = mapped_column(String(64), nullable=False, index=True)
    core_text: Mapped[str] = mapped_column(Text, nullable=False)
    exceptions: Mapped[list] = mapped_column(JSON, default=list)
    status: Mapped[str] = mapped_column(String(16), default="draft")
    confidence_breakdown: Mapped[dict] = mapped_column(JSON, default=dict)
    superseded_by: Mapped[str | None] = mapped_column(String(36), ForeignKey("knowledge_packets.id"), nullable=True)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)

    __table_args__ = (
        CheckConstraint("status in ('draft','needs_review','validated')", name="ck_knowledge_packets_status"),
    )


class Concept(Base):
    __tablename__ = "concepts"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    name: Mapped[str] = mapped_column(String(255), nullable=False, unique=True)
    definition: Mapped[str] = mapped_column(Text, nullable=False)
    effective_year: Mapped[int] = mapped_column(Integer, nullable=False)
    authoritative_source_citation: Mapped[dict] = mapped_column(JSON, default=dict)


class ConceptReference(Base):
    __tablename__ = "concept_references"

    concept_id: Mapped[str] = mapped_column(String(36), ForeignKey("concepts.id"), primary_key=True)
    knowledge_packet_id: Mapped[str] = mapped_column(
        String(36), ForeignKey("knowledge_packets.id"), primary_key=True
    )


class DependencyEdge(Base):
    __tablename__ = "dependency_edges"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    field_a: Mapped[str] = mapped_column(String(255), nullable=False, index=True)
    depends_on_type: Mapped[str] = mapped_column(String(16), nullable=False)
    depends_on_ref: Mapped[str] = mapped_column(String(255), nullable=False, index=True)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)

    __table_args__ = (
        CheckConstraint("depends_on_type in ('field','concept')", name="ck_dependency_edges_type"),
    )


class CanonicalField(Base):
    __tablename__ = "canonical_fields"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    field_name: Mapped[str] = mapped_column(String(255), nullable=False)
    section: Mapped[str] = mapped_column(Text, nullable=False)
    data_type: Mapped[str] = mapped_column(String(32), nullable=False)
    cardinality: Mapped[str] = mapped_column(String(16), default="single")
    instance_dimension: Mapped[str | None] = mapped_column(String(64), nullable=True)
    source_xsd_element: Mapped[str | None] = mapped_column(String(255), nullable=True)
    source_form_line: Mapped[str | None] = mapped_column(String(64), nullable=True)
    description: Mapped[str] = mapped_column(Text, nullable=False)
    version: Mapped[int] = mapped_column(Integer, default=1)
    # Which tax year this row applies to. The SAME field_name can legitimately
    # have one row per year (form lines are stable identifiers across years;
    # only the underlying rule/constants/mapping data changes) -- see
    # docs/adr/0009-tax-year-scoping.md. Every build-time query that loads
    # canonical fields MUST filter by tax_year once more than one year's rows
    # exist, or `.in_(field_names)` becomes ambiguous across years.
    tax_year: Mapped[int] = mapped_column(Integer, nullable=False, default=2025)
    superseded_by: Mapped[str | None] = mapped_column(String(36), ForeignKey("canonical_fields.id"), nullable=True)

    __table_args__ = (
        UniqueConstraint("field_name", "version", "tax_year", name="uq_canonical_fields_name_version"),
        CheckConstraint("cardinality in ('single','multi_instance')", name="ck_canonical_fields_cardinality"),
    )


class CostSegFieldTemplate(Base):
    """Template metadata for cost seg multi-instance fields (Phase 2).

    One row per logical field (template_id), not per taxpayer activity.
    Runtime binds to cost_seg.{tax_activity_id}.{relative_field}.
    """

    __tablename__ = "cost_seg_field_templates"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    template_id: Mapped[str] = mapped_column(String(255), nullable=False)
    instance_group: Mapped[str | None] = mapped_column(String(64), nullable=True)
    relative_field: Mapped[str] = mapped_column(String(255), nullable=False)
    source_form_number: Mapped[str | None] = mapped_column(String(32), nullable=True, index=True)
    source_form_line: Mapped[str | None] = mapped_column(String(64), nullable=True)
    section: Mapped[str] = mapped_column(Text, nullable=False)
    data_type: Mapped[str] = mapped_column(String(32), nullable=False)
    source_xsd_element: Mapped[str | None] = mapped_column(String(255), nullable=True)
    description: Mapped[str] = mapped_column(Text, nullable=False)
    projection: Mapped[bool] = mapped_column(default=False)
    calc_rule_type: Mapped[str | None] = mapped_column(String(32), nullable=True)
    calc_rule_operand_relative: Mapped[str | None] = mapped_column(String(255), nullable=True)
    tax_year: Mapped[int] = mapped_column(Integer, nullable=False, default=2025)

    __table_args__ = (
        UniqueConstraint("template_id", "tax_year", name="uq_cost_seg_field_templates_id_year"),
    )


class CalcRule(Base):
    __tablename__ = "calc_rules"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    rule_id: Mapped[str] = mapped_column(String(255), nullable=False)
    version: Mapped[int] = mapped_column(Integer, default=1)
    status: Mapped[str] = mapped_column(String(16), default="candidate", index=True)
    canonical_field_id: Mapped[str] = mapped_column(String(36), ForeignKey("canonical_fields.id"), nullable=False)
    formula: Mapped[dict] = mapped_column(JSON, nullable=False)
    operands: Mapped[list] = mapped_column(JSON, default=list)
    carryover_target: Mapped[str | None] = mapped_column(String(255), nullable=True)
    irs_reference: Mapped[dict] = mapped_column(JSON, default=dict)
    source_knowledge_packet_id: Mapped[str | None] = mapped_column(
        String(36), ForeignKey("knowledge_packets.id"), nullable=True
    )
    confidence_breakdown: Mapped[dict] = mapped_column(JSON, default=dict)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)
    # See CanonicalField.tax_year's docstring -- same rationale/invariant.
    tax_year: Mapped[int] = mapped_column(Integer, nullable=False, default=2025)

    __table_args__ = (
        UniqueConstraint("rule_id", "version", "tax_year", name="uq_calc_rules_id_version"),
        CheckConstraint(
            "status in ('candidate','validated','production','superseded')", name="ck_calc_rules_status"
        ),
    )


class RuleStatusTransition(Base):
    __tablename__ = "rule_status_transitions"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    rule_id: Mapped[str] = mapped_column(String(36), ForeignKey("calc_rules.id"), nullable=False)
    from_status: Mapped[str | None] = mapped_column(String(16), nullable=True)
    to_status: Mapped[str] = mapped_column(String(16), nullable=False)
    changed_by: Mapped[str] = mapped_column(String(128), nullable=False)
    changed_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)
    reason: Mapped[str | None] = mapped_column(Text, nullable=True)


class GoldenCase(Base):
    __tablename__ = "golden_cases"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    form_number: Mapped[str] = mapped_column(String(32), nullable=False)
    scenario: Mapped[str] = mapped_column(Text, nullable=False)
    inputs: Mapped[dict] = mapped_column(JSON, nullable=False)
    expected_outputs: Mapped[dict] = mapped_column(JSON, nullable=False)
    source: Mapped[str] = mapped_column(String(32), nullable=False)

    __table_args__ = (
        CheckConstraint("source in ('hand_authored','baseline_existing_repo')", name="ck_golden_cases_source"),
    )


class EvaluationRun(Base):
    __tablename__ = "evaluation_runs"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    run_type: Mapped[str] = mapped_column(String(32), nullable=False)
    target_type: Mapped[str] = mapped_column(String(32), nullable=False)
    target_id: Mapped[str] = mapped_column(String(255), nullable=False)
    result: Mapped[str] = mapped_column(String(8), nullable=False)
    detail: Mapped[dict] = mapped_column(JSON, default=dict)
    run_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)

    __table_args__ = (
        CheckConstraint(
            "run_type in ('grounding_check','numeric_check','baseline_diff','rigorous_consistency')",
            name="ck_evaluation_runs_type",
        ),
        CheckConstraint("result in ('pass','fail','warn')", name="ck_evaluation_runs_result"),
    )


class HumanReviewItem(Base):
    __tablename__ = "human_review_items"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    related_type: Mapped[str] = mapped_column(String(64), nullable=False)
    related_id: Mapped[str] = mapped_column(String(255), nullable=False)
    reason: Mapped[str] = mapped_column(Text, nullable=False)
    status: Mapped[str] = mapped_column(String(16), default="pending", index=True)
    resolution_notes: Mapped[str | None] = mapped_column(Text, nullable=True)
    resolved_at: Mapped[datetime | None] = mapped_column(DateTime(timezone=True), nullable=True)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)
    # Everything a reviewer needs to render this item without further joins or
    # LangGraph-checkpoint access: source_url/section_anchor/exact quote, plus
    # either the draft packet (extraction_thread items) or formula/operands +
    # judge issues (calc_rule grounding-check items). See docs/adr/0007 and
    # ui/pages/3_Human_Review_Queue.py.
    detail: Mapped[dict] = mapped_column(JSON, default=dict)

    __table_args__ = (
        CheckConstraint("status in ('pending','resolved')", name="ck_human_review_items_status"),
    )


class IntakeQuestion(Base):
    """The taxpayer-facing Question Registry (build-time artifact).

    Two flavors, distinguished by which of `maps_to_canonical_field` /
    `maps_to_condition` is set:
      * form-line questions — auto-derived from a canonical field that has no
        calc rule (a pure input line, e.g. "HSA contribution amount");
      * profile questions — hand-authored, not tied to any single form line
        (e.g. age), instead feeding a *condition* inside some calc rule's
        formula (see runtime/condition_rules.py). Never both at once.
    """

    __tablename__ = "intake_questions"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    form_number: Mapped[str] = mapped_column(String(32), nullable=False, index=True)
    question_key: Mapped[str] = mapped_column(String(128), nullable=False)
    prompt_text: Mapped[str] = mapped_column(Text, nullable=False)
    input_type: Mapped[str] = mapped_column(String(32), nullable=False)
    choices: Mapped[list | None] = mapped_column(JSON, nullable=True)
    maps_to_canonical_field: Mapped[str | None] = mapped_column(String(255), nullable=True)
    maps_to_condition: Mapped[dict | None] = mapped_column(JSON, nullable=True)
    justification: Mapped[str] = mapped_column(Text, nullable=False)
    irs_reference: Mapped[dict] = mapped_column(JSON, default=dict)
    order_index: Mapped[int] = mapped_column(Integer, default=0)
    required: Mapped[bool] = mapped_column(default=True)
    # See CanonicalField.tax_year's docstring -- same rationale/invariant.
    # question_key is no longer globally unique on its own since the same
    # question can recur, unchanged, across years.
    tax_year: Mapped[int] = mapped_column(Integer, nullable=False, default=2025)

    __table_args__ = (
        CheckConstraint(
            "input_type in ('currency','integer','boolean','choice','date','currency_multi_instance','activities')",
            name="ck_intake_questions_input_type",
        ),
        UniqueConstraint("question_key", "tax_year", name="uq_intake_questions_key_year"),
    )


class RuntimeReviewFinding(Base):
    """An on-demand LLM "CPA review" run (see docs/adr/0007). Advisory only —
    never influences a computed value, only annotates it after the fact.
    Taxpayer answers/computed values themselves are NOT persisted anywhere
    (ephemeral, browser-session-only per the current design) — only the
    review outcome is logged here, for audit/quality-improvement purposes."""

    __tablename__ = "runtime_review_findings"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    triggered_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)
    form_chain: Mapped[str] = mapped_column(String(255), nullable=False)
    computed_snapshot: Mapped[dict] = mapped_column(JSON, default=dict)
    findings: Mapped[list] = mapped_column(JSON, default=list)
    model_version: Mapped[str | None] = mapped_column(String(128), nullable=True)
    prompt_version: Mapped[str | None] = mapped_column(String(64), nullable=True)


class PdfFieldMapping(Base):
    """Maps a canonical field to the real AcroForm field code on the actual
    IRS PDF (e.g. `adjustments.hsa_contribution_amount`, Form 8889 line 2,
    -> `topmostSubform[0].Page1[0].f1_2[0]`)
    — see build/synthesis/pdf_field_mapper.py and docs/adr/0008. IRS
    fillable PDFs use auto-generated field codes with no embedded
    description text, so there's no mechanical way to derive this mapping;
    an LLM call (`llm_client.map_pdf_fields`) proposes it, scoped to only
    the pilot's in-scope fields (runtime/chain.py's ancestor_closure), with
    low-confidence proposals routed to the existing Human Review Queue
    instead of trusted silently.

    `checkbox_match_value` supports a small but real exception to "one
    canonical field -> one PDF widget": mutually-exclusive checkbox choices
    printed as SEPARATE AcroForm widgets for what is really ONE canonical
    field's value (e.g. Form 8889 Line 1's "Self-only [ ] / Family [ ]" is a
    single `deductions.hdhp_coverage_type` (Form 8889 line 1) field whose
    string value selects which of TWO
    physical checkbox widgets gets checked; Form 1040's 5 filing-status
    boxes are the same pattern for one `form_1040_filing_status` field). For
    those fields there are MULTIPLE PdfFieldMapping rows sharing the same
    `canonical_field_id`, each carrying the field value that should check
    THAT widget (e.g. "self_only" / "family"); ui/pdf_render.py checks a
    widget when the computed value equals its `checkbox_match_value`, and
    unchecks it otherwise. For an ordinary single-widget mapping this is
    just "" (not NULL, so the unique constraint below still enforces
    at-most-one-row for the common case)."""

    __tablename__ = "pdf_field_mappings"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    canonical_field_id: Mapped[str] = mapped_column(String(36), ForeignKey("canonical_fields.id"), nullable=False)
    form_number: Mapped[str] = mapped_column(String(32), nullable=False, index=True)
    pdf_field_code: Mapped[str] = mapped_column(Text, nullable=False)
    page_number: Mapped[int] = mapped_column(Integer, default=0)
    confidence: Mapped[float] = mapped_column(Float, default=0.0)
    reasoning: Mapped[str | None] = mapped_column(Text, nullable=True)
    model_version: Mapped[str | None] = mapped_column(String(128), nullable=True)
    prompt_version: Mapped[str | None] = mapped_column(String(64), nullable=True)
    checkbox_match_value: Mapped[str] = mapped_column(String(64), nullable=False, default="")
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)
    # Denormalized copy of the mapped CanonicalField's tax_year, kept purely
    # for cheap indexed filtering without a join (matches TaxCore's pattern
    # for its own per-year rule/mapping tables) -- the FK to canonical_fields
    # already makes this row year-correct transitively, this just avoids
    # every read site having to join back to canonical_fields to filter.
    tax_year: Mapped[int] = mapped_column(Integer, nullable=False, default=2025, index=True)
    form_revision: Mapped[str | None] = mapped_column(String(64), nullable=True)
    pdf_content_hash: Mapped[str | None] = mapped_column(String(64), nullable=True, index=True)

    __table_args__ = (
        UniqueConstraint(
            "canonical_field_id", "form_number", "checkbox_match_value",
            name="uq_pdf_field_mappings_field_form_value",
        ),
    )


class TaxDataset(Base):
    """Immutable header row for one build-time extraction of a year's IRS Tax
    Table or Tax Computation Worksheet from the stored i1040gi HTML (see
    build/ingestion/tax_table_extractor.py) — the "dataset header + rows"
    pattern the plan for Form 1040 Lines 16-24 settled on, so this data lives
    in Postgres (queryable, versioned, atomically swappable) rather than a
    JSON file.

    Never UPDATEd in place except to flip `is_active` (ADR "nothing is ever
    UPDATEd in a way that destroys history" — a superseded dataset's rows stay
    in the DB, just no longer active). At most one row is `is_active=True`
    per (tax_year, dataset_type) at any time; activating a new one and
    deactivating the old one happens in a single transaction (see the
    extractor's `_activate_dataset`), so a reader never observes zero or two
    active datasets for the same (tax_year, dataset_type)."""

    __tablename__ = "tax_datasets"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    tax_year: Mapped[int] = mapped_column(Integer, nullable=False, index=True)
    dataset_type: Mapped[str] = mapped_column(String(32), nullable=False)
    source_document_id: Mapped[str] = mapped_column(String(36), ForeignKey("documents.id"), nullable=False)
    source_content_hash: Mapped[str] = mapped_column(String(64), nullable=False)
    parser_version: Mapped[str] = mapped_column(String(32), nullable=False)
    row_count: Mapped[int] = mapped_column(Integer, nullable=False)
    is_active: Mapped[bool] = mapped_column(default=False)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)
    notes: Mapped[str | None] = mapped_column(Text, nullable=True)

    __table_args__ = (
        CheckConstraint(
            "dataset_type in ('tax_table','tax_computation_brackets')", name="ck_tax_datasets_type"
        ),
    )


class TaxTableRow(Base):
    """One (income bracket, filing status) row of the IRS Tax Table (used for
    taxable income < $100,000) — see runtime/tax_lookup.py's lookup query.
    `[at_least, less_than)` is a half-open interval, matching the Tax Table's
    own "At least / But less than" column headers."""

    __tablename__ = "tax_table_rows"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    dataset_id: Mapped[str] = mapped_column(String(36), ForeignKey("tax_datasets.id"), nullable=False, index=True)
    filing_status: Mapped[str] = mapped_column(String(32), nullable=False)
    at_least: Mapped[float] = mapped_column(Float, nullable=False)
    less_than: Mapped[float] = mapped_column(Float, nullable=False)
    tax_amount: Mapped[float] = mapped_column(Float, nullable=False)


class TaxComputationBracket(Base):
    """One marginal-rate bracket of the IRS Tax Computation Worksheet (used
    for taxable income >= $100,000) — Line 16 = income * rate -
    subtract_amount for whichever bracket the income falls in. `bracket_order`
    is 0-indexed within (dataset, filing_status), lowest income first;
    `income_less_than=NULL` marks the top (unbounded, "Over $X") bracket."""

    __tablename__ = "tax_computation_brackets"

    id: Mapped[str] = mapped_column(String(36), primary_key=True, default=_uuid)
    dataset_id: Mapped[str] = mapped_column(String(36), ForeignKey("tax_datasets.id"), nullable=False, index=True)
    filing_status: Mapped[str] = mapped_column(String(32), nullable=False)
    bracket_order: Mapped[int] = mapped_column(Integer, nullable=False)
    income_at_least: Mapped[float] = mapped_column(Float, nullable=False)
    income_less_than: Mapped[float | None] = mapped_column(Float, nullable=True)
    rate: Mapped[float] = mapped_column(Float, nullable=False)
    subtract_amount: Mapped[float] = mapped_column(Float, nullable=False)


class TaxConstants(Base):
    """Flat-dollar/rate IRS constants for a given tax year (one row per year)
    -- the database-backed replacement for the `_2025`-suffixed Python dict
    constants previously hardcoded in runtime/tax_constants.py and
    runtime/condition_rules.py. Pattern verified against TaxMD-TaxCore's own
    `TaxConstants` model (same one-row-per-year shape, `tax_year` as the
    natural key, a single JSON blob of values) -- see
    docs/adr/0009-tax-year-scoping.md. Unlike TaxCore's copy of these
    figures (found to be stale -- pre-OBBBA standard deduction amounts still
    citing Rev. Proc. 2024-61), this table is always seeded from our own
    citation-verified values (see scripts/seed_tax_constants.py).

    `constants` is a nested dict keyed by stable, year-agnostic names (e.g.
    "standard_deduction", "hsa_contribution_limits", "self_employment") --
    the year never appears inside a calc rule or condition function, only in
    which year's TaxConstants row gets loaded. All monetary amounts are
    plain float DOLLARS (never cents) for consistency with every other
    dollar amount already in this codebase.

    Read via runtime/tax_constants_lookup.py's `get_tax_constant()`, which
    mirrors the DB-backed lookup pattern already proven for the Tax Table
    (runtime/tax_lookup.py) -- never read directly by a calc_rule formula
    (build/runtime separation, docs/adr/0005)."""

    __tablename__ = "tax_constants"

    tax_year: Mapped[int] = mapped_column(Integer, primary_key=True)
    constants: Mapped[dict] = mapped_column(JSON, nullable=False)
    effective_date: Mapped[str] = mapped_column(String(32), nullable=False)
    irs_source_citation: Mapped[str] = mapped_column(Text, nullable=False)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), default=_now)
