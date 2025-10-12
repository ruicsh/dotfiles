use std/util "path add"

let HOME_DIR = if ($env.HOME? | is-empty) { $env.USERPROFILE } else { $env.HOME }

# Nushell config {{{

$env.config.buffer_editor = "nvim"
$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"
$env.config.edit_mode = "vi"
$env.config.ls.use_ls_colors = true
$env.config.show_banner = false
$env.config.table.index_mode = "auto"
$env.config.table.mode = "none"

# }}}

# Environment variables {{{
$env.EDITOR = "vim"
$env.SHELL = "nu"
$env.MANPAGER = "nvim +Man!" # Use nvim for reading manpages
$env.XDG_CONFIG_HOME = $"($HOME_DIR)/.config" # XDG base directory for config files
# }}}

# PATH {{{
path add "/usr/local/bin" # Make sure user installed binaries override system's
path add "/opt/homebrew/bin" # Homebrew (macOS)
path add "/home/linuxbrew/.linuxbrew/bin" # Homebrew (linux)
path add ($nu.config-path | path dirname | path join "scripts") # Custom scripts
# }}}

# 3rd party commands {{{

# Bat {{{
$env.BAT_CONFIG_DIR = $"($HOME_DIR)/.config/bat"
# }}}

# Carapace {{{
source $"($nu.cache-dir)/carapace.nu"
# }}}

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
$env.EZA_CONFIG_DIR = $"($HOME_DIR)/.config/eza"

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
$env.FZF_DEFAULT_OPTS_FILE = $"($HOME_DIR)/.config/fzf/.fzfrc"

# fzf that copies the result to clipboard
def f [ ...args ] {
  let copy_cmd = if $nu.os-info.name == "windows" {
    "clip"
  } else if $nu.os-info.name == "linux" {
    "xclip -selection clipboard"
  } else {
    "pbcopy"
  }

  let result = ^fzf ...$args

  if $nu.os-info.name == "windows" {
    $result | clip
  } else if $nu.os-info.name == "linux" {
    $result | xclip -selection clipboard
  } else {
    $result | pbcopy
  }

  $result
}
# }}}

# oculante {{{
if $nu.os-info.name == "macos" {
  path add "/Applications/Oculante.app/Contents/MacOS" # macOS
}
# }}}
# ripgrep {{{
$env.RIPGREP_CONFIG_PATH = $"($HOME_DIR)/.config/ripgrep/.ripgreprc"
# }}}

# Starship  {{{
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

# yazi {{{
# File detection
$env.YAZI_FILE_ONE = if $nu.os-info.name == "windows" and ($"($env.PROGRAMFILES)\\Git\\usr\\bin\\file.exe" | path exists) {
  $"($env.PROGRAMFILES)\\Git\\usr\\bin\\file.exe"
} else {
  "file"
}
# }}}

# zoxide {{{
source $"($nu.cache-dir)/zoxide.nu"
# }}}

# }}}

# Aliases {{{
alias cat = bat
alias c = clear
alias cd = z
alias g = git
alias ls = ls -a # always show hidden files
alias nrt = npm run test
alias v = nvim
alias vi = vim
alias y = yazi
# }}}

# Theme {{{
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_INDICATOR_VI_INSERT = "" 

$env.LS_COLORS = (
  open ($nu.config-path | path dirname | path join ".dircolors")
    | lines
    | each { |l| $l | str trim }
    | where { |l| $l != "" and not ($l =~ '^#') and not ($l =~ '^(COLOR|TERM)') }
    | each { |l|
        let parts = $l | split row ' ' | where { |p| $p != "" };
        if ($parts | length) >= 2 {
          $"($parts.0)=($parts.1)"
        } else {
          null
        }
      }
    | compact
    | str join ':'
)

source theme-nord-alt.nu
# }}}

# vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0
