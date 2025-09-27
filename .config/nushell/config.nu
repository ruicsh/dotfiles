use std/util "path add"

# Nushell config {{{

$env.config.buffer_editor = "nvim"
$env.config.show_banner = false

# }}}

# Environment variables {{{
$env.EDITOR = "nvim"
# }}}

# PATH {{{
path add "/usr/local/bin" # Make sure user installed binaries override system's
# }}}

# 3rd party commands {{{

# direnv {{{
$env.config = {
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
}
# }}}

# Eza {{{
def l [ ...args ] {
  ^eza ...[
    --across
    --all
    --group-directories-first
    --long
    --no-permissions
    --no-user
    --time-style=default
    ...$args
  ]
}
# }}}

# Fzf {{{
$env.FZF_DEFAULT_OPTS = "
  --bind 'ctrl-c:execute-silent(echo {+} | pbcopy)'
  --bind one:accept
  --color=current-bg:#2e3440,current-fg:#d8dee9,current-hl:#88c0d0,gutter:-1,header-fg:#81a1c1,hl:#88c0d0,info:#8c97ad,pointer:#d08770,separator:#434c5e
  --highlight-line
  --info=inline
  --layout=reverse
  --preview-window=:hidden
"
# }}}

# Starship  {{{
# https://www.nushell.sh/book/3rdpartyprompts.html#starship
$env.STARSHIP_SHELL = "nu"
def create_left_prompt [] {
  starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}
# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
# The prompt indicators are environmental variables that represent the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "
# }}}

# zoxide {{{
source ($nu.config-path | path dirname | path join '.zoxide.nu')
# }}}

# }}}

# Aliases {{{
alias c = clear
alias cd = z
alias f = fzf
alias g = git
alias t = tmux attach || tmux new
alias v = nvim
# }}}

# vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0
