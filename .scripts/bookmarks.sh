#!/bin/bash

BOOKMARKS_FILE="${1:-$HOME/bookmarks.csv}"

if [[ ! -f "$BOOKMARKS_FILE" ]]; then
  echo "Bookmarks file not found: $BOOKMARKS_FILE"
  exit 1
fi

# Format: "name","url"
selection=$(awk -F, '{gsub(/"/, "", $1); print $1}' "$BOOKMARKS_FILE" | fzf \
  --bind one:accept \
  --color=pointer:#88c0d0,gutter:-1,current-bg:#2e3440 \
  --cycle \
  --highlight-line \
  --layout=reverse \
  --prompt="Bookmarks> " \
  --scheme=history)

if [[ -z "$selection" ]]; then
  exit 0
fi

name=$(echo "$selection" | awk -F'•' '{print $1}' | xargs)
url=$(awk -F, -v nm="$name" '{gsub(/"/, "", $1); gsub(/"/, "", $2); if ($1 == nm) print $2}' "$BOOKMARKS_FILE")
url=$(echo "$url" | sed -E 's/^"(.*)"$/\1/')

is_windows_wsl=false
is_windows=false
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
  is_windows_wsl=true
elif [[ "$OS" == "Windows_NT" ]] || [[ -n "$WINDIR" ]] || command -v cmd.exe &> /dev/null 2>&1; then
  is_windows=true
fi

if $is_windows_wsl; then
  cmd.exe /c "pushd C:\Windows && start msedge.exe $url && popd" > /dev/null 2>&1
elif $is_windows; then
  start "$url" 2>/dev/null
else
  open "$url"
fi
