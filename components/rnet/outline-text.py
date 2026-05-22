#!/usr/bin/env python3
"""outline-text.py — convert <text> in a logo SVG to <path> outlines.

The R—Net wordmark SVGs render "R NET" / "INFRASTRUCTURE" as live <text>
referencing Outfit 600 and JetBrains Mono 500 by family name. That only
renders correctly inline on a page that already loads those faces; as an
<img>, CSS background, or design-tool import the text falls back to a system
font. This script bakes the glyphs to <path> using the *self-hosted* woff2,
so the output SVG is self-contained and renders identically anywhere.

Glyph geometry is computed in each <text> element's local coordinate space and
the replacement <path> is spliced in at the same position, so any enclosing
<g transform> / inherited fill still applies. Fonts are read straight from
cdn/charts-and-vectors/fonts/ — no third-party CDN, matching HOSTING.md.

Usage: outline-text.py IN.svg OUT.svg
"""
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont
from fontTools.pens.svgPathPen import SVGPathPen
from fontTools.pens.transformPen import TransformPen

SVG_NS = "http://www.w3.org/2000/svg"
ET.register_namespace("", SVG_NS)

REPO = Path(__file__).resolve().parents[2]
FONTS = REPO / "cdn" / "charts-and-vectors" / "fonts"

_font_cache = {}


def load_font(family):
    """Map an SVG font-family list to a self-hosted face, instanced if needed."""
    fam = family.split(",")[0].strip().strip("'\"").lower()
    if fam == "outfit":
        key = "outfit-600"
        if key not in _font_cache:
            f = TTFont(FONTS / "outfit-latin-var.woff2")
            instantiateVariableFont(f, {"wght": 600}, inplace=True)
            _font_cache[key] = f
        return _font_cache[key]
    if fam in ("jetbrains mono", "jetbrainsmono"):
        key = "jbm-500"
        if key not in _font_cache:
            _font_cache[key] = TTFont(FONTS / "jetbrains-mono-nerd-medium.woff2")
        return _font_cache[key]
    raise SystemExit(f"unmapped font-family: {family!r}")


def glyph_run(font, text, font_size, letter_spacing):
    """Return (path_d, advances) for `text`, baking position + y-flip in."""
    upm = font["head"].unitsPerEm
    scale = font_size / upm
    cmap = font.getBestCmap()
    gs = font.getGlyphSet()
    pen = SVGPathPen(gs)
    cur_x = 0.0
    advances = []
    for ch in text:
        gname = cmap.get(ord(ch))
        if gname is None:
            raise SystemExit(f"glyph missing for {ch!r}")
        # translate(cur_x, 0) * scale(scale, -scale): font is y-up, SVG y-down.
        tpen = TransformPen(pen, (scale, 0, 0, -scale, cur_x, 0))
        gs[gname].draw(tpen)
        adv = gs[gname].width * scale
        advances.append(adv)
        cur_x += adv + letter_spacing
    return pen.getCommands(), advances


def local(tag):
    return tag.split("}", 1)[1] if "}" in tag else tag


def resolve(el, parents, attr):
    """Walk up the parent chain for an inherited presentation attribute."""
    cur = el
    while cur is not None:
        if attr in cur.attrib:
            return cur.attrib[attr]
        cur = parents.get(cur)
    return None


def main():
    in_path, out_path = sys.argv[1], sys.argv[2]
    tree = ET.parse(in_path)
    root = tree.getroot()
    parents = {c: p for p in root.iter() for c in p}

    texts = [el for el in root.iter() if local(el.tag) == "text"]
    for el in texts:
        text = (el.text or "")
        family = resolve(el, parents, "font-family")
        font_size = float(resolve(el, parents, "font-size"))
        letter_spacing = float(el.get("letter-spacing", "0"))
        anchor = el.get("text-anchor", "start")
        x = float(el.get("x", "0"))
        y = float(el.get("y", "0"))
        fill = el.get("fill")  # own fill only; else inherit from group

        font = load_font(family)
        d, advances = glyph_run(font, text, font_size, letter_spacing)

        # Horizontal placement. text-anchor uses inter-glyph spacing only.
        total = sum(advances) + letter_spacing * (len(advances) - 1) if advances else 0
        ox = x
        if anchor == "middle":
            ox = x - total / 2
        elif anchor == "end":
            ox = x - total

        path = ET.Element(f"{{{SVG_NS}}}path")
        # The run was built at origin; offset it into place via transform so the
        # baked d stays human-diffable and the splice respects ancestor transforms.
        path.set("transform", f"translate({ox:.4f}, {y:.4f})")
        path.set("d", d)
        if fill:
            path.set("fill", fill)

        parent = parents[el]
        idx = list(parent).index(el)
        parent.remove(el)
        parent.insert(idx, path)

    raw = ET.tostring(root, encoding="unicode")
    Path(out_path).write_text(raw + "\n")


if __name__ == "__main__":
    main()
