#!/bin/bash
# sync-opencode-skills.sh — Clone agent-skills repo and symlink all skills globally
#
# Clones the addyosmani/agent-skills repo into ~/.local/share/opencode/agent-skills
# (or $SKILLS_REPO) and symlinks each skill into dotfiles/opencode/skills/.
# Since ~/.config/opencode is already symlinked -> dotfiles/opencode/, all skills
# become globally available to OpenCode in every project.
#
# Usage:
#   sync-opencode-skills.sh          # Clone (if needed), pull, and symlink
#   sync-opencode-skills.sh --no-pull  # Skip git pull, just symlink
#
# Env vars:
#   SKILLS_REPO     Override clone path (default: ~/.local/share/opencode/agent-skills)
#   SKILLS_REPO_URL Override upstream URL  (default: https://github.com/addyosmani/agent-skills.git)

set -euo pipefail

# --- Configuration ---
SKILLS_REPO="${SKILLS_REPO:-$HOME/.local/share/opencode/agent-skills}"
SKILLS_REPO_URL="${SKILLS_REPO_URL:-https://github.com/addyosmani/agent-skills.git}"
TARGET_DIR="$HOME/_code/dotfiles/opencode/skills"
SCRIPT_NAME="$(basename "$0")"

# --- Flags ---
DO_PULL=true
for arg in "$@"; do
  case "$arg" in
    --no-pull) DO_PULL=false ;;
    -h|--help)
      echo "Usage: $SCRIPT_NAME [--no-pull]"
      echo ""
      echo "Clones agent-skills repo (if missing) and symlinks all skills"
      echo "into dotfiles/opencode/skills/ for global OpenCode access."
      echo ""
      echo "  --no-pull    Skip git pull if repo already exists"
      exit 0
      ;;
    *)
      echo "Unknown option: $arg" >&2
      echo "Usage: $SCRIPT_NAME [--no-pull]" >&2
      exit 1
      ;;
  esac
done

# --- Clone or pull ---
if [ ! -d "$SKILLS_REPO" ]; then
  echo "Cloning agent-skills into $SKILLS_REPO ..." >&2
  mkdir -p "$(dirname "$SKILLS_REPO")"
  git clone "$SKILLS_REPO_URL" "$SKILLS_REPO"
elif [ "$DO_PULL" = true ]; then
  echo "Updating agent-skills ..." >&2
  git -C "$SKILLS_REPO" pull 2>/dev/null || \
    echo "git pull failed (offline?); using cached version." >&2
fi

# --- Ensure target skills directory exists ---
mkdir -p "$TARGET_DIR"

# --- Ensure .gitignore covers symlinks ---
GITIGNORE="$TARGET_DIR/.gitignore"
if [ ! -f "$GITIGNORE" ]; then
  cat > "$GITIGNORE" << 'GITIGNORE_EOF'
# Agent-skills symlinks (managed by sync-opencode-skills.sh)
# Ignore everything except local skills and this file
*
!.gitignore
!analyst/
!analyst/**
!architect/
!architect/**
GITIGNORE_EOF
  echo "  Created $GITIGNORE" >&2
fi

# --- Symlink each skill ---
created=0
already=0
skipped=0

echo "" >&2
for skill_path in "$SKILLS_REPO"/skills/*/; do
  [ -d "$skill_path" ] || continue
  skill_name="$(basename "$skill_path")"
  link_target="$TARGET_DIR/$skill_name"

  if [ -L "$link_target" ]; then
    # Already a symlink — check if it points to the right place
    if [ "$(readlink "$link_target")" = "$skill_path" ]; then
      already=$((already + 1))
    else
      ln -sf "$skill_path" "$link_target"
      echo "  Updated symlink: $skill_name" >&2
      created=$((created + 1))
    fi
  elif [ -d "$link_target" ]; then
    echo "  [SKIP] $skill_name is a real directory (local skill, not overwriting)" >&2
    skipped=$((skipped + 1))
  else
    ln -s "$skill_path" "$link_target"
    echo "  Linked: $skill_name" >&2
    created=$((created + 1))
  fi
done

echo "" >&2
echo "Done. Skills: $created linked/updated, $already already linked, $skipped skipped (local skills)." >&2
