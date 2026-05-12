# PATH configuration
# Ported from nushell/path.nu

typeset -U path
path=(
  /usr/local/bin
  /opt/homebrew/bin
  /home/linuxbrew/.linuxbrew/bin
  ./node_modules/.bin
  "$HOME/.scripts"
  "$HOME/.local/bin"
  $path
)
export PATH
