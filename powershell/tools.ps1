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
  carapace _carapace powershell | Out-String | Invoke-Expression

  # PowerShell doesn't expand aliases before native completers run, so carapace
  # would look for a `g` completer. Parse the line as `git ...` and reuse the
  # git completer (e.g. `g sw <tab>` -> branches).
  if (Get-Variable _carapace_completer -ErrorAction SilentlyContinue) {
    Register-ArgumentCompleter -Native -CommandName g -ScriptBlock {
      param($wordToComplete, $commandAst, $cursorPosition)

      $alias = 'g'
      $target = 'git'
      $text = $target + $commandAst.Extent.Text.Substring($alias.Length)
      $tokens = $null
      $errors = $null
      $parsed = [System.Management.Automation.Language.Parser]::ParseInput($text, [ref]$tokens, [ref]$errors)
      $command = $parsed.Find({ $args[0] -is [System.Management.Automation.Language.CommandAst] }, $true)

      & $_carapace_completer $wordToComplete $command ($cursorPosition + $target.Length - $alias.Length)
    }
  }
}

# zoxide (smart cd)
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
  zoxide init powershell --cmd cd | Out-String | Invoke-Expression
}

# starship (prompt)
if (Get-Command starship -ErrorAction SilentlyContinue) {
  starship init powershell | Out-String | Invoke-Expression
}
