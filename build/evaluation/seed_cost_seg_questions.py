"""Seed cost segregation intake questions from cost_seg_questions.yaml."""

from __future__ import annotations

from pathlib import Path

import yaml
from sqlalchemy import select

from db.models import IntakeQuestion
from db.session import get_session

COST_SEG_QUESTIONS_PATH = (
    Path(__file__).resolve().parent.parent / "sources" / "cost_seg_questions.yaml"
)


def seed_cost_seg_questions(tax_year: int = 2025) -> None:
    raw = yaml.safe_load(COST_SEG_QUESTIONS_PATH.read_text())
    payloads = []
    for q in raw.get("questions", []):
        payloads.append({
            "question_key": q["question_key"],
            "form_number": q["form_number"],
            "prompt_text": q["prompt_text"],
            "input_type": q["input_type"],
            "choices": q.get("choices"),
            "maps_to_canonical_field": q.get("shadows_canonical_field"),
            "maps_to_condition": {"condition_field": q["feeds_condition"]} if q.get("feeds_condition") else None,
            "justification": q["justification"].strip(),
            "irs_reference": q.get("irs_reference") or {},
            "order_index": q.get("order_index", 0),
            "required": q.get("required", False),
            "tax_year": tax_year,
        })

    with get_session() as session:
        existing = {
            q.question_key: q
            for q in session.execute(
                select(IntakeQuestion).where(IntakeQuestion.tax_year == tax_year)
            ).scalars().all()
        }
        created = 0
        updated = 0
        for payload in payloads:
            row = existing.get(payload["question_key"])
            if row is None:
                session.add(IntakeQuestion(**payload))
                created += 1
            else:
                for key, value in payload.items():
                    if key != "question_key":
                        setattr(row, key, value)
                updated += 1
        session.commit()
    print(f"seed_cost_seg_questions: {len(payloads)} questions ({created} created, {updated} updated)")
