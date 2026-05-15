# Prompting v0, Cursor, and UI-Generation Tools

*For tools that produce React, HTML, and Tailwind code directly.*

---

## Two integration paths

**Path A: Token-first (recommended).** Drop `tokens.css`, `tailwind.config.js`, or `tokens.json` into your project. Then prompt v0/Cursor with token names rather than hex values. The tools produce code that references the design system, not code that bakes hex into one-off styles.

**Path B: Prompt-only.** Use the system prompt below if you can't add files to the project. Less ideal — the tool will inline hex values everywhere — but works for quick exploration.

---

## Path A: Token-first setup (v0 / Cursor / Lovable / Bolt)

### Step 1: Drop in the tokens

For **Tailwind projects**: copy `tailwind.config.js` into your project. Extends the default Tailwind theme with all system colors, fonts, sizes, and spacing.

For **CSS-variable projects**: copy `tokens.css` into your project. Import at the top of your global stylesheet:
```css
@import './tokens.css';
```

For **Style Dictionary / Figma Tokens / cross-platform**: use `tokens.json` directly with your build tooling.

### Step 2: Add the system prompt

```
This project uses the JR / R—Net "Charts & Vectors" design system. All design tokens are available via [tailwind.config.js | tokens.css | tokens.json]. Use system tokens by name; never hardcode hex values.

System rules:
- Two modes: ceremonial (light, sky accent) and instrumented (dark, amber accent)
- Type: Outfit (display), Urbanist (body), JetBrainsMono Nerd Font (labels/mono)
- One brand accent per context, max 3 uses per page
- Brand colors (sky/ground/amber) and semantic colors (ok/warn/alert) never mix
- amber is DARK MODE ONLY (fails WCAG on light)
- Generous negative space: p-page (48px), spacing between sections is space-section (72px)
- No gradients, no glass, no emoji, no large rounded buttons
- Industrial grammar: 4px accent stripe, corner brackets, numbered headers, calipers — use 2–3 max per page

When generating components, prefer system tokens like:
  bg-paper-true text-ink font-body
  border-l-stripe border-sky-deep
  font-mono text-h2 tracking-label uppercase

Not:
  bg-[#FAF6EC] text-[#1F1D18] (avoid)
```

### Step 3: Component prompts

Use specific, mode-anchored prompts:

```
Build a React status card in the R—Net instrumented mode:
- bg-night surface
- 4px amber accent stripe at top
- Outfit semibold for the status title
- 2x2 grid of stat tiles on night-2 panels
- Stat values in Outfit medium with amber unit suffixes
- Status indicators using semantic colors (ok-glow / warn-glow / alert-glow)
- Footer in mono with night-graphite text
```

---

## Path B: Prompt-only (when you can't add files)

If you're working in a tool that only accepts a prompt (no file context), use this expanded system message:

```
Generate UI code following the JR / R—Net design system. Use these EXACT hex values:

Surfaces (light): #FAF6EC (paper-true), #FCF4DF (paper-chart), #F8E4AE (urban callout-only).
Surfaces (dark): #1C1E1C (night base), #252824 (night-2), #2F322D (night-3), #EDE8D8 (cream text).
Structure: #1F1D18 (ink text), #6B675C (graphite metadata), #D4CEBC (panel-light borders).
Brand: #6B9BB8 (sky), #4A7A96 (sky-deep), #8B5A3C (ground), #6B4226 (ground-deep), #D49826 (amber — DARK MODE ONLY), #F0B84A (amber-glow).
Semantic: #4A7A3A/#D8E0C8 (ok), #7A5A10/#F5E4A8 (warn), #A8362A/#ECC8C0 (alert).

Type: Outfit (display 500-600), Urbanist (body 400/600 line-height 1.7), JetBrainsMono Nerd Font (labels mono uppercase 2.5px tracking).

Patterns:
- 4px accent stripe at top of pages/panels (sky-deep light, amber dark)
- Section headers: [NUM ▸] [MONO UPPERCASE TITLE] [── rule ──] [META]
- Status callouts: 3px left border in semantic color, semantic bg tint
- Stat tiles: Outfit value + mono unit suffix in accent color
- Generous spacing: 48px page padding, 72px between sections, 1.65+ line-height

Restraint:
- NO gradients, NO glass/blur effects, NO drop shadows
- NO emoji (use Nerd Font glyphs instead)
- NO large rounded buttons (corners 4px max)
- NO decorative use of brand colors — accent appears 3 times per page max
- NO mixing semantic with brand colors

Always specify which mode (ceremonial/light or instrumented/dark) the component is for.
```

---

## v0-specific advice

**v0.dev's strengths:** Tailwind native, produces React/Next.js, good at iterative refinement.

- **Always specify the file references in the project**: "Use the Tailwind preset from `/tailwind.config.js`. Use the design tokens like `bg-paper-true`, `text-ink`, `border-sky-deep`."
- **Mode upfront**: "Generate in the R—Net instrumented (dark) mode" or "Generate in the ceremonial (light) mode."
- **Component derivation**: ask v0 to compose from primitives. "Build a status table using existing system tokens — no new colors, no new spacing values."
- **Iterate on restraint**: v0's first output usually has more visual elaboration than the system wants. Follow up with "remove decoration, reduce to essential elements only."

---

## Cursor-specific advice

**Cursor's strengths:** in-context to your existing codebase, can read SYSTEM.md as context.

- **Reference files explicitly**: `@SYSTEM.md @GLYPHS.md @tokens.css` at the top of prompts
- **Generate token-using code**: "Use CSS variables from tokens.css. Reference `var(--sky-deep)`, not `#4A7A96`."
- **For TypeScript/React**: ask Cursor to generate types for the token system if you want compile-time safety

---

## When the output drifts

UI-generation tools tend to drift in three predictable ways. Counter-prompts that work:

| Drift | Counter-prompt |
|-------|----------------|
| Added gradients | "Remove gradients. The system uses flat color only." |
| Emoji or large icons | "Replace emoji with Nerd Font glyphs from GLYPHS.md. Reduce icon sizes." |
| Bubbly rounded buttons | "Reduce border-radius to 4px maximum. The system uses sharp or barely-rounded corners." |
| Color used decoratively | "Audit accent color usage. Brand colors should appear at most 3 times per page and always carry meaning." |
| Mixed brand + semantic | "Separate brand colors (sky/ground/amber) from semantic colors (ok/warn/alert). They live in different layers and never appear in the same role." |

---

*for-v0.md · v1.0 · 2026.05.14*
