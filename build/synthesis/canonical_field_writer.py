"""Phase 7: Canonical Field synthesis.

Merges two independently-derived sources for each form line:
  * the XSD element skeleton (Phase 2's `parse_xsd_file`) — gives the exact
    e-file field name, data type, and line number, straight from the IRS
    MeF schema (never guessed).
  * the validated `knowledge_packets` produced by extraction (Phase 4/5) —
    gives the human-readable description and grounds the field in its exact
    IRS instruction text.

Cardinality is set from Phase 3's `cardinality_ref` findings rather than
inferred from the XSD's minOccurs/maxOccurs alone (the XSD only says an
*element* can repeat structurally; it doesn't say *why*). For Form 8889 the
strongest, explicitly-stated signal found in the real instructions text is
"Complete a separate Form 8889 for each spouse" — i.e. the cardinality is at
the *form* level (one 8889 per HSA-owning spouse on a joint return), so it
applies uniformly to every field on this form rather than varying per line.
"""
from __future__ import annotations

import re
from pathlib import Path

import structlog
from sqlalchemy import select

from build.ingestion.download import PRIMARY_XSD_FILENAME_BY_FORM
from build.ingestion.parsers.xsd_xml import XsdElement, parse_xsd_file
from build.ingestion.store.version_store import latest_documents
from db.models import CanonicalField, CitationEdge, Document, KnowledgePacket, Section
from db.session import get_session

log = structlog.get_logger(__name__)

_PART_HEADING_RE = re.compile(r"^Part\s+[IVX]+\b", re.IGNORECASE)
XSD_INPUT_DIR = Path(__file__).resolve().parent.parent / "ingestion" / "input" / "irs_xsd_schemas" / "ty2025"

# Confirmed (by grepping every pilot XSD, see docs/adr/0009 follow-up) that
# real IRS MeF schemas routinely reuse one printed LineNumber across several
# unrelated elements -- e.g. Schedule C's line 1 is BOTH a dollar amount
# (TotalGrossReceiptsAmt) and an unrelated "statutory employee" attachment
# checkbox (StatutoryEmployeeFromW2Ind). The naive "first element in file
# order claims the field_name, everything else silently isn't created"
# behaviour let file order decide which element wins -- confirmed to have
# actually picked the checkbox over the dollar amount for Schedule C line 1
# and silently dropped Schedule 1's line 4 ("Other gains or (losses)") and
# line 7 ("Unemployment compensation") dollar amounts entirely, wrongly
# making both look like "the XSD has no dollar element for this line" (see
# schedule1_income_bridge.py's original docstring, since corrected).
#
# Fix: within each colliding line-number group, prefer the one non-checkbox
# ("real value") element as the base field_name; every other element in the
# group gets a distinguishing suffix instead of being dropped. When more than
# one non-checkbox candidate collides (e.g. Schedule 1 line 7 has both
# RepaymentAmt and UnemploymentCompAmt), automatic heuristics can't tell
# which one is the line's actual printed figure -- this manual table settles
# those specific cases (verified against the real f1040s1.pdf: line 7 is
# printed "Unemployment compensation").
_MANUAL_PRIMARY_OVERRIDES: dict[tuple[str, str], str] = {
    ("1040s1", "7"): "UnemploymentCompAmt",
}

_CHECKBOX_TYPES = {"CheckboxType", "BooleanType"}
_CAMEL_RE = re.compile(r"(?<!^)(?=[A-Z])")


def _slug(xsd_element: str) -> str:
    return _CAMEL_RE.sub("_", xsd_element).lower()


def _resolve_line_number_collisions(form: str, elements: list[XsdElement]) -> dict[str, str]:
    """Maps each element's `xsd_element` name to the line-number token it
    should use when building its `form_{form}_line_{token}` field_name --
    equal to `element.line_number` for the vast majority with no collision,
    or a disambiguated `{line_number}_{slug}` for every non-primary element
    in a colliding group."""
    groups: dict[str, list[XsdElement]] = {}
    for el in elements:
        if el.line_number:
            groups.setdefault(el.line_number, []).append(el)

    resolved: dict[str, str] = {}
    for line_number, group in groups.items():
        if len(group) == 1:
            resolved[group[0].xsd_element] = line_number
            continue

        override_name = _MANUAL_PRIMARY_OVERRIDES.get((form, line_number))
        primary: XsdElement | None = None
        if override_name is not None:
            primary = next((e for e in group if e.xsd_element == override_name), None)
        if primary is None:
            non_checkbox = [e for e in group if e.xsd_type not in _CHECKBOX_TYPES]
            primary = non_checkbox[0] if len(non_checkbox) == 1 else group[0]

        for el in group:
            resolved[el.xsd_element] = line_number if el is primary else f"{line_number}_{_slug(el.xsd_element)}"
        if primary is group[0] and len(group) > 1 and override_name is None and len(
            [e for e in group if e.xsd_type not in _CHECKBOX_TYPES]
        ) != 1:
            log.warning(
                "canonical_field_writer.unresolved_line_collision",
                form=form,
                line_number=line_number,
                elements=[e.xsd_element for e in group],
            )
    return resolved


def _find_packet_for_line(line_number: str, packets_by_line: dict[str, KnowledgePacket]) -> KnowledgePacket | None:
    if line_number in packets_by_line:
        return packets_by_line[line_number]
    for combined_ref, packet in packets_by_line.items():
        if line_number in [p.strip() for p in combined_ref.split(",")]:
            return packet
    return None


def _form_document_ids(session, form: str) -> list[str]:
    return list(session.execute(select(Document.id).where(Document.form_number == form)).scalars().all())


def _determine_form_wide_cardinality(session, form: str) -> tuple[str, str | None]:
    """Scoped to THIS form's own documents/sections — without that scoping,
    a cardinality_ref found anywhere in the whole DB (e.g. 8889's "separate
    Form 8889 for each spouse") would incorrectly leak onto every other form
    synthesized afterwards, now that multiple forms share this database."""
    doc_ids = _form_document_ids(session, form)
    if not doc_ids:
        return "single", None
    row = session.execute(
        select(CitationEdge)
        .join(Section, Section.id == CitationEdge.from_section_id)
        .where(
            CitationEdge.edge_type == "cardinality_ref",
            CitationEdge.to_document_hint == "taxpayer_spouse",
            Section.document_id.in_(doc_ids),
        )
        .limit(1)
    ).scalar_one_or_none()
    if row is not None:
        return "multi_instance", "taxpayer_spouse"
    return "single", None


def _numeric_prefix(line_ref: str) -> int | None:
    m = re.match(r"^(\d+)", line_ref)
    return int(m.group(1)) if m else None


def _part_for_line(session, form: str, line_number: str) -> str:
    """Find the nearest preceding 'Part N' heading (by order_index) within
    the same document as this line's section — Part headings are siblings
    of Line headings under 'Specific Instructions', not their parents (see
    pdf_structure.py), so this is resolved by document order rather than by
    walking parent_section_id.

    All lookups are scoped to THIS form's own documents (via `doc_ids`) —
    without that scoping, "line 13" would ambiguously match whichever
    document happens to have a Section with that irs_line_ref first (Form
    8889, Schedule 1, and Form 1040 all have an unrelated "line 13")."""
    doc_ids = _form_document_ids(session, form)
    if not doc_ids:
        return "Unknown"

    line_section = session.execute(
        select(Section).where(Section.irs_line_ref == line_number, Section.document_id.in_(doc_ids))
    ).scalars().first()
    if line_section is None:
        # No dedicated heading for this exact line (e.g. line 4/5 are only
        # discussed within "Line 3"'s section) — fall back to the nearest
        # lower-numbered line that DOES have its own heading, still within
        # this form's own documents only.
        target_num = _numeric_prefix(line_number)
        candidates = [
            s for s in session.query(Section).filter(
                Section.irs_line_ref.isnot(None), Section.document_id.in_(doc_ids)
            ).all()
            if _numeric_prefix(s.irs_line_ref) is not None
            and target_num is not None
            and _numeric_prefix(s.irs_line_ref) <= target_num
        ]
        line_section = max(candidates, key=lambda s: _numeric_prefix(s.irs_line_ref)) if candidates else None
    if line_section is None:
        return "Unknown"
    parts = (
        session.query(Section)
        .filter(Section.document_id == line_section.document_id, Section.order_index < line_section.order_index)
        .order_by(Section.order_index.desc())
        .all()
    )
    for p in parts:
        if _PART_HEADING_RE.match(p.heading.strip()):
            return p.heading
    return "General"


def run_canonical_field_synthesis(form: str, tax_year: int = 2025) -> None:
    primary_xsd_filename = PRIMARY_XSD_FILENAME_BY_FORM.get(form)
    if primary_xsd_filename is None:
        log.warning("canonical_field_writer.no_primary_xsd_mapping", form=form)
        return
    xsd_docs = [d for d in latest_documents(form, "xsd") if d.source_url.endswith(primary_xsd_filename)]
    if not xsd_docs:
        log.warning("canonical_field_writer.no_xsd", form=form)
        return
    inventory = parse_xsd_file(Path(xsd_docs[0].storage_path))

    with get_session() as session:
        packets = session.execute(
            select(KnowledgePacket).where(KnowledgePacket.form_number == form)
        ).scalars().all()
        packets_by_line = {p.irs_line: p for p in packets}

        cardinality, instance_dimension = _determine_form_wide_cardinality(session, form)
        line_tokens = _resolve_line_number_collisions(form, inventory.elements)

        created = 0
        for element in inventory.elements:
            if not element.line_number:
                continue  # administrative/identity elements (SSN, name) aren't calculated lines

            field_name = f"form_{form}_line_{line_tokens[element.xsd_element]}"
            existing = session.execute(
                select(CanonicalField).where(
                    CanonicalField.field_name == field_name, CanonicalField.tax_year == tax_year
                )
            ).scalars().first()
            if existing is not None:
                continue

            packet = _find_packet_for_line(element.line_number, packets_by_line)
            description = element.documentation or element.xsd_element
            if packet is not None:
                description = f"{element.documentation} — {packet.core_text[:200]}"

            section_part = _part_for_line(session, form, element.line_number)

            row = CanonicalField(
                field_name=field_name,
                section=section_part,
                data_type=element.xsd_type,
                cardinality=cardinality,
                instance_dimension=instance_dimension,
                source_xsd_element=element.xsd_element,
                source_form_line=element.line_number,
                description=description,
                tax_year=tax_year,
            )
            session.add(row)
            created += 1
        session.commit()

    print(f"canonical field synthesis complete: {created} fields created from {len(inventory.elements)} XSD elements")
