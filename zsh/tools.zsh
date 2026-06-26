# Tool-specific integrations

# fzf (fuzzy finder) {{{
# Source fzf key bindings (CTRL-T, CTRL-R, ALT-C)
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi
# }}}

# atuin (history search) {{{
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi
# }}}

# carapace (zsh completions) {{{
if command -v carapace >/dev/null 2>&1; then
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
  eval "$(carapace _carapace zsh)"
fi
# }}}

# zoxide (smart cd) {{{
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
# }}}

# starship (prompt) {{{
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
# }}}

# vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0
