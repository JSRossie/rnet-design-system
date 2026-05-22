#!/usr/bin/env bash
# components/rnet/build-logos.sh — regenerate the R—Net logo pack.
#
# Source of truth is src/ — the editable, font-referenced SVGs (the wordmark
# is live <text> in Outfit 600 / JetBrains Mono 500). This script produces the
# two distributable forms:
#
#   svg/  — self-contained outlined SVGs (text baked to <path> via outline-
#           text.py, using the self-hosted woff2). Render identically anywhere:
#           inline, <img>, CSS background, design-tool import, email.
#   png/  — high-res rasters of the outlined SVGs (rsvg-convert).
#
# No third-party font CDN is touched — fonts come straight from
# cdn/charts-and-vectors/fonts/, matching cdn/HOSTING.md. Fully reproducible
# offline; replaces the old browser-based Google-Fonts PNG harness.
#
# Requires: a fontTools venv and rsvg-convert (librsvg). One-time setup:
#   /usr/bin/python3 -m venv .venv && .venv/bin/pip install fonttools brotli
#   brew install librsvg
#
# Usage: components/rnet/build-logos.sh
set -euo pipefail
cd "$(dirname "$0")"                       # components/rnet/

PY="${PY:-.venv/bin/python}"
[ -x "$PY" ] || PY="../../.venv/bin/python"   # fall back to a repo-root venv
[ -x "$PY" ] || { echo "no fontTools venv; see header for setup" >&2; exit 1; }
command -v rsvg-convert >/dev/null || { echo "rsvg-convert not found (brew install librsvg)" >&2; exit 1; }

# Raster width per family — documentation-friendly, matches the pack spec.
png_width() {
  case "$1" in
    fpm-mark-*)            echo 512  ;;
    r-net-jr-stacked-*)    echo 640  ;;
    r-net-jr-horizontal-*) echo 1280 ;;
    *)                     echo 1024 ;;   # wordmark, wordmark-infrastructure
  esac
}

rm -f svg/*.svg png/*.png
n=0
for f in src/*.svg; do
  name="$(basename "$f" .svg)"
  if grep -q '<text' "$f"; then
    "$PY" outline-text.py "$f" "svg/$name.svg"
  else
    cp "$f" "svg/$name.svg"                # already path-only (fpm-mark)
  fi
  rsvg-convert -w "$(png_width "$name")" "svg/$name.svg" -o "png/$name.png"
  n=$((n + 1))
done

# Fail loud if any outlined SVG still carries live text.
if grep -lq '<text' svg/*.svg 2>/dev/null; then
  echo "ERROR: residual <text> in outlined output:" >&2
  grep -l '<text' svg/*.svg >&2
  exit 1
fi

echo "built $n logos: svg/ (outlined, self-contained) + png/ (rasterized)"
