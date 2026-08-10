"""carryover_ref detection (Phase 3), no LLM.

Finds sentences that describe a value flowing from one line to another
(within the same form, or to a named cross-form line — e.g. Schedule 1)."
"raw_phrase" is always the full sentence, so a human reviewer sees the exact
computational instruction, not just a bare line number.
"""
from __future__ import annotations

import re

from sqlalchemy.orm import Session

from build.ingestion.pattern_detector.common import DetectedEdge, resolve_line_ref_in_document
from db.models import Section

_SENTENCE_SPLIT = re.compile(r"(?<=[.!?])\s+")

# A sentence is a carryover candidate if it contains one of these verbs
# together with a "line N" mention.
_CARRYOVER_VERB = re.compile(
    r"\b(enter|add|subtract|multiply|divide|include|smaller of|larger of|"
    r"figure|total of|combine)\b",
    re.IGNORECASE,
)
_LINE_MENTION = re.compile(r"\bline[s]?\s+(\d+[a-z]?)\b", re.IGNORECASE)
_CROSS_FORM_LINE = re.compile(
    r"\b(Schedule\s+\d[A-Z]?\s*\(Form\s+\d{3,4}\)|Form\s+\d{3,4}[A-Z]?)"
    r"(?:,\s*Part\s+[IVX]+)?,?\s*line\s+(\d+[a-z]?)\b",
    re.IGNORECASE,
)


def detect(session: Session, section: Section) -> list[DetectedEdge]:
    if not section.text:
        return []
    edges: list[DetectedEdge] = []
    for sentence in _SENTENCE_SPLIT.split(section.text):
        if not _CARRYOVER_VERB.search(sentence):
            continue

        cross_matches = list(_CROSS_FORM_LINE.finditer(sentence))
        for m in cross_matches:
            form_ref, line_no = m.group(1), m.group(2)
            edges.append(
                DetectedEdge(
                    edge_type="carryover_ref",
                    raw_phrase=sentence.strip(),
                    to_document_hint=f"{form_ref} line {line_no}",
                    to_section_id=None,
                    resolution_method="unresolved",  # resolved cross-document in Phase 4/6
                    confidence=0.5,
                )
            )

        cross_spans = {m.span() for m in cross_matches}
        for m in _LINE_MENTION.finditer(sentence):
            if any(start <= m.start() < end for start, end in cross_spans):
                continue  # already captured as part of a cross-form reference
            line_no = m.group(1)
            if line_no == section.irs_line_ref:
                continue  # a line referencing its own number isn't a dependency
            target_id = resolve_line_ref_in_document(session, section.document_id, line_no)
            edges.append(
                DetectedEdge(
                    edge_type="carryover_ref",
                    raw_phrase=sentence.strip(),
                    to_document_hint=None,
                    to_section_id=target_id,
                    resolution_method="regex" if target_id else "unresolved",
                    confidence=0.85 if target_id else 0.4,
                )
            )
    return edges
