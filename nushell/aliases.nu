alias c = clear
alias cat = bat
alias cd = z
alias g = git
alias l = lsd -la
alias nrt = npm run test
alias v = nvim
alias y = yazi

# Use `vi` to open nvim with the vim configuration
def vi [ ...args ] { with-env { NVIM_APPNAME: "vim" } { nvim ...$args } }
# }}}
