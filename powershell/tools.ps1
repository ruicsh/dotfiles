# Tool-specific integrations

# fzf (PSFzf provides Ctrl+t/Ctrl+r; install with:
#   Install-Module PSFzf -Scope CurrentUser)
# Load before atuin so atuin keeps Ctrl+R, matching zsh's load order.
if (Get-Module -ListAvailable PSFzf) {
  Import-Module PSFzf
  Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
}

# atuin (history search)
if (Get-Command atuin -ErrorAction SilentlyContinue) {
  atuin init powershell --disable-up-arrow | Out-String | Invoke-Expression
}

# carapace (completions)
if (Get-Command carapace -ErrorAction SilentlyContinue) {
  $env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
  carapace _carapace powershell | Out-String | Invoke-Expression
}

# zoxide (smart cd)
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
  zoxide init powershell --cmd cd | Out-String | Invoke-Expression
}

# starship (prompt)
if (Get-Command starship -ErrorAction SilentlyContinue) {
  starship init powershell | Out-String | Invoke-Expression
}
