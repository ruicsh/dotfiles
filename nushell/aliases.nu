alias c = clear
alias cat = bat
alias cd = z
alias g = git
alias gu = gituser
alias l = lsd -la
alias ni = npm install
alias nr = npm run
alias nw = npm --workspace
alias oc = opencode
alias py = uv run python
alias v = nvim
def vd [ ...args ] { with-env { NVIM_APPNAME: "nvim-dev" } { nvim ...$args } }

# Use `vi` to open nvim with the vim configuration
def vi [ ...args ] { with-env { NVIM_APPNAME: "vim" } { nvim ...$args } }

alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..

# yazi alias that changes directory based on yazi's output
def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}
