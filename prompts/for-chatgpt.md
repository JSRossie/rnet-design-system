# Prompting ChatGPT with the JR / R—Net Design System

*Three fidelity levels, with adjustments for ChatGPT's particular quirks.*

---

## Differences from Claude prompting

ChatGPT (4o, o1, o3) tends to:

- **Default to maximalism unless explicitly told otherwise.** Where Claude leans toward restraint, ChatGPT often adds visual elaboration. The "what this is NOT" section matters more.
- **Forget constraints over long conversations.** Re-paste the spec at section boundaries when working on multi-step projects.
- **Substitute fonts silently.** Always include the exact font names AND a directive to refuse the task if those fonts aren't available, rather than substituting.
- **Reach for emoji and gradients.** Explicit negative constraints are required.
- **Generate verbose summaries before producing the actual output.** Add "produce the design output first, explanations after."

---

## Level 1: SHORT (Custom Instructions, ~250 words)

Paste this into ChatGPT's "Custom Instructions" → "How would you like ChatGPT to respond?" field, or as the first message of a new conversation:

```
For all design work, follow the JR / R—Net "Charts & Vectors" design system. Owner: James Rossie. Serves two contexts: ceremonial (personal stationery, correspondence, monograms on warm paper) and instrumented (R—Net infrastructure dashboards, status reports on warm charcoal).

EXACT TYPE — do not substitute: Outfit (display 500–600), Urbanist (body 400/600, line-height 1.65+), JetBrainsMono Nerd Font (labels/metadata/glyphs; uppercase labels track 2.5px). No italics on names or headlines.

EXACT COLORS (hex required):
Surfaces: paper-true #FAF6EC, paper-chart #FCF4DF, urban #F8E4AE (callout-only), night #1C1E1C, night-2 #252824, night-3 #2F322D, cream #EDE8D8.
Structure: ink #1F1D18, graphite #6B675C, panel-light #D4CEBC.
Brand (cockpit): sky #6B9BB8 / sky-deep #4A7A96 (personal accent), ground #8B5A3C / ground-deep #6B4226, amber #D49826 / amber-glow #F0B84A (DARK MODE ONLY).
Semantic R/Y/G (status only): ok-fg #4A7A3A / ok-bg #D8E0C8, warn-fg #7A5A10 / warn-bg #F5E4A8, alert-fg #A8362A / alert-bg #ECC8C0.

RULES (strict):
1. ONE brand accent per page (sky for personal, amber for R—Net). Max three uses per page.
2. Brand and semantic colors NEVER mix. Green panels mean "OK," never "decorative."
3. NO gradients, NO glass effects, NO emoji, NO large rounded buttons, NO textures.
4. Generous negative space: 48px page padding, 72px between sections, 1.65+ line-height on body.
5. Industrial grammar: 4px accent stripe at top, corner brackets on cards, numbered section headers. Use 2–3 elements max per document, not all six.
6. When in doubt: REMOVE rather than add. The system rewards restraint.
7. Produce design output first, explanations after.
```

---

## Level 2: STANDARD (project-level instruction, ~1000 words)

For ChatGPT Projects or persistent conversations, use the contents of `STANDARD.md` as the project-level instruction. Add this preamble to combat ChatGPT's elaboration tendency:

```
This is the binding specification for all design work in this project. Follow it strictly. Do not add embellishments, alternative interpretations, or "improved" versions. If you encounter a constraint that prevents a request, state the conflict explicitly rather than working around it.

[paste contents of STANDARD.md]
```

---

## Level 3: FULL (uploaded reference)

If using ChatGPT with file upload (GPT-4 with file analysis):

1. Upload `SYSTEM.md`, `GLYPHS.md`, and `tokens.json` to the conversation — and `VOICE.md` if the deliverable is prose (a briefing, report, memo, status doc)
2. Use this opening prompt:

```
I've uploaded the complete design system reference. Before producing any output, read all three files. Then for every design task in this conversation:

1. Identify which mode (ceremonial/light or instrumented/dark) the task requires
2. List the specific tokens you'll use
3. Produce the design output
4. Confirm compliance: "All elements verified against SYSTEM.md" or list any departures

If a task can't be completed within the spec, surface the conflict before improvising.
```

---

## ChatGPT-specific anti-patterns

These produce worse output than the same prompts in Claude:

- **"Make it pop"** or **"give it some visual interest"** — ChatGPT will reach for gradients, oversized accents, and decoration. Either avoid these phrases or counter with "while staying within the system's restraint discipline."
- **Open-ended creative briefs** — ChatGPT defaults to elaboration. Always constrain the output ("produce X in the ceremonial mode using only sky-deep as accent").
- **"Use your judgment"** — ChatGPT's design judgment without an anchor tends toward generic SaaS aesthetics. Provide the anchor.
- **Long sessions without re-anchoring** — drift after 10+ turns. Paste the SHORT spec again at major task transitions.

---

## Prose deliverables — apply the written voice

When the task is a document rather than a UI, the visual spec is only half the job. Attach `VOICE.md` and instruct ChatGPT to write to it. ChatGPT defaults hard into the patterns the voice standard bans — self-narration of the document's honesty, AI-vocabulary (delve, pivotal, crucial, underscore, robust), negative parallelism, bold claim-sentences, and reflexive em-dashes — so the negative constraints matter more here, the same way the "what this is NOT" section matters more for visuals. A useful counter-instruction: "Revise against the `VOICE.md` §6 checklist before returning the document."

---

## ChatGPT-specific strengths

ChatGPT is genuinely better than Claude at:

- **Producing executable code that hits exact color values** (less likely to round or improvise)
- **Generating long, structured token files** (verbose by nature, useful here)
- **Producing many variations in one response** (good for exploring within constraints once those constraints are locked)
- **DALL-E integration** — if you need imagery, ChatGPT + DALL-E can produce supplementary visuals; specify "in the style of aviation cockpit instrumentation, warm charcoal surfaces, amber accent, no people, no gradients, no glass effects."

---

*for-chatgpt.md · v1.1 · 2026.05.17*
