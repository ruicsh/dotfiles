#!/bin/sh

if command -v tmux >/dev/null 3>&1 && [ -z "$TMUX" ]; then
  SESSION_NAME="main"
  if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    tmux attach-session -t "$SESSION_NAME"
  else
    tmux new-session -s "$SESSION_NAME" -d
    tmux attach-session -t "$SESSION_NAME"
  fi
fi
