#!/usr/bin/env bash
set -euo pipefail
if [ "$#" -ne 1 ]; then echo "Usage: bash scripts/install.sh /path/to/project" >&2; exit 2; fi
SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$1"; mkdir -p "$TARGET/.agents/skills" "$TARGET/docs/product"
for src in "$SOURCE"/.agents/skills/*; do
  [ -d "$src" ] || continue
  name="$(basename "$src")"
  if [ -e "$TARGET/.agents/skills/$name" ]; then echo "SKIP existing skill: $name"; else cp -R "$src" "$TARGET/.agents/skills/$name"; echo "Installed skill: $name"; fi
done
if [ ! -e "$TARGET/AGENTS.md" ]; then cp "$SOURCE/AGENTS.team.example.md" "$TARGET/AGENTS.md"; echo 'Created AGENTS.md';
elif [ ! -e "$TARGET/AGENTS.team.example.md" ]; then cp "$SOURCE/AGENTS.team.example.md" "$TARGET/AGENTS.team.example.md"; echo 'Existing AGENTS.md preserved; merge AGENTS.team.example.md manually'; fi
for src in "$SOURCE"/templates/*; do [ -f "$src" ] || continue; dst="$TARGET/docs/product/$(basename "$src")"; if [ ! -e "$dst" ]; then cp "$src" "$dst"; fi; done
echo "Done. Open $TARGET in VS Code and ask Codex to use \$build-app."
