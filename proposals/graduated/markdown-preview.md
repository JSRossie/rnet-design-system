# Proposal · Markdown Preview Styling & Template Chrome

**Status:** Graduated 2026.05.17 into `SYSTEM.md` §17 and `markdown.css`. Retained for design-rationale history; not a live proposal.
**Owner:** James Rossie
**Opened:** 2026.05.17
**Shipped in:** SYSTEM.md v1.4

---

## 0. What this is

A working proposal, not spec. It records the assessment and open design
decisions for two related extensions to the JR / R—Net design system:

1. Styling for **rendered markdown** and markdown previews.
2. General, non-prescriptive guidance for the **chrome regions** of every
   template (header, eyebrow, footer, classification stripe).

Nothing here is binding until it is designed, resolved, and folded into
`SYSTEM.md` through the §15 extension procedure. The `proposals/` directory
is the staging area for that work — extensions live here while they are
being figured out, and only graduate into the spec once stable.

A non-tracked, exploratory HTML sample backs this proposal. It lives in
`.staging/markdown treatment/` (gitignored) because it is a scratch
artifact, not a deliverable.

---

## 1. Markdown preview — viability

**Verdict: viable, and a natural fit.** Markdown's constrained vocabulary
suits a system whose first instinct is restraint. The system already
specifies the things a markdown stylesheet needs; the friction is narrow.

### Maps cleanly to existing primitives

| Markdown element | System primitive |
|------------------|------------------|
| Body paragraphs  | Body role (Urbanist 14–16, line-height 1.65–1.75), `--content-max-prose` 720px |
| `> blockquote`   | Note-callout panel — `urban` + `ground` border (light) / `night-3` + `sky` border (dark) |
| `` `inline code` `` | "Inline accent" type role, `night-4` chip |
| Tables           | R—Net sites-table pattern — mono uppercase headers, hairline rules, no fills |
| `---` horizontal rule | Hair rule (`--border-rule-hair`) |
| Light / dark     | The Two Modes (§9), 1:1 with a preview theme toggle |

### Gap 1 — heading hierarchy (needs a design decision)

The spec defines only **Display, H1, and H2**, and its H2 is an
*eyebrow/label* (11–12px uppercase mono) — not a section title. Markdown
routinely uses `#`–`####`, where `##` is a genuine section title. A markdown
`h2` cannot map onto the system's eyebrow H2.

**Proposed heading ramp** (a §15 type extension, to be confirmed):

| Markdown | Face | Size | Weight | Treatment |
|----------|------|------|--------|-----------|
| `h1` | Outfit | ~38px | 600 | Display-adjacent |
| `h2` | Outfit | ~26px | 500 | Heading + hairline underline |
| `h3` | Outfit | ~18px | 500 | Sub-heading |
| `h4` | JetBrainsMono | ~12px | 500 | Mono uppercase eyebrow, accent color |
| `h5`/`h6` | — | — | — | Fall back to bold inline; no new ramp step |

Markdown cannot author the full §8 numbered-section header (`NUM ▸ TITLE —
rule — META`), so the ramp leans on type weight and case, per §8's
"hierarchy via type, not decoration."

### Gap 2 — industrial grammar lives in the wrapper, not the content

Markdown has no syntax for monograms, accent stripes, corner brackets, or
numbered section headers. The system's grammar (§6) therefore belongs to the
**preview wrapper / chrome**, not the rendered body. The wrapper supplies
stripe, padding, max-width, and header/footer; the markdown content stays
disciplined plain prose underneath.

### Discipline note — links

A markdown document with many links would exceed §4.6's "accent in at most
three places." Resolve as §7 resolves glyphs: links *carry meaning*, so they
are exempt like functional glyphs — not decorative accent. This should be
written down explicitly when the pattern enters the spec.

---

## 2. Template chrome — general guidance (open task)

Separate from markdown, and broader. The system has no general account of
its **chrome regions** — only ad-hoc per-pattern mentions scattered through
§10. This task adds one.

### The regions

- **Classification stripe** — `ground-deep`, top of page; formal documents only.
- **Accent stripe** — the system's most visible single mark (§6).
- **Eyebrow** — left: wordmark + mono-uppercase label; right: meta.
- **Title + metadata block** — the document's name and its identifying line.
- **Footer** — left: wordmark / sign-off; right: locating metadata.

### The task

Add a SYSTEM.md section that gives guidance on how these regions tend to be
used **given the nature of the content** — across *all* template types
(stationery, covers, dashboards, status docs, field notes, markdown).

**It must not be prescriptive.** No "the footer must contain X" rules. The
goal is to orient an AI or human user: what each region is *for*, where
content naturally sits — then let them place it. The section should also
reconcile the per-pattern header/footer descriptions already in §10 so they
read as instances of one consistent idea rather than separate inventions.

The same regions are filled differently by content type — a personal
letter's footer is a contact block; a dashboard's is a location tag plus
timestamp; a formal cover's is `REV · COPY · AUTHOR`. The guidance's job is
to make that variation feel coherent, not to legislate it.

---

## 3. Front-matter vocabulary (markdown-specific)

Front matter is **markdown's mechanism** for feeding the chrome regions.
Other template types feed the same regions by other means (template
parameters, direct authoring). So this vocabulary belongs with the markdown
work, not the general chrome guidance.

It is **not a closed set.** It is a documented *superset* a markdown author
draws from, and the AI using the system may augment it with new fields when
a document genuinely needs one — reuse before inventing, per §15. A previewer
should handle unknown keys gracefully (ignore, or render into a generic meta
slot), not reject them.

### Known superset (starting point, open-ended)

| Field | Notes |
|-------|-------|
| `doc-id` | Document identifier, e.g. `RNET-RB-0042`. Optional. Numbering scheme: §4.2. |
| `title` | Drives the `h1`. |
| `context` | `rnet` or `personal` — selects accent + surface (§9). |
| `mode` | Optional override of the context's default day/night. |
| `eyebrow` | Mono-uppercase label beside the wordmark. |
| `node` / `site` | Infrastructure node or site identifier (rnet). |
| `owner` / `author` | Responsible person. |
| `rev` / `version` | Semantic version (§11). |
| `created`, `reviewed`, `next-review`, `effective` | Dates; formatted per §11. |
| `class` | Classification — Internal / Confidential / Public / Draft. Draws the classification stripe. |
| `status` | Draft / Stable / Active / Deprecated. |
| `supersedes` / `superseded-by` | Cross-document references. |
| `copy` | Copy number for controlled distribution (§10 cover: `REV · COPY · AUTHOR`). |
| `recipient`, contact-block fields (email, location) | Ceremonial documents. |

### Discipline

Front matter — and chrome metadata generally — drives chrome **content**
only. It is never a styling escape hatch: no `accent-color`, no font fields.
Metadata selects from system primitives; it does not add new ones.

---

## 4. Resolved decisions

Resolved 2026.05.17 on branch `02-markdown-treatment`. These supersede the
open questions this section previously held and are the basis for the
markdown pattern's graduation into `SYSTEM.md`.

### 4.1 Heading ramp — prose-scoped ramp, `h4` reuses the eyebrow

The type system (§3) has only Display, H1, and an "H2" that is a 12px
mono-uppercase *eyebrow label*, not a section title. Markdown needs a genuine
title hierarchy. The v1.3 tokens `--type-h2: 20px` / `--type-h3: 16px` exist
but were sized for UI panels, not a 720px prose measure — reusing them would
apply UI-tuned sizes to a long-form context they were not tuned for.

**Resolution:** add a *prose-scoped* heading ramp — heading sizes namespaced
to the document context, not new global UI rungs. This is a §15 type
extension done honestly: the tokens do not pretend to be universal.

| Markdown | Face | Token | Size | Weight | Tracking |
|----------|------|-------|------|--------|----------|
| `h1` | Outfit | `--type-md-h1` | 38px | 600 | -1.2px |
| `h2` | Outfit | `--type-md-h2` | 26px | 500 | -0.4px, hairline underline |
| `h3` | Outfit | `--type-md-h3` | 18px | 500 | -0.2px |
| `h4` | JetBrainsMono | `--type-label` (reused) | 12px | 500 | 2.5px, uppercase, accent |
| `h5`/`h6` | — | — | — | bold inline fallback, no new rung |

`h4` is not a new invention: the system's existing "H2" *is* a
mono-uppercase eyebrow label, so markdown `h4` simply reuses that rung. New
`--type-md-*` tokens land in `colors_and_type.css` per the §15 procedure.

### 4.2 `doc-id` — optional, `CONTEXT-TYPE-SEQ`

`doc-id` stays an **optional** front-matter field. When present it uses:

```
<CONTEXT>-<TYPE>-<SEQ>      e.g.  RNET-RB-0042
```

- `CONTEXT` — `RNET`, or `JR` for personal documents.
- `TYPE` — two-letter document-type code: `RB` runbook, `SD` status doc,
  `FN` field note, `CV` cover/formal, `LT` letter, `MD` general memo.
- `SEQ` — four-digit zero-padded, allocated per `CONTEXT`+`TYPE`.

A central allocation ledger is **out of scope for this branch** — numbers
are assigned by hand for now. The format is fixed; a registry can follow
later without changing it.

### 4.3 Sequencing — chrome guidance splits to its own branch

This proposal originally wanted the general chrome guidance (§2) to land
first. Since it was written, the v1.3 controls cohort shipped component-level
chrome — `.card--stripe`, `.card--brackets`, `.topbar`, `.section-rule` — so
the chrome guidance must now reconcile §10 *and* §16, a materially larger
task than first scoped.

**Resolution:** the chrome guidance moves to its own later branch, re-scoped
to reconcile both. The markdown pattern proceeds independently on
`02-markdown-treatment`; its previewer builds chrome provisionally against
the regions as they exist today. The dependency runs one way and does not
block markdown — when the chrome guidance lands it will describe what
markdown already does, not contradict it.

### 4.4 Spec placement — new §17, version → 1.4

The markdown pattern graduates as a single new section **§17 Rendered
Markdown**, appended after §16 (no renumbering). It carries the content
pattern, the §4.1 heading ramp, the element→primitive mapping, and the
front-matter vocabulary (§3) as a subsection — front matter is
markdown-specific and belongs with it. `SYSTEM.md` bumps **1.3 → 1.4**
(minor; additions only, including the §15-compliant prose-ramp tokens).

### 4.5 Implementation reuses the §4.7 semantic layer

Surfaced by review, not an original open question. The exploratory sample
forks its own role variables (`--surface`, `--ink-body`, `--code-bg`, …) and
re-styles code blocks and callouts that already exist as v1.3 controls. The
shipped `markdown.css` instead **imports `colors_and_type.css`** and
re-derives the codeblock/callout treatment from the §4.7 role layer, so a
rendered bare `<pre>` / `<blockquote>` matches `.codeblock` / `.alert--note`
without needing the class. No forked variables.

---

## 5. Sequencing

Superseded by §4.3. The markdown pattern ships first, on its own branch
(`02-markdown-treatment`), independent of the chrome guidance. Order within
this branch: resolve decisions (§4 — done) → `markdown.css` → reference
showcase + previewer → graduate into `SYSTEM.md §17` (v1.4). The chrome
guidance follows on a later branch, re-scoped to reconcile §10 and §16.

---

*Proposal · markdown-preview · opened 2026.05.17 · decisions resolved 2026.05.17 · branch 02-markdown-treatment*
