# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# Disable the "last login" message
touch ~/.hushlogin

export EDITOR=vim # Set vim as default editor
export SHELL=nu # Set nushell as default shell

# Load Mise
eval "$(mise activate zsh)"

# Tmux auto-start
source ~/.config/tmux/tmux-auto-start.sh

