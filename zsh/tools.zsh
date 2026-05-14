# Tool-specific integrations

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

# fzf (fuzzy finder) {{{
# fzf that copies the result to clipboard
f() {
  local result copy_cmd
  case "$(uname -s)" in
    Darwin)
      copy_cmd="pbcopy"
      ;;
    Linux)
      if [ -n "$WSL_DISTRO_NAME" ]; then
        copy_cmd="clip.exe"
      else
        copy_cmd="xclip -selection clipboard"
      fi
      ;;
  esac

  result="$(fzf "$@")"
  if [ -n "$result" ]; then
    printf '%s' "$result" | $copy_cmd
  fi
  printf '%s\n' "$result"
}
# }}}

# starship (prompt) {{{
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
# }}}

# vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0
