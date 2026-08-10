"""Phase 6: explicit Dependency Graph (concept edges only — see docs/adr/0008).

Turns an already-known relationship into first-class `dependency_edges`
rows, so "what breaks if X changes" is a query instead of something someone
has to remember: field -> concept, derived from Phase 6's own
`concept_references` (e.g. Line 10 depends on the "rollovers" concept).

field -> field edges (e.g. "Line 13 depends on Line 2 and Line 12") used to
be derived here too, from Phase 3's regex-detected `carryover_ref` edges.
That approach had no way to distinguish a real composition ("add line 9")
from an exclusion ("do NOT include line 9"), and silently dropped operands
whose line number didn't exactly match a `Section`. Those edges are now
written by `build/synthesis/calc_rule_writer.py`'s LLM Calc Rule Agent
instead, as a direct byproduct of the same call that decides the field's
formula — a single source of truth for "what does this field depend on"
rather than two independently-fallible passes.

No LLM here — this remains a pure graph-construction pass over data already
produced.
"""
from __future__ import annotations

import structlog
from sqlalchemy import select

from db.models import Concept, ConceptReference, DependencyEdge, KnowledgePacket
from db.session import get_session

log = structlog.get_logger(__name__)


def _field_name(form: str, irs_line: str) -> str:
    return f"form_{form}_line_{irs_line}"


def run_dependency_graph_build(form: str) -> None:
    with get_session() as session:
        existing = {
            (e.field_a, e.depends_on_type, e.depends_on_ref)
            for e in session.query(DependencyEdge).all()
        }
        concept_edges = 0

        # field -> concept, from concept_references
        refs = session.execute(select(ConceptReference)).scalars().all()
        for ref in refs:
            packet = session.get(KnowledgePacket, ref.knowledge_packet_id)
            concept = session.get(Concept, ref.concept_id)
            if packet is None or concept is None:
                continue
            field_a = _field_name(packet.form_number, packet.irs_line)
            key = (field_a, "concept", concept.name)
            if key in existing:
                continue
            existing.add(key)
            session.add(DependencyEdge(field_a=field_a, depends_on_type="concept", depends_on_ref=concept.name))
            concept_edges += 1

        session.commit()

    print(f"dependency graph build complete: {concept_edges} field->concept edges (field->field now written by calc_rule_writer.py)")
