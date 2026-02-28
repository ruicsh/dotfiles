HISTSIZE=0
HISTFILESIZE=0

export EDITOR="NVIM_APPNAME=vim nvim" # Set nvim as default editor
export SHELL=nu # Set nushell as default shell

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# Load Mise
eval "$(mise activate bash)"

# Tmux auto-start
source ~/.scripts/tmux-auto-start.sh
