# Tool-specific integrations

# fzf: bind Ctrl+t
if (Get-Command fzf -ErrorAction SilentlyContinue) {
  Set-PSReadLineKeyHandler -Chord 'Ctrl+t' {
    $selection = fzf
    if ($selection) {
      $escapedSelection = $selection.Replace("'", "''")
      [Microsoft.PowerShell.PSConsoleReadLine]::Insert("'$escapedSelection'")
    }
  }
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
