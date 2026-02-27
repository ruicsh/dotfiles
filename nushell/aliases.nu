alias c = clear
alias cat = bat
alias cd = z
alias g = git
alias gu = gituser
alias l = lsd -la
alias m = mise
alias nrt = npm run test
alias nw = npm --workspace
alias oc = opencode
alias v = nvim

# Open a session in opencode
def "oc s" [] {
  let session_id = if $nu.os-info.name == "windows" {
    opencode session list | lines | to text | fzf --no-preview | str trim | split row ' ' | first
  } else {
    bash -c "opencode session list | fzf --no-preview" | str trim | split row ' ' | first
  }
  if $session_id != "" {
    opencode -s $session_id
  }
}

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
