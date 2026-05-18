#!/usr/bin/env bash
# Sync the bundled reference snapshots inside each portable skill from the
# canonical files at the repository root.
#
# The charts-and-vectors and rnet-voice skills are designed to be copied into
# other projects (e.g. r-net), so they carry their own copies of the spec
# rather than pointing at repo-root files that would not exist elsewhere.
# Those copies are snapshots — run this after changing any canonical file, then
# commit the result, so an installed skill reflects the current system.
#
# Canonical files always win; this script only ever overwrites the snapshots.
set -euo pipefail
cd "$(dirname "$0")/../.."   # repo root

sync() { # sync <canonical-path> <snapshot-path>
  if ! cmp -s "$1" "$2" 2>/dev/null; then
    cp "$1" "$2"
    echo "updated  $2"
  else
    echo "current  $2"
  fi
}

sync STANDARD.md .claude/skills/charts-and-vectors/reference/STANDARD.md
sync GLYPHS.md   .claude/skills/charts-and-vectors/reference/GLYPHS.md
sync tokens.json .claude/skills/charts-and-vectors/reference/tokens.json
sync VOICE.md    .claude/skills/rnet-voice/reference/VOICE.md

echo "done — commit any 'updated' snapshots, and re-copy the skill into any"
echo "project that has installed it."
