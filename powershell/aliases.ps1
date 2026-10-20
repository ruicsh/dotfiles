# Aliases and functions (mirrors zsh/aliases.zsh)

Set-Alias g  git
Set-Alias v  nvim
function l  { lsd -la @args }
function oc { opencode @args }
function c  { Clear-Host }

# cat -> bat (the built-in Get-Content alias wins, so remove it first)
Remove-Item Alias:cat -Force -ErrorAction SilentlyContinue
function cat { bat @args }

# Navigation
function ..   { Set-Location .. }
function ...  { Set-Location ../.. }
function .... { Set-Location ../../.. }

# yazi with cwd integration
function y {
  $tmp = (New-TemporaryFile).FullName
  yazi @args --cwd-file="$tmp"
  $cwd = Get-Content -Path $tmp -Encoding UTF8 -ErrorAction SilentlyContinue
  if ($cwd -and $cwd -ne $PWD.Path) {
    Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
  }
  Remove-Item -Path $tmp -ErrorAction SilentlyContinue
}
