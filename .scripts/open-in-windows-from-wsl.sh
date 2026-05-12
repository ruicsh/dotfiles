#!/bin/zsh
# Open a file in Windows from WSL
# Usage: open-in-windows-from-wsl.sh <file>

set -euo pipefail

if [[ $# -eq 0 ]]; then
  print -u2 "Usage: open-in-windows-from-wsl.sh <file>"
  exit 1
fi

local win_path
win_path="$(readlink -f "$1")"
win_path="${win_path#/mnt/}"
win_path="${win_path:0:1}:${win_path:1}" # c:Users/...
win_path="${win_path//\//\\}" # c:\Users\...

cmd.exe /c start '' "$win_path"
