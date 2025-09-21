# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# starship prompt
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# SHELL COMPLETIONS
autoload -Uz compinit
# https://carlosbecker.com/posts/speeding-up-zsh/
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# load .envrc on entering a directory
eval "$(direnv hook zsh)"

# COMMANDS CUSTOMIZATION

# fzf
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--preview-window=:hidden
--bind 'ctrl-c:execute-silent(echo {+} | pbcopy)'
"
eval "$(fzf --zsh)"

# tab display size
tabs -2

# ALIASES
# git
alias g="git"
# ls
alias l='eza \
  --across \
  --all \
  --group-directories-first \
  --long \
  --no-permissions \
  --no-user \
  --time-style=default'
# neovim
alias v="nvim"
alias vi="nvim"
# npm
alias n='npm'
alias ni='npm install'
alias nr='npm run'
alias nu='npm uninstall'
alias nw='npm --workspace'
# opencode
alias oc='opencode'
# ps
alias topcpu="ps aux | sort -n -r -k 3 | head -n 10"
alias topmem="ps aux | sort -n -r -k 4 | head -n 10"
# python
alias p='python'
# tmux
alias t='tmux attach || tmux new'

# SUFFIX ALIASES
alias -s {js,jsx,ts,tsx,json,css,scss,md,py}=code

export EDITOR=nvim

# DIRCOLORS
export CLICOLOR=YES

# NOTHING SHOWN ON RIGHT PROMPT
RPS1=''

# make sure user installed binaries override system's
export PATH=/usr/local/bin:$PATH
# make sure node modules binaries are callable
export PATH=./node_modules/.bin:$PATH
# replace native OSX sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# use brew sqlite3
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
# add homebrew's sbin
export PATH="/usr/local/sbin:$PATH"
# add installed gnu-sed instead of system's
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
# add mason.nvim binaries
export PATH="~/.local/share/nvim/mason/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit

# node version manager
eval "$(fnm env --use-on-cd)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by `pipx` on 2024-05-24 09:53:02
export PATH="$PATH:/Users/ruic/.local/bin"

export EZA_CONFIG_DIR="$HOME/.config/eza"

# Tmux auto-start
source ~/.config/tmux/tmux-auto-start.sh

