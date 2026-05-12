#!/bin/zsh
# List directories in ~/_code, let user select one with fzf, open new tmux window

set -euo pipefail

# Find directories in ~/_code
local dirs=()
for d in "$HOME"/_code/*(/); do
  dirs+=("${d:t}:${d}")
done

if [[ ${#dirs[@]} -eq 0 ]]; then
  print "No directories found in ~/_code"
  exit 0
fi

local choice
choice="$(printf '%s\n' "${dirs[@]}" | fzf --height=100% --preview-window=:hidden --delimiter=':' --with-nth=1)"

if [[ -z "$choice" ]]; then
  exit 0
fi

local selected_path="${choice#*:}"
local tmux_name="${choice%%:*}"
tmux_name="${tmux_name//./_}"

tmux new-window -S -n "$tmux_name" -c "$selected_path"
