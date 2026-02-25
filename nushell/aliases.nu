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

# Open a session in opencode if there's only one match, otherwise list the sessions
def "oc s" [pattern: string = " "] { 
  let results = (opencode session list | lines | where { |it| ($it | str downcase) =~ ($pattern | str downcase) })
  
  if ($results | length) == 1 {
    let session_id = ($results | first | split row ' ' | first)
    opencode -s $session_id
  } else {
    $results | str join "\n" | from tsv | table -e
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
