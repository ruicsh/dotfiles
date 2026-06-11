#!/bin/bash
# sync-agent-skills.sh — Sync agent-skills resources to OpenCode
#
# Syncs three types of resources from the addyosmani/agent-skills repo:
#   1. Skills   — symlinked into dotfiles/opencode/skills/
#   2. Agents   — symlinked into dotfiles/opencode/agents/
#   3. Commands — adapted copies into dotfiles/opencode/commands/
#
# Since ~/.config/opencode is already symlinked -> dotfiles/opencode/,
# all three become globally available to OpenCode in every project.
#
# Usage:
#   sync-agent-skills.sh          # Clone (if needed), pull, and sync all
#   sync-agent-skills.sh --no-pull  # Skip git pull, use cached repo
#
# Env vars:
#   SKILLS_REPO     Override clone path (default: ~/.local/share/opencode/agent-skills)
#   SKILLS_REPO_URL Override upstream URL  (default: https://github.com/addyosmani/agent-skills.git)

set -euo pipefail

# --- Configuration ---
SKILLS_REPO="${SKILLS_REPO:-$HOME/.local/share/opencode/agent-skills}"
SKILLS_REPO_URL="${SKILLS_REPO_URL:-https://github.com/addyosmani/agent-skills.git}"
DOTFILES="$HOME/_code/dotfiles/opencode"
SCRIPT_NAME="$(basename "$0")"

AGENTS_SOURCE="$SKILLS_REPO/agents"
AGENTS_TARGET="$DOTFILES/agents"

COMMANDS_SOURCE="$SKILLS_REPO/.claude/commands"
COMMANDS_TARGET="$DOTFILES/commands"

SKILLS_TARGET="$DOTFILES/skills"

# --- Flags ---
DO_PULL=true
for arg in "$@"; do
  case "$arg" in
    --no-pull) DO_PULL=false ;;
    -h|--help)
      echo "Usage: $SCRIPT_NAME [--no-pull]"
      echo ""
      echo "Clones addyosmani/agent-skills repo (if missing) and syncs all"
      echo "three resource types into dotfiles/opencode/:"
      echo ""
      echo "  Skills/   → skills/   (symlinks)"
      echo "  Agents/   → agents/   (symlinks)"
      echo "  Commands/ → commands/ (adapted copies)"
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
mkdir -p "$SKILLS_TARGET"

# --- Ensure .gitignore covers symlinks ---
GITIGNORE="$SKILLS_TARGET/.gitignore"
if [ ! -f "$GITIGNORE" ]; then
  cat > "$GITIGNORE" << 'GITIGNORE_EOF'
# Agent-skills symlinks (managed by sync-agent-skills.sh)
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
  link_target="$SKILLS_TARGET/$skill_name"

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

# --- Symlink each agent ---
a_created=0; a_already=0; a_skipped=0

echo "" >&2
echo "--- Agents ---" >&2
mkdir -p "$AGENTS_TARGET"

for agent_file in "$AGENTS_SOURCE"/*.md; do
  [ -f "$agent_file" ] || continue
  agent_name="$(basename "$agent_file")"

  # Skip documentation files that aren't agent definitions
  if [[ "$agent_name" == "README.md" ]]; then
    continue
  fi

  link_target="$AGENTS_TARGET/$agent_name"

  if [ -L "$link_target" ]; then
    if [ "$(readlink "$link_target")" = "$agent_file" ]; then
      a_already=$((a_already + 1))
    else
      ln -sf "$agent_file" "$link_target"
      echo "  Updated symlink: $agent_name" >&2
      a_created=$((a_created + 1))
    fi
  elif [ -f "$link_target" ] || [ -d "$link_target" ]; then
    echo "  [SKIP] $agent_name exists as a real file (not overwriting)" >&2
    a_skipped=$((a_skipped + 1))
  else
    ln -s "$agent_file" "$link_target"
    echo "  Linked: $agent_name" >&2
    a_created=$((a_created + 1))
  fi
done

# --- Generate adapted commands ---
c_created=0; c_already=0

echo "" >&2
echo "--- Commands ---" >&2
mkdir -p "$COMMANDS_TARGET"

for cmd_file in "$COMMANDS_SOURCE"/*.md; do
  [ -f "$cmd_file" ] || continue
  cmd_name="$(basename "$cmd_file")"
  target_file="$COMMANDS_TARGET/$cmd_name"

  # Build the sed expression based on which command this is
  case "${cmd_name%.md}" in
    build)
      sed -e 's/agent-skills://g' \
          -e 's/\$ARGUMENTS/the argument after \/build/g' \
          "$cmd_file" > "$target_file"
      ;;
    ship)
      # Note: order matters — Agent→Task happens before "without an Task" fix
      sed -e 's/agent-skills://g' \
          -e 's/Agent tool/Task tool/g' \
          -e 's/In Claude Code, each call passes/Each call passes/g' \
          -e 's/without an Task tool/without the Task tool/g' \
          -e 's/Constraints (from Claude Code'\''s subagent model):/Constraints:/g' \
          -e 's/\*\*Persona resolution\.\*\*/\*\*Agent resolution\.\*\*/g' \
          -e 's/`\.claude\/agents\/` or `~\/\.claude\/agents\/`/your OpenCode agents config/g' \
          -e 's/plugin subagents sit at the bottom of Claude Code'\''s scope priority table/user-level agents defined in opencode.json or agents\/ take precedence/g' \
          "$cmd_file" > "$target_file"
      ;;
    *)
      sed -e 's/agent-skills://g' \
          "$cmd_file" > "$target_file"
      ;;
  esac

  echo "  Generated: $cmd_name" >&2
  c_created=$((c_created + 1))
done

# --- Register new subagents ---
r_created=0; r_skipped=0
OPENCODE_JSON="$DOTFILES/opencode.json"

if [ -f "$OPENCODE_JSON" ] && command -v python3 >/dev/null 2>&1; then
  echo "" >&2
  echo "--- Registering Subagents ---" >&2
  
  # Extract existing agent keys to avoid redundant Python calls
  existing_agents=$(python3 -c 'import json, sys; data = json.load(sys.stdin); print("\n".join(data.get("agent", {}).keys()))' < "$OPENCODE_JSON" 2>/dev/null || echo "")

  for agent_file in "$AGENTS_TARGET"/*.md; do
    [ -f "$agent_file" ] || continue
    agent_filename=$(basename "$agent_file")
    [ "$agent_filename" = "README.md" ] && continue
    
    agent_id="${agent_filename%.md}"
    
    # Skip if already in opencode.json
    if echo "$existing_agents" | grep -q "^$agent_id$"; then
      continue
    fi
    
    # Extract metadata from YAML
    name=$(grep "^name:" "$agent_file" | head -1 | sed 's/name:[[:space:]]*//' | sed 's/^"//;s/"$//;s/^\x27//;s/\x27$//' || echo "")
    description=$(grep "^description:" "$agent_file" | head -1 | sed 's/description:[[:space:]]*//' | sed 's/^"//;s/"$//;s/^\x27//;s/\x27$//' || echo "")
    
    [ -z "$name" ] && name="$agent_id"
    
    echo "  Registering: $agent_id ..." >&2
    
    python3 - <<PYTHON_EOF
import json
import sys

file_path = "$OPENCODE_JSON"
agent_name = "$agent_id"
description = "$description"
model = "opencode-go/mimo-v2.5-pro"

try:
    with open(file_path, 'r') as f:
        data = json.load(f)
    
    if "agent" not in data:
        data["agent"] = {}
        
    data["agent"][agent_name] = {
        "description": description,
        "model": model,
        "mode": "subagent"
    }
    
    with open(file_path, 'w') as f:
        json.dump(data, f, indent=2, sort_keys=False)
        f.write('\n')
    sys.exit(0)
except Exception as e:
    print(f"Error: {e}", file=sys.stderr)
    sys.exit(1)
PYTHON_EOF

    if [ $? -eq 0 ]; then
      r_created=$((r_created + 1))
    else
      r_skipped=$((r_skipped + 1))
    fi
  done
fi

# --- Summary ---
echo "" >&2
echo "Done." >&2
echo "  Skills:   $created linked/updated, $already already linked, $skipped skipped (local)." >&2
echo "  Agents:   $a_created linked/updated, $a_already already linked, $a_skipped skipped." >&2
echo "  Commands: $c_created generated." >&2
[ $r_created -gt 0 ] && echo "  Reg:      $r_created new subagents registered in opencode.json." >&2
[ $r_skipped -gt 0 ] && echo "  Reg:      $r_skipped registrations failed." >&2
echo "" >&2
echo "  ⚡ Restart your OpenCode session to pick up new commands and agents." >&2
