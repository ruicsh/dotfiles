let HOME_DIR = if ($env.HOME? | is-empty) { $env.USERPROFILE } else { $env.HOME }

$env.EDITOR = "vim"
$env.SHELL = "nu"
$env.MANPAGER = "env NVIM_APPNAME=vim nvim +Man!" # Use nvim for reading manpages
$env.XDG_CONFIG_HOME = $"($HOME_DIR)/.config" # XDG base directory for config files
$env.BROWSER = if $nu.os-info.name == "windows" or ($env.WSL_DISTRO_NAME? | is-not-empty) {
  "cmd.exe /c start"
} else if $nu.os-info.name == "macos" {
  "open"
} else {
  "xdg-open"
}

if not ($nu.cache-dir | path exists) {
  mkdir $nu.cache-dir
}

# mise (package manager)
if not ($nu.cache-dir | path join 'mise.nu' | path exists) {
  mise activate nu | save --force $"($nu.cache-dir)/mise.nu"
}

# atuin (history)
if not ($nu.cache-dir | path join 'atuin.nu' | path exists) {
  atuin init nu | save --force $"($nu.cache-dir)/atuin.nu"
}

# carapace (completions)
if not ($nu.cache-dir | path join 'carapace.nu' | path exists) {
  carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
}

# zoxide (fuzzy cd)
if not ($nu.cache-dir | path join 'zoxide.nu' | path exists) {
  zoxide init nushell | save --force $"($nu.cache-dir)/zoxide.nu"
}
