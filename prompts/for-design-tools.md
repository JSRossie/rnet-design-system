# Prompting Design Tools

*For Figma AI, Adobe Firefly/Express, Midjourney, and other visual-generation tools.*

---

## Tool-specific strengths

| Tool | Best for |
|------|----------|
| **Figma AI / Figma Tokens plugin** | Importing the token library, generating components within Figma |
| **Adobe Firefly / Express** | Vector exploration, monogram refinement, illustration in system style |
| **Adobe Illustrator AI** | Production-ready vector work (final monogram, scalable assets) |
| **Midjourney** | Reference imagery, mood/inspiration, not production assets |
| **Photoshop Generative Fill** | Texture/background generation matching cockpit aesthetic |

---

## Figma setup

### Importing the tokens

1. Install the **Figma Tokens plugin** (or Tokens Studio for Figma)
2. Import `tokens.json` from this repository
3. The plugin will create color styles, text styles, and spacing tokens matching the system
4. Apply tokens to Figma components rather than raw color picks

### Prompting Figma AI

```
Generate a [component name] for the JR / R—Net design system.
Mode: [ceremonial light | instrumented dark]
Use only design tokens from the imported library:
- Surfaces: paper-true, paper-chart, urban (callout-only), night, night-2, night-3
- Brand: sky, sky-deep, ground, ground-deep, amber (dark only), amber-glow
- Text: ink (light), cream (dark), graphite (secondary)
- Semantic R/Y/G: ok-fg/bg, warn-fg/bg, alert-fg/bg
- Type: Outfit (display), Urbanist (body), JetBrainsMono Nerd Font (mono)

No gradients, no shadows, no glass effects. Generous whitespace.
```

---

## Adobe Firefly / Illustrator AI

### For monogram refinement

If you're refining the JR monogram (Didot/Bodoni serif with arrow vector):

```
Vector logo in serif lettering. Two letters: "J" in warm terracotta (#8B5A3C), 
"R" in deep slate blue (#4A7A96). Letters set in a Didot or Bodoni serif at 
similar weight to ITC Bodoni 72. Thin construction grid lines in pale sky blue 
(#6B9BB8 at 50% opacity) crossing through the letters — one vertical centerline, 
one horizontal at optical midpoint. A solid arrow vector in sky blue (#6B9BB8) 
angled approximately 30 degrees upward from lower-left to upper-right, passing 
through both letters. Background: pure cream (#FAF6EC) or transparent. Flat 
illustration, no gradients, no shadows, no textures. Aviation-instrument and 
heraldic seal aesthetic combined. Scalable vector style.
```

### For supplementary illustrations

For ceremonial documents (light mode):

```
Minimal technical illustration in the style of mid-century aviation manuals.
Color palette: warm cream paper (#FAF6EC) background, terracotta brown (#8B5A3C)
linework, deep blue-grey (#4A7A96) accents, dark ink (#1F1D18) for primary 
forms. Subject: [your subject]. Composition: generous whitespace, single 
focal element, optional construction lines suggesting drafting. No gradients, 
no shadows, no textures, no human figures. Clean vector aesthetic similar to 
1960s technical documentation.
```

For instrumented documents (dark mode):

```
Technical diagram in the style of an aircraft cockpit instrument display.
Color palette: warm charcoal (#1C1E1C) background, NVIS amber (#D49826) for 
primary linework and numerical readouts, brighter amber (#F0B84A) for emphasis, 
muted sky blue (#A8C5D8) for secondary callouts, cream text (#EDE8D8) for 
labels. Subject: [your subject]. Aesthetic: precision, instrumentation, 
night-shift cockpit lighting. No gradients, no glow effects, no glass, no 
photo-realism. Flat vector style.
```

---

## Midjourney (reference / mood only)

Midjourney is excellent for inspiration but typically too painterly for production assets in this system. Use it to inform your direction, not to produce final work.

### Mood references

```
Aircraft cockpit instrument panel close-up, attitude indicator visible, warm 
charcoal panel, amber NVIS lighting, cream-colored bezels, terracotta brown 
accents, technical and precise, 1960s aerospace aesthetic, no humans, no 
gradients in the rendering, flat color blocks --ar 16:9 --style raw
```

```
VFR sectional aeronautical chart detail, warm cream paper, soft beige urban 
areas, deep blue-grey topographic lines, dark mahogany classification boundaries,
muted color palette, minimal, drafting aesthetic, no labels, no logos --ar 16:9
--style raw
```

### What to avoid

- "Beautiful" or "stunning" — pushes Midjourney toward maximalism
- "Modern" — produces glass effects and gradients
- "Tech" or "futuristic" — adds neon and sci-fi visuals
- "Premium" — adds gold accents and luxury textures

---

## Photoshop Generative Fill

Useful for matching surface textures or extending background imagery:

```
Warm cream paper texture, subtle, no grain, flat color matching #FAF6EC, 
suitable as a document background.

Warm charcoal surface, instrument panel finish, no shine, no reflection, 
flat color matching #1C1E1C, slight matte quality.
```

---

## For all design tools: the constraints that matter most

When working with any visual AI, these constraints produce the most consistent results:

1. **Specify exact hex values** — visual tools interpret color names loosely
2. **Say what NOT to include** — gradients, shadows, glass, glow, gloss, neon, gradients, photo-realism
3. **Cite a tradition** — "aviation instrumentation," "1960s drafting," "VFR sectional charts" anchors better than abstract style descriptions
4. **Avoid amplifying words** — "minimal" not "stunning minimal"; "precise" not "incredibly precise"
5. **Vector aesthetic by default** — even when the output is raster, asking for vector style produces cleaner results

---

## What to use these tools for vs. avoid

| Use design tools for | Avoid using design tools for |
|---|---|
| Mood/reference exploration | Final production assets |
| Initial monogram exploration | Final monogram (do in Illustrator) |
| Texture/background references | Document layouts (use HTML/CSS or InDesign) |
| Iconography exploration | Iconography production (use the Nerd Font set) |
| Color palette validation | Color palette generation (use the locked system) |
| Mockup illustrations | Components and UI (use code with tokens.css) |

---

*for-design-tools.md · v1.0 · 2026.05.14*
