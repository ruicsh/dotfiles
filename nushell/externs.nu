let HOME_DIR = if ($env.HOME? | is-empty) { $env.USERPROFILE } else { $env.HOME }

# bat (`cat` alternative) {{{
$env.BAT_CONFIG_DIR = $"($HOME_DIR)/.config/bat"
# }}}

# carapace (shell completions) {{{
source $"($nu.cache-dir)/carapace.nu"
# }}}

# fzf (fuzzy finder) {{{
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

# mise (package manager) {{{
source $"($nu.cache-dir)/mise.nu"
# }}}

# oculante (image viewer) {{{
if $nu.os-info.name == "macos" {
  path add "/Applications/Oculante.app/Contents/MacOS" # macOS
}
# }}}

# ripgrep (`grep` alternative) {{{
$env.RIPGREP_CONFIG_PATH = $"($HOME_DIR)/.config/ripgrep/.ripgreprc"
# }}}

# starship (prompt) {{{
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

# yazi (file manager) {{{
# File detection
$env.YAZI_FILE_ONE = if $nu.os-info.name == "windows" and ($"($env.PROGRAMFILES)\\Git\\usr\\bin\\file.exe" | path exists) {
  $"($env.PROGRAMFILES)\\Git\\usr\\bin\\file.exe"
} else {
  "file"
}
# }}}

# zoxide (`cd` alternative) {{{
source $"($nu.cache-dir)/zoxide.nu"
# }}}

# vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0
