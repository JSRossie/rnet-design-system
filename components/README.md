# components/

This directory holds the production monogram SVGs and document templates.

## Monogram (shipped v1.1)

- `monogram-light.svg` — Primary mark for light surfaces (`paper-true`, `paper-chart`).
- `monogram-dark.svg` — Primary mark for dark surfaces (`night` and elevations).
- `monogram-mono.svg` — Monochrome variant for fax, emboss, single-color print.

The SVG is the spec for each variant — color choices (per-letter palette, arrow color, construction-line treatment) are defined by the asset, not by `SYSTEM.md §5`. To produce updated variants, refine the source SVG in Illustrator and overwrite the file; do not parameterise the colors via CSS.

## Templates

The `templates/` subdirectory will hold reusable document scaffolds — stationery, business cards, R—Net dashboard skeletons, document covers — as they're built.

Per `SYSTEM.md §15`, document templates are deferred to point of need. Build them as you have specific use cases, not in advance.

## Web controls

UI controls (buttons, fields, modals, etc.) are **not** under `components/`. They ship as `controls.css` at the repo root and are documented in `SYSTEM.md §16` and `reference/controls-showcase.html`.
