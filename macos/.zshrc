
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install



# SSH AGENT
. ~/.ssh-agent.plugin.zsh



# NVM
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true



# PLUGINS
source <(antibody init)
antibody bundle lukechilds/zsh-nvm
antibody bundle rupa/z
antibody bundle starcraftman/zsh-git-prompt
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle jeffreytse/zsh-vi-mode


# GIT PROMPT
ZSH_THEME_GIT_PROMPT_PREFIX="  "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_HASH_PREFIX=":"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓·%2G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{↑·%2G%}"
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg_bold[blue]%}%{⚑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[cyan]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
ZSH_THEME_GIT_PROMPT_LOCAL=" L"
ZSH_THEME_GIT_PROMPT_UPSTREAM_FRONT=" {%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_END="%{${reset_color}%}}"

PROMPT=$'\n''%F{blue}# %1~%f $(git_super_status)'$'\n''$ '



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

# z
# like normal z when used with arguments but displays an fzf prompt when used without.
unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && _z "$*" && return
    cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}



# ALIASES
alias c="code"
alias g="git"
alias l='gls --group-directories-first --color=auto -la'
alias top="htop"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias topcpu="ps aux | sort -n -r -k 3 | head -n 10"
alias topmem="ps aux | sort -n -r -k 4 | head -n 10"

# SUFFIX ALIASES
alias -s {js,jsx,ts,tsx,json,css,scss,md}=code




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




