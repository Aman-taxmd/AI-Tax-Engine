"""Phase 4/5: wires the Knowledge Extraction LangGraph workflow and exposes
the CLI-facing entrypoints (`run_extraction`, `list_pending_reviews`,
`resolve_review`).

Graph shape (matches the plan's architecture diagram):

    line_scoper -> extractor -> [needs more context?] -> cross_ref_resolver -> line_scoper (loop)
                                                        -> structural_check -> [ok?] -> persist_packet -> END
                                                                             -> human_review (interrupt) -> persist_packet -> END

Checkpointed to a local SQLite file (`var/graph_checkpoints.db`) so an
interrupt genuinely survives across separate CLI process invocations —
a human reviewer resolves it later, in a different `python -m build.cli
...` call, and the resume value flows back into the exact paused node.
"""
from __future__ import annotations

from contextlib import contextmanager
from datetime import datetime, timezone
from pathlib import Path

from langgraph.checkpoint.sqlite import SqliteSaver
from langgraph.graph import END, StateGraph
from langgraph.types import Command
from sqlalchemy import select

from build.graph.nodes import cross_ref_resolver, extractor, human_review, line_scoper, persist_packet, structural_check
from build.graph.state import ExtractionState
from db.models import Document, HumanReviewItem, KnowledgePacket, Section
from db.session import get_session

MAX_ATTEMPTS = 3
CHECKPOINT_DB = Path(__file__).resolve().parent.parent.parent / "var" / "graph_checkpoints.db"


def _route_after_extraction(state: ExtractionState) -> str:
    if state["draft_packet"]["needs_more_context"] and state.get("attempt", 0) < MAX_ATTEMPTS:
        return "cross_ref_resolver"
    return "structural_check"


def _route_after_resolver(state: ExtractionState) -> str:
    return "line_scoper" if state.get("resolver_found_new") else "structural_check"


def _route_after_structural_check(state: ExtractionState) -> str:
    return "persist_packet" if state["consistency_ok"] else "human_review"


def _route_after_human_review(state: ExtractionState) -> str:
    # A "retry_with_feedback" resolution produced a brand-new draft packet
    # that needs re-validating (see human_review.py) — everything else
    # (accept/correct) already set consistency_ok=True directly and goes
    # straight to persist_packet, same as before this feature existed.
    return "structural_check" if state.get("review_status") == "retry_pending" else "persist_packet"


def build_extraction_graph(checkpointer) -> object:
    graph = StateGraph(ExtractionState)
    graph.add_node("line_scoper", line_scoper.run)
    graph.add_node("extractor", extractor.run)
    graph.add_node("cross_ref_resolver", cross_ref_resolver.run)
    graph.add_node("structural_check", structural_check.run)
    graph.add_node("human_review", human_review.run)
    graph.add_node("persist_packet", persist_packet.run)

    graph.set_entry_point("line_scoper")
    graph.add_edge("line_scoper", "extractor")
    graph.add_conditional_edges(
        "extractor", _route_after_extraction, {"cross_ref_resolver": "cross_ref_resolver", "structural_check": "structural_check"}
    )
    graph.add_conditional_edges(
        "cross_ref_resolver", _route_after_resolver, {"line_scoper": "line_scoper", "structural_check": "structural_check"}
    )
    graph.add_conditional_edges(
        "structural_check", _route_after_structural_check, {"persist_packet": "persist_packet", "human_review": "human_review"}
    )
    graph.add_conditional_edges(
        "human_review", _route_after_human_review, {"structural_check": "structural_check", "persist_packet": "persist_packet"}
    )
    graph.add_edge("persist_packet", END)

    return graph.compile(checkpointer=checkpointer)


@contextmanager
def _checkpointer():
    CHECKPOINT_DB.parent.mkdir(parents=True, exist_ok=True)
    with SqliteSaver.from_conn_string(str(CHECKPOINT_DB)) as saver:
        yield saver


def _line_anchored_sections(form: str) -> list[Section]:
    with get_session() as session:
        doc_ids = session.execute(
            select(Document.id).where(Document.form_number == form, Document.doc_type == "instructions")
        ).scalars().all()
        return list(
            session.execute(
                select(Section).where(Section.document_id.in_(doc_ids), Section.irs_line_ref.isnot(None))
            ).scalars().all()
        )


def run_extraction(form: str) -> None:
    sections = _line_anchored_sections(form)
    with _checkpointer() as checkpointer:
        app = build_extraction_graph(checkpointer)
        for section in sections:
            with get_session() as session:
                already = session.query(KnowledgePacket).filter(
                    KnowledgePacket.form_number == form, KnowledgePacket.irs_line == section.irs_line_ref
                ).first()
            if already:
                print(f"line {section.irs_line_ref:6} already extracted (packet {already.id[:8]}) — skipping")
                continue

            thread_id = f"{form}:{section.irs_line_ref}"
            initial_state: ExtractionState = {
                "form_number": form,
                "irs_line": section.irs_line_ref,
                "primary_section_id": section.id,
                "attempt": 0,
                "max_attempts": MAX_ATTEMPTS,
                "reference_section_ids": [],
            }
            result = app.invoke(initial_state, config={"configurable": {"thread_id": thread_id}})

            if "__interrupt__" in result:
                payload = result["__interrupt__"][0].value
                _record_pending_review(thread_id, payload)
                print(f"line {section.irs_line_ref:6} PAUSED for human review (thread {thread_id})")
            else:
                status = result["status"]
                print(f"line {section.irs_line_ref:6} extracted -> knowledge_packets status={status}")


def _review_item_detail(payload: dict) -> dict:
    """Everything build/../ui/pages/3_Human_Review_Queue.py needs to render
    this extraction_thread item without a further join or LangGraph-
    checkpoint read — see HumanReviewItem.detail's docstring in db/models.py."""
    source_url = None
    quote = None
    with get_session() as session:
        section = session.get(Section, payload.get("primary_section_id"))
        if section is not None:
            quote = section.text
            doc = session.get(Document, section.document_id)
            source_url = doc.source_url if doc else None
    return {
        "irs_line": payload.get("irs_line"),
        "source_url": source_url,
        "quote": quote,
        "draft_packet": payload.get("draft_packet"),
        "consistency_issues": payload.get("consistency_issues", []),
    }


def _record_pending_review(thread_id: str, payload: dict) -> None:
    with get_session() as session:
        existing = session.query(HumanReviewItem).filter(
            HumanReviewItem.related_id == thread_id, HumanReviewItem.status == "pending"
        ).first()
        if existing:
            return
        session.add(
            HumanReviewItem(
                related_type="extraction_thread",
                related_id=thread_id,
                reason="; ".join(payload.get("consistency_issues", [])),
                status="pending",
                detail=_review_item_detail(payload),
            )
        )
        session.commit()


def list_pending_reviews() -> list[HumanReviewItem]:
    with get_session() as session:
        return list(
            session.query(HumanReviewItem).filter(HumanReviewItem.status == "pending").all()
        )


def resolve_review(thread_id: str, resolution: dict) -> None:
    with _checkpointer() as checkpointer:
        app = build_extraction_graph(checkpointer)
        result = app.invoke(Command(resume=resolution), config={"configurable": {"thread_id": thread_id}})

    with get_session() as session:
        item = session.query(HumanReviewItem).filter(
            HumanReviewItem.related_id == thread_id, HumanReviewItem.status == "pending"
        ).first()
        if item:
            item.status = "resolved"
            item.resolution_notes = str(resolution)
            item.resolved_at = datetime.now(timezone.utc)
            session.commit()

    if "__interrupt__" in result:
        # A retry_with_feedback resolution produced a new draft that still
        # has issues (or a fresh one) — it paused again rather than
        # terminating (see human_review.py / _route_after_human_review).
        # Open a NEW pending item so it doesn't silently vanish from the
        # queue; never reuse the just-resolved item's id (immutability).
        payload = result["__interrupt__"][0].value
        _record_pending_review(thread_id, payload)
        print(f"thread {thread_id}: retry paused again for another human look")
    else:
        print(f"thread {thread_id} resolved -> knowledge_packets status={result.get('status')}")
