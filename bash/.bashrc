HISTSIZE=0
HISTFILESIZE=0

export EDITOR="nvim"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# Load Mise
eval "$(mise activate zsh)"

# Tmux auto-start
source ~/.config/tmux/tmux-auto-start.sh
