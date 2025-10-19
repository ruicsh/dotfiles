alias cat = bat
alias c = clear
alias cd = z
alias g = git

alias ls = lsd
alias l = ls -la
alias lt = ls --tree

alias nrt = npm run test
alias v = nvim
alias y = yazi

# Use `vi` to open nvim with the vim configuration
def vi [ ...args ] { with-env { NVIM_APPNAME: "vim" } { nvim ...$args } }
# }}}
