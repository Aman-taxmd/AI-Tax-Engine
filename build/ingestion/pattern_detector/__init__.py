"""Phase 3 orchestration: run all three detectors over every Section
belonging to the form's documents and persist results as `citation_edges`
rows. No LLM. Idempotent per section (skips sections that already have
edges recorded)."""
from __future__ import annotations

import structlog
from sqlalchemy import select

from build.ingestion.pattern_detector import cardinality_refs, carryover_refs, citation_refs
from build.ingestion.store.version_store import latest_documents
from db.models import CitationEdge, Section
from db.session import get_session

log = structlog.get_logger(__name__)

_DETECTORS = (carryover_refs.detect, citation_refs.detect, cardinality_refs.detect)


def run_pattern_detection(form: str) -> None:
    doc_ids = [d.id for d in latest_documents(form) if d.doc_type in ("instructions", "publication")]
    if not doc_ids:
        log.warning("pattern_detector.no_documents", form=form)
        return

    with get_session() as session:
        sections = session.execute(
            select(Section).where(Section.document_id.in_(doc_ids))
        ).scalars().all()

        totals = {"carryover_ref": 0, "exception_ref": 0, "cardinality_ref": 0}
        for section in sections:
            already = session.execute(
                select(CitationEdge.id).where(CitationEdge.from_section_id == section.id).limit(1)
            ).first()
            if already:
                continue

            for detector in _DETECTORS:
                for edge in detector(session, section):
                    session.add(
                        CitationEdge(
                            from_section_id=section.id,
                            edge_type=edge.edge_type,
                            raw_phrase=edge.raw_phrase,
                            to_document_hint=edge.to_document_hint,
                            to_section_id=edge.to_section_id,
                            resolution_method=edge.resolution_method,
                            confidence=edge.confidence,
                        )
                    )
                    totals[edge.edge_type] += 1
        session.commit()

    print(
        f"pattern detection complete: "
        f"{totals['carryover_ref']} carryover_ref, "
        f"{totals['exception_ref']} exception_ref, "
        f"{totals['cardinality_ref']} cardinality_ref"
    )
