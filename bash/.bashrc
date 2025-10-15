HISTSIZE=0
HISTFILESIZE=0

export EDITOR=vim # Set vim as default editor
export SHELL=nu # Set nushell as default shell

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# Load Mise
eval "$(mise activate bash)"

# Tmux auto-start
source ~/.config/tmux/tmux-auto-start.sh
