# PowerShell profile entry point
# Loads the split config from this directory, falling back to
# ~/.config/powershell when only this file is symlinked.

$PSConfigDir = $PSScriptRoot
if (-not $PSConfigDir -or -not (Test-Path (Join-Path $PSConfigDir 'env.ps1'))) {
  $configHome = if ($env:XDG_CONFIG_HOME) { $env:XDG_CONFIG_HOME } else { Join-Path $HOME '.config' }
  $PSConfigDir = Join-Path $configHome 'powershell'
}

foreach ($file in @('env.ps1', 'keymaps.ps1', 'tools.ps1', 'aliases.ps1')) {
  $path = Join-Path $PSConfigDir $file
  if (Test-Path $path) {
    . $path
  }
}
