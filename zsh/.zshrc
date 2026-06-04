# zsh/.zshrc — Primary Zsh configuration
# https://zsh.sourceforge.io/Doc/Release/Files.html

# History {{{
HISTFILE="$HOME/.histfile"
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
# }}}

# Editor & keybindings {{{
bindkey -v
export KEYTIMEOUT=1 # Reduce vi mode switch delay
# }}}

# Shell options {{{
setopt auto_cd # cd into directory by typing its name
setopt auto_pushd # Push dirs onto stack automatically
setopt pushd_ignore_dups
setopt interactive_comments
unsetopt beep
unsetopt list_beep
# }}}

# Disable the "last login" message
touch ~/.hushlogin

# fpath (ensure Homebrew zsh functions are discoverable) {{{
typeset -U fpath
if command -v brew >/dev/null 2>&1; then
  fpath=("$(brew --prefix)/share/zsh/functions" $fpath)
fi
# }}}

# Completions {{{
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select # Navigate completions with arrow keys
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case-insensitive matching
# }}}

# Load modular configs
ZSHDIR="${ZDOTDIR:-$HOME}/.config/zsh"
[ -f "$ZSHDIR/env.zsh" ] && source "$ZSHDIR/env.zsh"
[ -f "$ZSHDIR/path.zsh" ] && source "$ZSHDIR/path.zsh"
[ -f "$ZSHDIR/tools.zsh" ] && source "$ZSHDIR/tools.zsh"
[ -f "$ZSHDIR/aliases.zsh" ] && source "$ZSHDIR/aliases.zsh"

# LS_COLORS
if command -v gdircolors >/dev/null 2>&1; then
  eval "$(gdircolors -b "$ZSHDIR/.dircolors")"
elif command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b "$ZSHDIR/.dircolors")"
fi

# Tmux auto-start
[ -f "$HOME/_scripts/tmux-auto-start.sh" ] && source "$HOME/_scripts/tmux-auto-start.sh"

# vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0
