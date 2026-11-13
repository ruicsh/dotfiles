# Aliases and functions (mirrors zsh/aliases.zsh)

Set-Alias g  git

# Use the minimal config for a single file, the full config otherwise.
function v {
  if ($args.Count -eq 1 -and -not (Test-Path -LiteralPath $args[0] -PathType Container)) {
    $env:NVIM_APPNAME = 'nvim-lite'
    try { nvim @args }
    finally { Remove-Item Env:NVIM_APPNAME -ErrorAction SilentlyContinue }
  } else {
    nvim @args
  }
}
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
