"""PDF Field Mapping — see docs/adr/0008.

Maps a canonical field to the real AcroForm field code on the actual IRS
PDF (e.g. `adjustments.hsa_contribution_amount`, Form 8889 line 2, ->
`topmostSubform[0].Page1[0].f1_2[0]`), so
the Streamlit "realistic form view" (ui/pages/2_Answer_Questions.py) can
fill and render the genuine IRS PDF instead of a synthetic line list.

IRS fillable PDFs use auto-generated field codes with no embedded
description text (confirmed empirically — see the module-level check this
plan verified with pypdf/PyMuPDF: field widgets carry no `/TU` tooltip
text), so there is no mechanical way to derive this mapping. An LLM
(`llm_client.map_pdf_fields`) proposes it from each PDF field widget's page
number and on-page position (its `rect`) cross-referenced against each
canonical field's line number and description — genuinely inferential, not
deterministic, so every proposal is scored, and anything below
CONFIDENCE_THRESHOLD is routed to the Human Review Queue (`related_type=
"pdf_field_mapping"`) instead of trusted silently.

Scoped to only the pilot's in-scope fields (runtime/chain.py's
ancestor_closure) for this form — never all ~229 fields on Form 1040, most
of which (name, SSN, bank routing numbers, ...) aren't modeled at all.

Idempotent: existing PdfFieldMapping rows and pending pdf_field_mapping
review items for this form's in-scope fields are cleared before remapping.
"""
from __future__ import annotations

import re
from datetime import datetime, timezone

import structlog
from sqlalchemy import select

from build.graph.llm_client import map_pdf_fields
from db.models import CanonicalField, Document, HumanReviewItem, PdfFieldMapping
from db.session import get_session
from runtime.chain import ancestor_closure, form_field_condition

log = structlog.get_logger(__name__)

CONFIDENCE_THRESHOLD = 0.7


def _line_sort_key(line_ref: str | None) -> tuple:
    if not line_ref:
        return (float("inf"), "")
    m = re.match(r"^(\d+)", line_ref)
    return (int(m.group(1)) if m else float("inf"), line_ref)


_NEARBY_TEXT_MAX_CHARS = 200


def _nearby_label_text(page: "fitz.Page", rect: "fitz.Rect") -> str:
    """Extracts the printed text immediately to the left of a form field
    widget, on the same row -- i.e. the actual line label ("z  Add lines 1a
    through 1h ... 1z") printed next to that box.

    This is what actually fixed the "position + reading-order counting
    alone" approach, which turned out to still mis-map fields on long,
    densely-packed forms (verified empirically: Form 1040's ~200-widget,
    2-page layout got its one pilot field, line 10, mapped to line 1z's box
    instead) -- counting blind is fragile, but the real printed label next
    to each box is unambiguous ground truth extracted directly from the PDF,
    not inferred.
    """
    import fitz  # noqa: F401 (only for the type reference above; already a hard dependency here)

    clip = fitz.Rect(0, rect.y0 - 2, rect.x0, rect.y1 + 2)
    text = page.get_text("text", clip=clip)
    text = " ".join(text.split())  # collapse the newline-per-character noise get_text("text") emits
    return text[-_NEARBY_TEXT_MAX_CHARS:]


def _extract_pdf_field_candidates(pdf_path: str) -> list[dict]:
    import fitz  # PyMuPDF — imported lazily so the rest of the build pipeline

    # doesn't require it unless this phase is actually run.
    candidates: list[dict] = []
    doc = fitz.open(pdf_path)
    try:
        for page in doc:
            for widget in page.widgets() or []:
                candidates.append(
                    {
                        "pdf_field_code": widget.field_name,
                        "page_number": page.number,
                        "rect": [round(v, 1) for v in (widget.rect.x0, widget.rect.y0, widget.rect.x1, widget.rect.y1)],
                        "field_type": widget.field_type_string,
                        "nearby_text": _nearby_label_text(page, widget.rect),
                    }
                )
    finally:
        doc.close()
    # Reading order (page, then top-to-bottom, then left-to-right) — a
    # secondary signal the LLM can fall back on when `nearby_text` is blank
    # or ambiguous (see llm_client.PDF_FIELD_MAPPING_SYSTEM_PROMPT).
    candidates.sort(key=lambda c: (c["page_number"], c["rect"][1], c["rect"][0]))
    return candidates


def run_pdf_field_mapping(form: str, tax_year: int = 2025) -> None:
    with get_session() as session:
        pdf_doc = session.execute(
            select(Document).where(Document.form_number == form, Document.doc_type == "form")
        ).scalars().first()
        if pdf_doc is None:
            print(
                f"pdf field mapping: no catalogued PDF 'form' document for form={form} — "
                f"add 'form' to include_doc_types in build/sources/catalog/form_{form}.yaml and re-run discover"
            )
            return

        in_scope = ancestor_closure(session)
        fields = session.execute(
            select(CanonicalField).where(
                form_field_condition(CanonicalField.field_name, form), CanonicalField.tax_year == tax_year
            )
        ).scalars().all()
        in_scope_fields = [f for f in fields if f.field_name in in_scope]
        if not in_scope_fields:
            print(f"pdf field mapping: no in-scope (ancestor-closure) canonical fields for form={form}")
            return
        field_ids = [f.id for f in in_scope_fields]

        # Idempotent regeneration.
        old_mappings = session.execute(
            select(PdfFieldMapping).where(PdfFieldMapping.canonical_field_id.in_(field_ids))
        ).scalars().all()
        for m in old_mappings:
            session.delete(m)
        old_items = session.execute(
            select(HumanReviewItem).where(
                HumanReviewItem.related_type == "pdf_field_mapping",
                HumanReviewItem.related_id.in_(field_ids),
                HumanReviewItem.status == "pending",
            )
        ).scalars().all()
        for item in old_items:
            session.delete(item)
        session.flush()

        candidates = _extract_pdf_field_candidates(pdf_doc.storage_path)
        in_scope_names = {f.field_name for f in in_scope_fields}
        result = map_pdf_fields(
            form=form,
            # The FULL field list (not just the in-scope subset) is given so
            # the model can correctly count/order the whole line sequence and
            # avoid the "field code digit != line number" off-by-one trap —
            # see llm_client.PDF_FIELD_MAPPING_SYSTEM_PROMPT. Only
            # `required: true` fields are ever persisted/reviewed below.
            in_scope_fields=[
                {
                    "field_name": f.field_name,
                    "line": f.source_form_line,
                    "description": f.description,
                    "required": f.field_name in in_scope_names,
                }
                for f in sorted(fields, key=lambda f: _line_sort_key(f.source_form_line))
            ],
            pdf_field_candidates=candidates,
        )

        fields_by_name = {f.field_name: f for f in in_scope_fields}
        mapped_field_names: set[str] = set()
        confident = low_confidence = 0

        for proposal in result.mappings:
            field = fields_by_name.get(proposal.field_name)
            if field is None or field.field_name in mapped_field_names:
                continue  # never invented, never a duplicate target for one field
            mapped_field_names.add(field.field_name)

            mapping = PdfFieldMapping(
                canonical_field_id=field.id,
                form_number=form,
                pdf_field_code=proposal.pdf_field_code,
                page_number=proposal.page_number,
                confidence=proposal.confidence,
                reasoning=proposal.reasoning,
                model_version=result.model_version,
                prompt_version=result.prompt_version,
                tax_year=tax_year,
            )
            session.add(mapping)

            if proposal.confidence >= CONFIDENCE_THRESHOLD:
                confident += 1
            else:
                low_confidence += 1
                session.add(
                    HumanReviewItem(
                        related_type="pdf_field_mapping",
                        related_id=field.id,
                        reason=(
                            f"[pdf_field_mapping] {field.field_name} -> {proposal.pdf_field_code} "
                            f"(confidence={proposal.confidence:.2f}): {proposal.reasoning}"
                        ),
                        status="pending",
                        detail={
                            "field_name": field.field_name,
                            "line": field.source_form_line,
                            "proposed_pdf_field_code": proposal.pdf_field_code,
                            "page_number": proposal.page_number,
                            "confidence": proposal.confidence,
                            "reasoning": proposal.reasoning,
                            "model_version": result.model_version,
                        },
                    )
                )

        unmapped = 0
        for field in in_scope_fields:
            if field.field_name in mapped_field_names:
                continue
            unmapped += 1
            session.add(
                HumanReviewItem(
                    related_type="pdf_field_mapping",
                    related_id=field.id,
                    reason=f"[pdf_field_mapping] {field.field_name}: no confident PDF field code match found",
                    status="pending",
                    detail={
                        "field_name": field.field_name,
                        "line": field.source_form_line,
                        "proposed_pdf_field_code": None,
                        "confidence": 0.0,
                        "reasoning": "LLM agent omitted this field — no candidate PDF widget matched confidently.",
                        "model_version": result.model_version,
                    },
                )
            )

        session.commit()

    print(
        f"pdf field mapping complete (form={form}): {confident} confident mappings, "
        f"{low_confidence} low-confidence (-> human review), {unmapped} unmapped (-> human review)"
    )


def resolve_pdf_field_mapping_review(
    item_id: str, action: str, reviewer: str, pdf_field_code: str | None = None
) -> None:
    """Resolves a `pdf_field_mapping` HumanReviewItem — a low-confidence or
    entirely-unmapped LLM proposal. `item.related_id` is a canonical_field_id
    (not a PdfFieldMapping id — see run_pdf_field_mapping's uniform
    "related_id = canonical_field_id" convention, since an unmapped field has
    no PdfFieldMapping row to point at). Supports:
      * "accept": trust the LLM's low-confidence proposal as-is.
      * "manual_map": a human supplies the correct `pdf_field_code` by hand
        (the only option for a field the agent omitted entirely).
    Either way, an existing PdfFieldMapping row is updated in place (or
    created, for a previously-unmapped field) with confidence=1.0 and
    model_version="human_review".
    """
    with get_session() as session:
        item = session.get(HumanReviewItem, item_id)
        if item is None or item.related_type != "pdf_field_mapping":
            raise ValueError(f"no pending pdf_field_mapping review item with id={item_id!r}")
        field_id = item.related_id
        field = session.get(CanonicalField, field_id)
        if field is None:
            raise ValueError(f"canonical field {field_id!r} referenced by review item {item_id!r} not found")

        detail = item.detail or {}
        existing = session.execute(
            select(PdfFieldMapping).where(
                PdfFieldMapping.canonical_field_id == field_id, PdfFieldMapping.form_number == detail.get("form_number", field.field_name.split("_")[1])
            )
        ).scalars().first()

        if action == "accept":
            code = detail.get("proposed_pdf_field_code")
            if not code:
                raise ValueError("cannot 'accept' a review item with no proposed_pdf_field_code — use manual_map instead")
            reason = f"Human review: accepted LLM's low-confidence proposal (reviewer={reviewer})"
        elif action == "manual_map":
            if not pdf_field_code:
                raise ValueError("manual_map requires a `pdf_field_code`")
            code = pdf_field_code
            reason = f"Human review: manually mapped (reviewer={reviewer})"
        else:
            raise ValueError(f"unsupported action for a pdf_field_mapping review item: {action!r}")

        form_number = field.field_name.split("_")[1]
        if existing is not None:
            existing.pdf_field_code = code
            existing.confidence = 1.0
            existing.reasoning = reason
            existing.model_version = "human_review"
        else:
            session.add(
                PdfFieldMapping(
                    canonical_field_id=field_id,
                    form_number=form_number,
                    pdf_field_code=code,
                    page_number=detail.get("page_number", 0) or 0,
                    confidence=1.0,
                    reasoning=reason,
                    model_version="human_review",
                    prompt_version=None,
                    tax_year=field.tax_year,
                )
            )

        item.status = "resolved"
        item.resolution_notes = reason
        item.resolved_at = datetime.now(timezone.utc)
        session.commit()

    print(f"pdf_field_mapping review item {item_id[:8]} resolved ({action}) -> field {field.field_name} -> {code}")
