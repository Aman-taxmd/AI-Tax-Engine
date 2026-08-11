"""Dump AcroForm widget metadata from a catalogued IRS PDF for hand mapping.

Usage:
  python -m scripts.inspect_pdf_widgets --form 4562
  python -m scripts.inspect_pdf_widgets --pdf /path/to/form.pdf
"""
from __future__ import annotations

import argparse
import json
import sys

from ui.data_access import get_form_pdf_path


def _nearby_label(page, rect) -> str:
    import fitz

    clip = fitz.Rect(0, rect.y0 - 2, rect.x0, rect.y1 + 2)
    text = page.get_text("text", clip=clip)
    return " ".join(text.split())[-200:]


def inspect_pdf(pdf_path: str, line_filter: str | None = None) -> list[dict]:
    import fitz

    doc = fitz.open(pdf_path)
    rows: list[dict] = []
    try:
        for page in doc:
            for widget in page.widgets() or []:
                nearby = _nearby_label(page, widget.rect)
                if line_filter and line_filter not in nearby:
                    continue
                rows.append(
                    {
                        "pdf_field_code": widget.field_name,
                        "page_number": page.number,
                        "field_type": widget.field_type_string,
                        "rect": [round(v, 1) for v in widget.rect],
                        "nearby_text": nearby,
                    }
                )
    finally:
        doc.close()
    rows.sort(key=lambda r: (r["page_number"], r["rect"][1], r["rect"][0]))
    return rows


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--form", help="Form number (uses catalogued PDF path)")
    parser.add_argument("--pdf", help="Direct path to PDF")
    parser.add_argument("--line", help="Filter nearby_text containing this substring")
    parser.add_argument("--json", action="store_true", help="Print JSON")
    args = parser.parse_args()

    pdf_path = args.pdf
    if args.form:
        pdf_path = get_form_pdf_path(args.form)
    if not pdf_path:
        print("No PDF path — run discover first.", file=sys.stderr)
        sys.exit(1)

    rows = inspect_pdf(pdf_path, args.line)
    if args.json:
        print(json.dumps(rows, indent=2))
        return
    for r in rows:
        print(
            f"p{r['page_number']:02d} {r['field_type']:8} {r['pdf_field_code']!r} "
            f"rect={r['rect']} | {r['nearby_text'][:80]!r}"
        )
    print(f"\n{len(rows)} widgets")


if __name__ == "__main__":
    main()
