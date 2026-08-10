"""Phase 2 orchestration: turn each latest instructions/publication Document
into immutable Section rows. No LLM.

Idempotent: if a document's sections were already parsed (by content_hash),
re-running does not duplicate rows — a document's sections are only ever
(re)written once, keyed by (document_id).
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from build.ingestion.parsers.pdf_structure import parse_book_html
from build.ingestion.store.version_store import latest_documents
from db.models import Section
from db.session import get_session

log = structlog.get_logger(__name__)


def run_structural_parse(form: str) -> None:
    docs = [
        d
        for d in latest_documents(form)
        if d.doc_type in ("instructions", "publication")
    ]
    if not docs:
        log.warning("structural_parser.no_documents", form=form)
        return

    with get_session() as session:
        for doc in docs:
            already = session.execute(
                select(Section.id).where(Section.document_id == doc.id).limit(1)
            ).first()
            if already:
                log.info("structural_parser.skip_already_parsed", document_id=doc.id, url=doc.source_url)
                continue

            html = open(doc.storage_path, encoding="utf-8").read()
            parsed = parse_book_html(html)

            id_by_index: dict[int, str] = {}
            for idx, p in enumerate(parsed):
                row = Section(
                    document_id=doc.id,
                    heading=p.heading,
                    anchor_id=p.anchor_id,
                    irs_line_ref=p.irs_line_ref,
                    parent_section_id=None,  # resolved in a second pass below
                    order_index=p.order_index,
                    text=p.text,
                    content_hash=p.content_hash,
                )
                session.add(row)
                session.flush()
                id_by_index[idx] = row.id

            # Second pass: resolve parent_section_id now that all rows have ids.
            for idx, p in enumerate(parsed):
                if p.parent_index is not None:
                    row = session.get(Section, id_by_index[idx])
                    row.parent_section_id = id_by_index[p.parent_index]

            session.commit()
            line_count = sum(1 for p in parsed if p.irs_line_ref)
            print(f"parsed {len(parsed):3} sections ({line_count} line-anchored) from {doc.source_url}")
