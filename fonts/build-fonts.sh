#!/usr/bin/env bash
# Rebuilds the production webfonts in cdn/charts-and-vectors/fonts/.
#
# Outputs:
#   jetbrains-mono-nerd-{regular,medium}-min.woff2  — subset of the .ttf source
#       to ASCII + Latin-1 + common punctuation + the glyphs sanctioned in
#       ../GLYPHS.md (codepoints scraped from that file). ~23 KB/weight.
#   outfit-latin-var.woff2 / urbanist-latin-var.woff2 — Google Fonts' own
#       Latin-subset variable woff2 (weight axis 200–800), downloaded as-is.
#
# Requires fonttools + brotli. One-time setup:
#   /usr/bin/python3 -m venv .venv && .venv/bin/pip install fonttools brotli
#
set -euo pipefail
cd "$(dirname "$0")"

PY=.venv/bin/pyftsubset
OUT=../cdn/charts-and-vectors/fonts
mkdir -p "$OUT"

# --- JetBrainsMono Nerd Font: subset to the GLYPHS.md catalog ----------------
# Text coverage (the mono face is used for all code/labels/body-mono):
TEXT='U+0000-00FF,U+2010-2027,U+2030-2044,U+20AC,U+2122'
# Catalog glyphs: every U+XXXX scraped from GLYPHS.md.
CATALOG=$(grep -oE 'U\+[0-9A-Fa-f]{4,6}' ../GLYPHS.md | sort -u | tr '\n' ',' | sed 's/,$//')

for w in Regular Medium; do
  lw=$(echo "$w" | tr 'A-Z' 'a-z')
  "$PY" "JetBrainsMonoNerdFont-${w}.ttf" \
    --unicodes="${TEXT},${CATALOG}" \
    --layout-features='' --name-IDs='' --notdef-outline \
    --flavor=woff2 \
    --output-file="${OUT}/jetbrains-mono-nerd-${lw}-min.woff2"
  echo "built jetbrains-mono-nerd-${lw}-min.woff2"
done

# --- Outfit & Urbanist: Google Fonts Latin-subset variable woff2 -------------
UA='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36'
for fam in outfit:Outfit urbanist:Urbanist; do
  slug=${fam%%:*}; name=${fam##*:}
  css=$(curl -s -A "$UA" "https://fonts.googleapis.com/css2?family=${name}:wght@200..800")
  # The /* latin */ @font-face block is the Latin subset; grab its woff2 URL.
  url=$(echo "$css" | awk '/\/\* latin \*\//{p=1} p && /src: url/{print; exit}' \
        | grep -oE 'https://[^)]+\.woff2')
  curl -s "$url" -o "${OUT}/${slug}-latin-var.woff2"
  echo "downloaded ${slug}-latin-var.woff2"
done

# --- Emit the unicode-range for the -min @font-face --------------------------
# style-guide.html declares the full font + the -min subset under one family
# name; the subset @font-face carries this unicode-range so the full font is
# only fetched for off-catalog glyphs. If GLYPHS.md changes, rerun this script
# and paste the regenerated range into both -min @font-face rules.
{
  echo "unicode-range:"
  echo "  U+0000-00FF, U+2010-2027, U+2030-2044, U+20AC, U+2122,"
  grep -oE 'U\+[0-9A-Fa-f]{4,6}' ../GLYPHS.md | sort -u | tr '\n' ' ' \
    | sed 's/ $//; s/ /, /g' | fold -s -w 88 | sed 's/^/  /'
  echo ";"
} > UNICODE-RANGE.css
echo "wrote UNICODE-RANGE.css ($(grep -oE 'U\+[0-9A-Fa-f]{4,6}' ../GLYPHS.md | sort -u | wc -l | tr -d ' ') catalog codepoints)"

# --- Emit glyphs.css: name-based glyph classes -------------------------------
# Maps every sanctioned role to a `.glyph-<role>` class whose ::before renders
# the role's codepoint, so consumers reference role NAMES, never raw PUA chars
# (which don't survive editors/copy-paste reliably). Generated from GLYPHS.md;
# rerun this script whenever GLYPHS.md changes. Output is the canonical root
# glyphs.css; cdn/build.sh publishes it to the v1 channel + rnet.css bundle.
/usr/bin/python3 - ../GLYPHS.md ../glyphs.css <<'PY'
import re, sys
src = open(sys.argv[1], encoding="utf-8").read()
CATS = {"Status & Indicators","Infrastructure & Network","Location & Geography",
        "Security & System Health","Document, Comms, Contact","Content-Type Indicators",
        "Development & Code","Drafting & Navigation (Signature Category)",
        "Platform & Stack","Home Automation"}
out = ['''/* glyphs.css — JR / R—Net design system · name-based glyph classes.
   GENERATED from GLYPHS.md by fonts/build-fonts.sh — do not edit by hand.
   Rerun the build whenever GLYPHS.md changes (see fonts/UNICODE-RANGE.css).

   Reference a sanctioned glyph by ROLE NAME, never by raw PUA codepoint:

       <span class="glyph glyph-content-briefing" aria-hidden="true"></span>

   The mark is decorative — always pair it with an accessible text label.
   Color follows function (GLYPHS.md §11): set `color` on the element and the
   glyph inherits it. Requires the 'JetBrainsMono Nerd Font' @font-face
   declared in colors_and_type.css. */

.glyph,
[class^="glyph-"],
[class*=" glyph-"] {
  font-family: 'JetBrainsMono Nerd Font', monospace;
  font-weight: 400;
  font-style: normal;
  font-variant: normal;
  line-height: 1;
  display: inline-block;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}''']
row = re.compile(r"^\| `([a-z][a-z0-9-]+)` \| `U\+([0-9A-Fa-f]{4,6})` \|")
sec = re.compile(r"^#{2,3} +(?:[0-9]+\. +)?(.+?)\s*$")
n = 0
for line in src.splitlines():
    m = row.match(line)
    if m:
        out.append(f'.glyph-{m.group(1)}::before {{ content: "\\{m.group(2).lower()}"; }}'); n += 1; continue
    sm = sec.match(line)
    if sm and sm.group(1) in CATS:
        out.append(f"\n/* {sm.group(1)} */")
open(sys.argv[2], "w", encoding="utf-8").write("\n".join(out) + "\n")
sys.stderr.write(f"wrote glyphs.css ({n} role classes)\n")
PY

ls -la "$OUT"
