"""CLI entrypoint for PDF ground-truth promotion."""
from build.consolidation.promote_pdf_ground_truth import (
    promote_all_cost_seg_and_w2,
    promote_pdf_mappings_from_ground_truth,
)

if __name__ == "__main__":
    promote_all_cost_seg_and_w2()
