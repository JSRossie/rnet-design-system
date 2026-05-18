# Data Visualization Guidance for Charts & Vectors

**Status:** proposal — promotes candidate #1 from the v1.6 staging note
**Target repository:** `rnet-design-system`
**Suggested home:** SYSTEM.md §19 + `charts.css`, this proposal retained as the record
**Drafted:** 2026.05.17, branch `10-data-visualization`

---

## 1. The gap

The system's codename is "Charts & Vectors." §1 promises it reads
"instrumented" for "network diagrams" and dashboards. Eighteen sections in,
there is no section governing data visualization — no series-color logic, no
rule mapping the four-layer palette onto chart series, no treatment for axes,
gridlines, sparklines, or legends. For a system named for charts, that is the
most conspicuous absence in the spec.

The cost is drift. R—Net status documents and dashboards are exactly where
charts appear, and without guidance every chart re-derives its colors at the
call site — the failure §15 exists to prevent. The four-layer palette also
poses a question a chart author hits in the first five minutes: a multi-series
line chart needs several distinguishable colors, but the brand layer is
disciplined to a single accent per context. That tension needs a spec answer,
not an improvised one.

This proposal promotes the candidate. It adds §19, a chart-data color group
that survives the §4 discipline, and `charts.css`.

## 2. What ships

A new section, **§19 Data Visualization**, and a companion stylesheet,
`charts.css`, that imports `colors_and_type.css` like every other CSS file in
the system. Together they cover eleven chart types in four groups:

| Group | Types |
|---|---|
| Time-series | Line, area (incl. stacked), sparkline |
| Categorical | Bar / column, stacked / grouped bar |
| Distribution | Scatter / dot plot, histogram |
| Matrix & readouts | Heatmap, gauge / meter / progress, big-number stat, network diagram |

The network diagram is the "Vectors" half of the codename made literal — the
§1 "network diagrams" promise given a concrete treatment.

Three types are named and **declined**, recorded here so they are not
re-raised: pie and donut charts (a startup-deck reflex, out by §12, and a
worse encoding than a bar chart at every size); 3-D anything; and
bezel-and-needle skeuomorphic gauges (§12 forbids simulated instrument
bezels — the gauge that ships is a flat arc).

## 3. The render model

Charts render with **no runtime dependency**. There is no charting library and
no build step. This keeps the repository's static-asset character intact —
the concern Section 6 of the markdown-preview proposal raised about toolchains
applies here too, and the answer is to not acquire one.

`charts.css` styles two render paths, and the author — human or AI — picks per
chart:

- **CSS / HTML.** Bars, histograms, heatmaps, progress and meter bars,
  big-number stats, and sparkline-grade trends render as styled HTML — CSS
  grid, flexbox, sized elements. No SVG.
- **SVG.** Line, area, scatter, and network diagrams need geometry CSS cannot
  express; `charts.css` styles the SVG elements the author emits. The author
  supplies coordinates; the stylesheet supplies color, stroke, and type.

The test for which path: if the chart is a set of rectangles or cells aligned
to a grid, CSS is enough and simpler. If it needs arbitrary points, paths, or
edges, it is SVG. Both paths read the same tokens, so a chart looks identical
whichever way it was authored.

This satisfies the one hard constraint set for the work: **every chart renders
correctly in day and night with no per-chart override.** Charts read the §4.7
semantic roles and the §19.1 chart roles; `data-mode` does the entire job.

## 4. The chart palette

This is the part most at risk against §4 ("never invent colors"), so it is
worked in full and follows the §15 palette procedure.

### 4.1 The categorical series ramp

A multi-series chart needs distinguishable colors. The ramp is **six roles**,
`--series-1` through `--series-6`, each mode-aware in the §4.7 manner. Four of
the six are aliases of existing tokens — no new color:

| Role | Day | Night | Source |
|---|---|---|---|
| `--series-1` | `sky-deep` | `sky-light` | existing — attitude-indicator sky |
| `--series-2` | `ground-deep` | `ground-light` | existing — sectional terrain, mahogany |
| `--series-3` | `amber-deep` | `amber-glow` | existing — NVIS cockpit lighting |
| `--series-6` | `panel-deep` | `night-graphite` | existing — instrument-panel grey, the neutral series |
| `--series-4` | `terrain-deep` | `terrain-light` | **new** — VFR sectional terrain green |
| `--series-5` | `scope-deep` | `scope-light` | **new** — radar-scope / EFIS phosphor teal |

Two genuinely new hues are required, because the system has no honest green
free for chart use (the only green, `ok-fg`, is semantic and reserved for
status) and no fifth distinguishable hue at all. Both new hues are sourced the
way the rest of the palette is — `terrain` from the green elevation tint of a
VFR sectional chart, `scope` from the phosphor green-teal of a radar display.
Neither is a generic chart color reached for off a shelf.

The new primitives, with WCAG ratios on the surfaces they touch:

| Token | Hex | On `paper-true` | On `night` | Passes |
|---|---|---|---|---|
| `terrain-deep` | `#5A6B33` | 5.43:1 | — | AA body (light series) |
| `terrain-light` | `#9DAE73` | — | 6.97:1 | AA body (night series) |
| `scope-deep` | `#2F6562` | 6.16:1 | — | AA body (light series) |
| `scope-light` | `#82AEA9` | — | 6.85:1 | AA body (night series) |

All four clear AA body (4.5:1) on both the base and `-chart` elevation of their
mode — well past the 3:1 WCAG 1.4.11 floor a graphical mark must meet. Full
pairings land in the §4.5 matrix under a new "Chart data" block.

Magenta is **not** in the ramp. It was excluded at v0.8 and that decision
stands; the five distinct hue families the ramp draws on are blue, terracotta,
amber, green, and teal, plus a neutral grey.

### 4.2 The sequential ramp

Heatmaps need a sequential ramp, not a categorical one. It is **five steps**,
`--seq-1` through `--seq-5`, and it **invents nothing** — every step is an
existing token:

- **Day:** `paper-chart` → `urban` → `ground-light` → `ground` → `ground-deep`.
  This is the elevation tint of a sectional chart read straight off the
  surface and terrain tokens — low ground pale, high ground dark.
- **Night:** `night-2` → `night-4` → `ground-deep` → `amber-deep` → `amber-glow`.
  Quiet charcoal warming to a glowing amber peak, the way an instrument warms
  under load.

That the sequential ramp needs no new token is the discipline result worth
keeping: the new-color cost of this whole proposal is four primitives, all in
the categorical ramp, all honestly sourced.

### 4.3 Where the chart palette lives

The series and sequential ramps are a **fifth color group**, documented in
§19.1 and held deliberately apart from the §4.1–§4.4 layers. They are not
brand: a chart series color signals "this series," never "this is the accent."
Keeping them out of the brand layer is what lets §19.2 exempt a chart from the
single-accent rule without weakening that rule everywhere else.

## 5. The single-accent exemption

§2 and §4.6 hold the system to one brand accent per context. A six-series
chart plainly cannot. §19.2 resolves this the way §17.3 already resolved it
for link-dense documents: a **scoped, named exemption**, not a hole.

The rule: a chart may use the full `--series-*` ramp **within the chart's own
frame**, and only there. The ramp does not leak into page chrome, headings, or
prose. A document's accent is still its accent; the chart is a bounded surface
that speaks its own controlled vocabulary, the same way a code block or a data
table is. A single-series chart takes the brand accent and no ramp at all —
the ramp is earned by genuine multi-series need, not reached for by default.

## 6. Discipline rules (§19's checklist)

§19 inherits §12 and §4.6 and adds:

- **Series count is a smell.** Past four or five series a chart stops being
  readable. The ramp stops at six because six is already a warning.
- **Semantic colors stay semantic.** A red segment means a failing value, not
  "series three." Charts draw from `--series-*`; status within a chart draws
  from the §4.4 layer, and the two never trade jobs.
- **Gridlines recede.** Axes and gridlines read from `--rule`; they are
  scaffolding, never foreground. No chart junk — no gradient fills, no
  drop-shadows on bars, no 3-D extrusion.
- **The data is the ink.** Hierarchy comes from the data, not decoration.
  Negative space carries the chart the way it carries the page (§2).

## 7. Files

Following §15.5 ("land everywhere at once"), promotion touches:

- **`SYSTEM.md`** — new §19; §4.5 contrast-matrix block; §13 version row
  (→ v1.7); §14 file list.
- **`charts.css`** — new top-level file; the chart roles and both render paths.
- **`tokens.css` / `tokens.json`** — the four new primitives and the chart
  roles; token files step to v1.2.
- **`colors_and_type.css`** — the `--series-*` and `--seq-*` roles in the
  `[data-mode]` blocks, composed from tokens, no new color.
- **`reference/charts-showcase.html`** — every chart type in both modes, the
  shipped companion to `reference/charts-preview.html` (a staging sketch that
  is deleted once this lands).
- **`SHIPPING.md`** — release entry.

## 8. Open questions

Three, none blocking.

A chart with genuinely more than six series has no answer here, by design —
the position is that such a chart should be split or re-cut, not given a
seventh color. If a real R—Net document needs seven, that document is the
forcing case to revisit, not a hypothetical.

Interactive charts — tooltips, hover, zoom — are out of scope. §19 governs
the rendered, static chart. An interactive layer, if it is ever wanted,
belongs with the status-dashboard tooling in R—Net, not in the design system,
by the same scope boundary the markdown-preview proposal draws in its §3.

A print-specific chart treatment is not addressed. Light mode already serves
print; whether dense heatmaps need a print variant can wait for a real
print deliverable.
