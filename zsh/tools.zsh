# Tool-specific integrations
# Ported from nushell/externs.nu

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

# oculante (image viewer)
if [[ "$(uname -s)" == "Darwin" ]]; then
  path+=(/Applications/Oculante.app/Contents/MacOS)
fi

# starship (prompt)
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
