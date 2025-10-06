if not ($nu.cache-dir | path exists) {
  mkdir $nu.cache-dir
}

# Carapace (completions)
if not ($nu.cache-dir | path join 'carapace.nu' | path exists) {
  carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
}

# zoxide (fuzzy cd)
if not ($nu.cache-dir | path join 'zoxide.nu' | path exists) {
  zoxide init nushell | save --force $"($nu.cache-dir)/zoxide.nu"
}
