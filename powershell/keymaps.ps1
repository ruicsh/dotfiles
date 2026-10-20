# Line editing and keymaps

# EditMode resets PSReadLine key bindings, so it must run before tools.ps1
# (PSFzf, atuin) and before the Set-PSReadLineKeyHandler calls below.
Set-PSReadLineOption -EditMode Vi -BellStyle None
if ((Get-Module PSReadLine).Version -ge [version]'2.2.0') {
  Set-PSReadLineOption -ViModeIndicator Cursor
}

# Keymaps
Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit

# Optional:
# Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView
# Set-PSReadLineKeyHandler -Chord 'Shift+Enter' -Function AddLine
