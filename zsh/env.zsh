# Environment variables

export EDITOR="env NVIM_APPNAME=vim nvim"
export MANPAGER="env NVIM_APPNAME=vim nvim +Man!"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Browser selection
case "$(uname -s)" in
  Darwin)
    export BROWSER="open"
    ;;
  Linux)
    if [ -n "$WSL_DISTRO_NAME" ]; then
      export BROWSER="cmd.exe /c start"
    else
      export BROWSER="xdg-open"
    fi
    ;;
esac

# opencode
export OPENCODE_ENABLE_EXA="1"
export OPENCODE_EXPERIMENTAL_LSP_TOOL=true

# Tool configurations
export BAT_CONFIG_DIR="$HOME/.config/bat"
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/.fzfrc"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
export STARSHIP_SHELL="zsh"

# YAZI_FILE_ONE
case "$(uname -s)" in
  Linux)
    if [ -n "$WSL_DISTRO_NAME" ] && [ -f "/mnt/c/Program Files/Git/usr/bin/file.exe" ]; then
      export YAZI_FILE_ONE="/mnt/c/Program Files/Git/usr/bin/file.exe"
    else
      export YAZI_FILE_ONE="file"
    fi
    ;;
  *)
    export YAZI_FILE_ONE="file"
    ;;
esac

