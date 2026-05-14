#!/bin/zsh
# Open the GitHub repository URL of the current tmux pane in the default web browser

set -euo pipefail

local pane_path
pane_path="$(tmux run 'echo #{pane_current_path}' 2>/dev/null)" || {
  print -u2 "Failed to get pane path"
  exit 1
}

if [[ ! -d "$pane_path" ]]; then
  print -u2 "Pane path $pane_path does not exist"
  exit 1
fi

cd "$pane_path" || {
  print -u2 "Failed to change to $pane_path"
  exit 1
}

local url
url="$(git remote get-url origin 2>/dev/null)" || {
  print -u2 "Not a git repository or no remote 'origin'"
  exit 1
}

if [[ "$url" != *github.com* ]]; then
  print -u2 "This repository is not hosted on GitHub"
  exit 1
fi

# Convert git@github.com:user/repo.git → https://github.com/user/repo
if [[ "$url" == git@* ]]; then
  url="${url#git@}"
  url="${url/://}"
  url="https://${url}"
fi

# Open based on platform
if command -v wslpath >/dev/null 2>&1; then
  cmd.exe /c start "$url"
else
  open "$url"
fi
