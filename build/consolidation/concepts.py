"""Phase 6: Concept normalization.

Finds definitional sections referenced from two or more different places
(e.g. "Rollovers" is cited from both Line 10 and Line 14b; the same
"Rollovers" topic also has its own section in Publication 969) and
consolidates them into ONE `concepts` row instead of letting the same
definition be re-derived and duplicated once per citing line — this is
exactly the "Age 55 Catch-up appears in three places, maintain it once"
problem called out in the plan. `concept_references` then links every
knowledge packet that actually relies on the concept.

No LLM: consolidation is driven entirely by the citation graph Phase 3
already built (structural signal — "referenced from multiple places" — not
semantic similarity).
"""
from __future__ import annotations

import re

import structlog
from sqlalchemy import func, select

from db.models import CitationEdge, Concept, ConceptReference, Document, KnowledgePacket, Section
from db.session import get_session

log = structlog.get_logger(__name__)

MIN_REFERENCING_SECTIONS = 2
MIN_HEADING_LENGTH = 4
_LINE_OR_PART_HEADING = re.compile(r"^(Line|Lines|Part\s+[IVX]+)\b", re.IGNORECASE)


def _normalized(heading: str) -> str:
    return heading.strip().rstrip(".").lower()


def run_concept_consolidation(form: str) -> None:
    with get_session() as session:
        doc_ids = session.execute(
            select(Document.id).where(Document.form_number == form)
        ).scalars().all()

        # in-degree per target section, counting distinct citing sections
        target_counts = dict(
            session.execute(
                select(CitationEdge.to_section_id, func.count(func.distinct(CitationEdge.from_section_id)))
                .where(CitationEdge.to_section_id.isnot(None))
                .group_by(CitationEdge.to_section_id)
            ).all()
        )

        qualifying_section_ids = [
            sid
            for sid, count in target_counts.items()
            if count >= MIN_REFERENCING_SECTIONS
        ]
        qualifying_sections = [session.get(Section, sid) for sid in qualifying_section_ids]
        qualifying_sections = [
            s
            for s in qualifying_sections
            if s is not None
            and s.document_id in doc_ids
            and len(s.heading.strip()) >= MIN_HEADING_LENGTH
            and not _LINE_OR_PART_HEADING.match(s.heading.strip())
        ]

        # group by normalized heading so "Rollovers" in instructions and in
        # Pub 969 become a single concept
        groups: dict[str, list[Section]] = {}
        for sec in qualifying_sections:
            groups.setdefault(_normalized(sec.heading), []).append(sec)

        created = 0
        for norm_heading, sections in groups.items():
            existing = session.execute(
                select(Concept).where(Concept.name == norm_heading)
            ).scalar_one_or_none()
            if existing is not None:
                concept = existing
            else:
                citation = [
                    {"document_id": s.document_id, "section_id": s.id, "anchor_id": s.anchor_id}
                    for s in sections
                ]
                concept = Concept(
                    name=norm_heading,
                    definition="\n\n".join(f"({s.heading}) {s.text}" for s in sections if s.text),
                    effective_year=_tax_year_for(session, sections[0]),
                    authoritative_source_citation={"sources": citation},
                )
                session.add(concept)
                session.flush()
                created += 1

            # link every knowledge packet whose line cites any of this concept's sections
            section_ids = {s.id for s in sections}
            citing_from_ids = session.execute(
                select(CitationEdge.from_section_id).where(CitationEdge.to_section_id.in_(section_ids))
            ).scalars().all()
            citing_lines = session.execute(
                select(Section.irs_line_ref).where(Section.id.in_(citing_from_ids), Section.irs_line_ref.isnot(None))
            ).scalars().all()
            for line_ref in set(citing_lines):
                packet = session.execute(
                    select(KnowledgePacket).where(
                        KnowledgePacket.form_number == form, KnowledgePacket.irs_line == line_ref
                    )
                ).scalar_one_or_none()
                if packet is None:
                    continue
                already = session.get(ConceptReference, (concept.id, packet.id))
                if already is None:
                    session.add(ConceptReference(concept_id=concept.id, knowledge_packet_id=packet.id))

        session.commit()
    print(f"concept consolidation complete: {created} new concepts from {len(groups)} candidate groups")


def _tax_year_for(session, section: Section) -> int:
    doc = session.get(Document, section.document_id)
    return doc.tax_year
