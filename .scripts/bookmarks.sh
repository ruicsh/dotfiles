#!/bin/bash

# Set username
USER=$(whoami)

# Detect OS
is_windows_wsl=false
is_windows=false
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
  is_windows_wsl=true
elif [[ "$OS" == "Windows_NT" ]] || [[ -n "$WINDIR" ]] || command -v cmd.exe &> /dev/null 2>&1; then
  is_windows=true
fi

# Set bookmarks file path
if $is_windows; then
  BOOKMARKS_FILE="C:/Users/$USER/AppData/Local/Microsoft/Edge/User Data/Default/Bookmarks"
elif $is_windows_wsl; then
  BOOKMARKS_FILE="/mnt/c/Users/$USER/AppData/Local/Microsoft/Edge/User Data/Default/Bookmarks"
fi

if [[ ! -f "$BOOKMARKS_FILE" ]]; then
  echo "Bookmarks file not found: $BOOKMARKS_FILE"
  exit 1
fi

# Extract bookmarks and format for fzf
bookmarks=$(jq -r '
  .roots.bookmark_bar.children[]?,
  .roots.other.children[]?,
  .roots.synced.children[]?
  | select(.type == "url") 
  | .name + "\t" + .url
' "$BOOKMARKS_FILE")

if [[ -z "$bookmarks" ]]; then
  echo "No bookmarks found in $BOOKMARKS_FILE"
  exit 1
fi

# FZF options
export FZF_DEFAULT_OPTS='
  --bind one:accept
  --color=\
current-bg:#2e3440,\
current-fg:#d8dee9,\
current-hl:#88c0d0,\
gutter:-1,\
header-fg:#81a1c1,\
hl:#88c0d0,\
info:#8c97ad,\
pointer:#d08770,\
separator:#434c5e
  --cycle
  --highlight-line
  --layout=reverse
  --prompt="Bookmarks> "
  --scheme=history'

# Use fzf to select a bookmark
url=$(echo "$bookmarks" | fzf --with-nth-1 | awk -F'\t' '{print $2}')

# Exit if no selection
if [[ -z "$url" ]]; then
  exit 0
fi

# Open the selected URL in the default web browser
if $is_windows_wsl; then
  cmd.exe /c "pushd C:\Windows && start msedge.exe $url && popd" > /dev/null 2>&1
elif $is_windows; then
  start "$url" 2>/dev/null
else
  open "$url"
fi
