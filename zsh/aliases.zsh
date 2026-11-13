# Aliases and functions

# General
alias c='clear'
alias cat='bat'
alias cd='z'
alias g='git'
alias gu='gituser'
alias l='lsd -la'
alias oc='opencode'
alias py='uv run python'

# npm
alias ni='npm install'
alias nr='npm run'
alias nw='npm --workspace'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Functions
# Use the minimal config for a single file, the full config otherwise.
v() {
  if (( $# == 1 )) && [[ $1 != -* && ! -d $1 ]]; then
    NVIM_APPNAME=nvim-lite nvim "$@"
  else
    nvim "$@"
  fi
}

vi() {
  NVIM_APPNAME=vim nvim "$@"
}

vd() {
  NVIM_APPNAME=nvim-dev nvim "$@"
}

# yazi with cwd integration
y() {
  local tmp
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd "$cwd"
  fi
  rm -f -- "$tmp"
}
