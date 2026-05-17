# Prompting Claude with the JR / R—Net Design System

*Three fidelity levels. Pick based on context budget and task complexity.*

---

## When to use which level

- **Short** — single-shot questions, quick mockups, casual exchanges, mobile/voice
- **Standard** — most real work; building components, drafting documents, design discussions
- **Full** — first session on a major project, when you need Claude to extend the system, when consistency across many outputs matters

---

## Level 1: SHORT (system prompt, ~250 words)

Paste this as a system prompt or at the start of a conversation:

```
You are designing in the JR / R—Net "Charts & Vectors" design system, owned by James Rossie. The system serves both ceremonial work (personal correspondence, monograms, formal documents on warm paper) and instrumented work (R—Net dashboards, system status, infrastructure docs on warm charcoal).

Type: Outfit (display/headings, 500–600), Urbanist (body, 1.65+ line-height), JetBrainsMono Nerd Font (labels, metadata, glyphs, inline technical terms; uppercase labels track 2.5px). No italics on names or headlines.

Color (four layers, never mixed):
- Surfaces: paper-true #FAF6EC (ceremonial), paper-chart #FCF4DF (technical), urban #F8E4AE (callout only), night #1C1E1C (dark base) with elevations night-2 #252824, night-3 #2F322D, cream #EDE8D8 (dark ink).
- Structure: ink #1F1D18, graphite #6B675C, panel-light #D4CEBC.
- Brand (cockpit-sourced): sky #6B9BB8 / sky-deep #4A7A96 (personal accent, light mode), ground #8B5A3C / ground-deep #6B4226 (warm secondary), amber #D49826 / amber-glow #F0B84A (R—Net accent, DARK MODE ONLY — fails WCAG on light).
- Semantic R/Y/G (status only, never decorative): ok-fg #4A7A3A / ok-bg #D8E0C8, warn-fg #7A5A10 / warn-bg #F5E4A8, alert-fg #A8362A / alert-bg #ECC8C0.

Use one brand accent per context (sky for personal/light, amber for R—Net/dark) in at most three places per page. Brand and semantic colors live in separate layers; never mix. Industrial grammar: 4px accent stripe at top, corner brackets on cards, numbered section headers, occasional data caliper. Use 2–3 elements max per document. Generous negative space (48px page padding, 72px between sections). Glyphs from JetBrainsMono Nerd Font (83 sanctioned roles across 9 categories; prefer FA codepoints over MDI).

The system is not corporate, not maximalist, not skeuomorphic, not startup-deck. When in doubt: remove rather than add.
```

---

## Level 2: STANDARD (system prompt, ~1000 words)

Use the contents of `STANDARD.md` from this repository. Paste the full file as a system prompt or initial context. It covers all four color layers, every type role, the industrial grammar, glyph vocabulary, layout rules, the disciplines, and what the system is NOT.

---

## Level 3: FULL (reference attachment)

For sessions where you need Claude to extend the system, design new components, or maintain consistency across many outputs, attach or paste:

1. **`SYSTEM.md`** — the complete specification (the rulebook)
2. **`GLYPHS.md`** — the role-based glyph registry with confidence tags
3. **`tokens.json`** — machine-readable design tokens (if Claude is generating code)
4. **`VOICE.md`** — the editorial-voice standard (if Claude is authoring prose: briefings, reports, memos, status docs)

Or, if your tool can fetch URLs:

```
The complete design system is at https://github.com/[your-username]/jr-design-system. Read SYSTEM.md, GLYPHS.md, and tokens.json before producing any output. The README.md provides context for the system's philosophy.
```

---

## Tips for working with Claude in this system

**Be explicit about which mode.** Don't say "design a status page." Say "design a status page in the R—Net instrumented mode (dark surface, amber accent)." Mode-ambiguous prompts produce inconsistent output.

**Cite tokens by name, not by hex.** "Use sky-deep for the accent stripe" works better than "Use #4A7A96." Claude can then maintain the relationship if it generates multiple variations.

**Ask Claude to call out departures.** End your prompts with: "If you need to depart from the spec for this task, flag it explicitly rather than improvising silently." Claude responds well to this kind of meta-instruction.

**For glyph use, require role names.** Say "use the loc-aviation glyph in the footer" rather than letting Claude pick a glyph. This forces consultation of GLYPHS.md rather than guessing.

**Verify before printing/shipping.** Even with a full prompt, ask Claude to "list the design system elements used in your output, and confirm each one against the spec." Catches drift before it gets baked in.

**For prose, apply the written voice.** When the deliverable is a document rather than a UI — a briefing, report, memo, status doc — attach `VOICE.md` (or invoke the `rnet-voice` skill) and tell Claude to write to it. The visual spec governs how a page looks; the voice standard governs how its prose reads. They are separate, and a document needs both.

---

## Anti-patterns

Things that produce worse output:

- **Asking for "creative" departures.** This system rewards restraint. Asking Claude to "make it more visually interesting" usually breaks the discipline that makes the system work.
- **Letting Claude pick faces or colors.** Always specify. Open-ended type/color choices are where AI tools drift most.
- **Prompting without mode context.** Personal vs. instrumented is the primary axis. Pick one upfront.
- **Skipping the disciplines.** If you compress the prompt to save tokens, keep "single accent per context, brand and semantic separate, negative space carries weight" even when you cut everything else.

---

*for-claude.md · v1.1 · 2026.05.17*
