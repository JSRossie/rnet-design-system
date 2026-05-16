#!/usr/bin/env bash
# Rebuilds the production webfonts in cloudflare-deploy/fonts/.
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
OUT=cloudflare-deploy/fonts
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

ls -la "$OUT"
