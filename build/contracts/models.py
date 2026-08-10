"""Pydantic contracts used to validate pipeline artifacts before they are
persisted via db/models.py. Keeping these separate from the ORM models means
pipeline code validates shape/business rules here, while the ORM layer only
deals with storage. See docs/adr/0002-immutability.md.
"""
from __future__ import annotations

from datetime import datetime
from typing import Literal

from pydantic import BaseModel, Field

DocType = Literal["instructions", "publication", "form", "xsd", "xsl", "business_rules_csv"]
EdgeType = Literal["exception_ref", "carryover_ref", "cardinality_ref"]
ResolutionMethod = Literal["regex", "llm", "human", "unresolved"]
EvidenceSourceType = Literal["llm_extraction", "human_review", "deterministic_parse"]
PacketStatus = Literal["draft", "needs_review", "validated"]
RuleStatus = Literal["candidate", "validated", "production", "superseded"]
Cardinality = Literal["single", "multi_instance"]


class DocumentRecord(BaseModel):
    id: str
    source_url: str
    doc_type: DocType
    form_number: str
    tax_year: int
    revision_date: str | None = None
    fetched_at: datetime
    content_hash: str
    storage_path: str
    version: int = 1
    superseded_by: str | None = None


class SectionRecord(BaseModel):
    id: str
    document_id: str
    heading: str
    anchor_id: str | None = None
    irs_line_ref: str | None = None
    parent_section_id: str | None = None
    order_index: int
    text: str
    content_hash: str


class CitationEdgeRecord(BaseModel):
    id: str
    from_section_id: str
    edge_type: EdgeType
    raw_phrase: str
    to_document_hint: str | None = None
    to_section_id: str | None = None
    resolution_method: ResolutionMethod = "unresolved"
    confidence: float | None = None


class ConfidenceBreakdown(BaseModel):
    extraction_confidence: float = 0.0
    reference_resolution_confidence: float = 0.0
    formula_confidence: float = 0.0
    grounding_score: float | None = None
    numeric_validation_score: float | None = None

    def overall(self) -> float:
        scored = [
            v
            for v in [
                self.extraction_confidence,
                self.reference_resolution_confidence,
                self.formula_confidence,
                self.grounding_score,
                self.numeric_validation_score,
            ]
            if v is not None
        ]
        return sum(scored) / len(scored) if scored else 0.0


class EvidenceBundleRecord(BaseModel):
    id: str
    source_type: EvidenceSourceType
    document_version_id: str | None = None
    section_ids: list[str] = Field(default_factory=list)
    exact_quotes: list[str] = Field(default_factory=list)
    prompt_version: str | None = None
    model_version: str | None = None
    temperature: float | None = None
    extraction_timestamp: datetime
    reviewer: str | None = None
    raw_llm_response: str | None = None
    confidence_breakdown: ConfidenceBreakdown = Field(default_factory=ConfidenceBreakdown)
    content_hash: str


class ExceptionNote(BaseModel):
    text: str
    citation: str | None = None


class KnowledgePacketRecord(BaseModel):
    id: str
    version: int = 1
    evidence_bundle_id: str
    form_number: str
    irs_line: str
    core_text: str
    exceptions: list[ExceptionNote] = Field(default_factory=list)
    status: PacketStatus = "draft"
    confidence_breakdown: ConfidenceBreakdown = Field(default_factory=ConfidenceBreakdown)
    superseded_by: str | None = None


class ConceptRecord(BaseModel):
    id: str
    name: str
    definition: str
    effective_year: int
    authoritative_source_citation: dict = Field(default_factory=dict)


class DependencyEdgeRecord(BaseModel):
    id: str
    field_a: str
    depends_on_type: Literal["field", "concept"]
    depends_on_ref: str


class CanonicalFieldRecord(BaseModel):
    id: str
    field_name: str
    section: str
    data_type: str
    cardinality: Cardinality = "single"
    instance_dimension: str | None = None
    source_xsd_element: str | None = None
    source_form_line: str | None = None
    description: str
    version: int = 1


class ConditionClause(BaseModel):
    """A single comparison in a conditional formula, with explainability text
    attached directly to each branch (see docs/adr — explainability principle
    from the design discussion: reasons must be pre-authored, not generated
    ad hoc at runtime)."""

    field: str
    operator: Literal["==", "!=", ">=", "<=", ">", "<", "in", "not_in"]
    value: object
    reason_if_true: str
    reason_if_false: str


class OperandRecord(BaseModel):
    name: str
    source: str
    description: str


class FormulaRecord(BaseModel):
    type: Literal[
        "sum", "subtract", "multiply", "divide", "conditional", "lookup_table",
        "tax_constant", "min", "max", "round", "absolute", "constant",
    ]
    conditions: list[ConditionClause] = Field(default_factory=list)
    combine: Literal["and", "or"] | None = None
    true_value: object | None = None
    false_value: object | None = None
    operand_names: list[str] = Field(default_factory=list)
    table_name: str | None = None
    constant: object | None = None


class IrsReference(BaseModel):
    document_id: str
    section_anchor: str | None = None
    quote: str


class CalcRuleRecord(BaseModel):
    id: str
    rule_id: str
    version: int = 1
    status: RuleStatus = "candidate"
    canonical_field_id: str
    formula: FormulaRecord
    operands: list[OperandRecord] = Field(default_factory=list)
    carryover_target: str | None = None
    irs_reference: IrsReference
    source_knowledge_packet_id: str | None = None
    confidence_breakdown: ConfidenceBreakdown = Field(default_factory=ConfidenceBreakdown)
