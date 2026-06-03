# components/

This directory holds the production monogram SVGs, the R—Net logo pack, and document templates.

## Monogram (shipped v1.1)

- `monogram-light.svg` — Primary mark for light surfaces (`paper-true`, `paper-chart`).
- `monogram-dark.svg` — Primary mark for dark surfaces (`night` and elevations).
- `monogram-mono.svg` — Monochrome variant for fax, emboss, single-color print.

The SVG is the spec for each variant — color choices (per-letter palette, arrow color, construction-line treatment) are defined by the asset, not by `SYSTEM.md §5`. To produce updated variants, refine the source SVG in Illustrator and overwrite the file; do not parameterise the colors via CSS.

These three files are the canonical source, and they are **also published to the CDN** (since `SYSTEM.md` v1.13) as `jr-monogram-{day,night,mono}` — `light`→`day`, `dark`→`night`. `rnet/build-logos.sh` copies and rasterizes them from here (they are path-only, so nothing is outlined), and `cdn/build.sh` serves them at `cdn.rossie.net/charts-and-vectors/logos/`. Editing a file here and rebuilding republishes the matching CDN asset.

## R—Net logo pack (shipped v1.6)

`rnet/` holds the R—Net brand lockups — wordmark, JR-paired horizontal and stacked forms, the `INFRASTRUCTURE` subtitle variants, and the FPM mark — in day / night / mono. They derive from the JR monogram above plus the cockpit palette and Outfit / JBM type; see `SYSTEM.md §5` and `rnet/README.md`.

Unlike the monograms, the lockups are **generated**: `rnet/src/` is the editable source (the wordmark is live `<text>`), and `rnet/build-logos.sh` outlines it to the self-contained `rnet/svg/` plus `rnet/png/`. Edit `src/` and rebuild — don't hand-edit `svg/` or `png/`. The CDN serves the outlined form at `cdn.rossie.net/charts-and-vectors/logos/`.

## Templates

The `templates/` subdirectory will hold reusable document scaffolds — stationery, business cards, R—Net dashboard skeletons, document covers — as they're built.

Per `SYSTEM.md §15`, document templates are deferred to point of need. Build them as you have specific use cases, not in advance.

## Web controls

UI controls (buttons, fields, modals, etc.) are **not** under `components/`. They ship as `controls.css` at the repo root and are documented in `SYSTEM.md §16` and `reference/controls-showcase.html`.
