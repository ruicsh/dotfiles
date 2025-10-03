mkdir $"($nu.cache-dir)"

# Carapace (completions)
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"
