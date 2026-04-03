#!/usr/bin/env bash
set -euo pipefail

# ai-setup.sh — Unify .github/ and .claude/ skill+agent directories
# via symlinks to root-level .skills/ and .agents/.
#
# Safe to re-run: skips steps that are already done.

REPO_ROOT="$(cd "$(dirname "$0")/" && pwd)"
cd "$REPO_ROOT"

echo "=== Creating Unified Agents + Skills via Symlinks ==="
echo "REPO ROOT: $REPO_ROOT"

# ── Ensure root directories exist ──────────────────────────────────
mkdir -p .skills .agents

# ── Helper: move all files from source dir to destination dir (NO SYMLINKS FOR .GITHUB) ──────
move_existing_and_purge() {
  local source="$1"   # e.g. .github/skills
  local dest="$2"     # e.g. .skills

  if [ ! -d "$source" ] || [ -L "$source" ]; then
    return
  fi

  echo "  Moving $source/* → $dest/ ..."
  mkdir -p "$dest"
  find "$source" -mindepth 1 -maxdepth 1 | while read -r item; do
    local name
    name="$(basename "$item")"
    if [ ! -e "$dest/$name" ]; then
      mv "$item" "$dest/$name"
      echo "    ✓ Moved $name to $dest"
    else
      echo "    ✓ Skipped $name (already exists in $dest)"
    fi
  done

  rm -rf "$source"
  echo "  ~ Migration Completed ~"
  echo ""
}

# ── Helper: merge a directory's contents into the target, then symlink ──
link_dir() {
  local source="$1"   # e.g. .claude/skills
  local target="$2"   # e.g. .skills
  local rel="$3"      # relative symlink target, e.g. ../.skills

  if [ -L "$source" ]; then
    echo "  ✓ $source is already a symlink → $(readlink "$source")"
    return
  fi

  if [ -d "$source" ]; then
    echo "  Merging $source/* → $target/ (no overwrite) ..."
    # Copy contents that don't already exist in target
    rsync -a --ignore-existing "$source/" "$target/" 2>/dev/null || \
      cp -rn "$source/"* "$target/" 2>/dev/null || true
    echo "  Removing original directory $source ..."
    rm -rf "$source"
  fi

  # Ensure parent exists
  mkdir -p "$(dirname "$source")"

  echo "  Creating symlink $source → $rel"
  ln -s "$rel" "$source"
}

# ── Create symlinks ────────────────────────────────────────────────
echo ""
echo "Migrating any pre-existing Skills and Agents..."
move_existing_and_purge ".github/skills" ".skills"
move_existing_and_purge ".github/agents" ".agents"
move_existing_and_purge ".claude/skills" ".skills"
move_existing_and_purge ".claude/agents" ".agents"

echo "Setting up symlinks ..."
link_dir ".claude/skills" ".skills" "../.skills"
link_dir ".claude/agents" ".agents" "../.agents"
# Don't need to do github as github reads .claude/* symlinks funny enough

# ── Verify ─────────────────────────────────────────────────────────
echo ""
echo "=== Verification ==="
for path in .claude/skills .claude/agents; do
  if [ -L "$path" ]; then
    echo "  ✓ $path → $(readlink "$path")"
  else
    echo "  ✗ $path is NOT a symlink (something went wrong)"
  fi
done

echo ""
echo "=== Complete ==="
echo "All AI tools now read from .skills/ and .agents/ at the repo root."
echo "Maintain skills & agents in one place."
