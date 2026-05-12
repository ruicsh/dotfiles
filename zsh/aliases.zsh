# Aliases and functions
# Ported from nushell/aliases.nu

# General
alias c='clear'
alias cat='bat'
alias cd='z'
alias g='git'
alias gu='gituser'
alias l='lsd -la'
alias oc='opencode'
alias py='uv run python'
alias v='nvim'

# npm
alias ni='npm install'
alias nr='npm run'
alias nw='npm --workspace'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Functions
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
