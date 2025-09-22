#!/bin/bash

BOOKMARKS_FILE="${1:-$HOME/bookmarks.csv}"

if [[ ! -f "$BOOKMARKS_FILE" ]]; then
  echo "Bookmarks file not found: $BOOKMARKS_FILE"
  exit 1
fi

# Format: "shortcut","name","url"
binds=$(awk -F, '{gsub(/"/, "", $1); print "ctrl-" $1 ":execute-silent(open " $3 ")"}' "$BOOKMARKS_FILE" | paste -sd, -)
selection=$(awk -F, '{gsub(/"/, "", $1); gsub(/"/, "", $2); print $1 " • " $2}' "$BOOKMARKS_FILE" | fzf \
  --bind "$binds" \
  --bind one:accept \
  --bind space:jump,jump:accept \
  --color=pointer:#88c0d0,gutter:-1,current-bg:#2e3440 \
  --cycle \
  --highlight-line \
  --jump-labels=asdf \
  --prompt="Bookmarks> " \
  --scheme=history)

if [[ -z "$selection" ]]; then
  exit 0
fi

shortcut=$(echo "$selection" | awk -F'•' '{print $1}' | xargs)
url=$(awk -F, -v sc="$shortcut" '{gsub(/"/, "", $1); gsub(/"/, "", $3); if ($1 == sc) print $3}' "$BOOKMARKS_FILE")
url=$(echo "$url" | sed -E 's/^"(.*)"$/\1/')

open "$url"
