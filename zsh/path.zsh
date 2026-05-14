# PATH configuration

typeset -U path
path=(
  /usr/local/bin
  /opt/homebrew/bin
  /home/linuxbrew/.linuxbrew/bin
  ./node_modules/.bin
  "$HOME/_scripts"
  "$HOME/.local/bin"
  $path
)
export PATH
