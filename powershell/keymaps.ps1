# Line editing and keymaps

# EditMode resets PSReadLine key bindings, so it must run before tools.ps1
# (PSFzf, atuin) and before the Set-PSReadLineKeyHandler calls below.
Set-PSReadLineOption -EditMode Vi -BellStyle None
if ((Get-Module PSReadLine).Version -ge [version]'2.2.0') {
  Set-PSReadLineOption -ViModeIndicator Cursor
}

# Keymaps
Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit

# Ctrl+[ is Escape on Unix, but Windows reports it as Ctrl+Oem4 (US layout),
# so PSReadLine needs an explicit binding to enter Vi command mode.
Set-PSReadLineKeyHandler -Chord Ctrl+Oem4 -Function ViCommandMode

# Keep Ctrl+[ from printing "^[" when already in command mode
Set-PSReadLineKeyHandler -Chord Ctrl+Oem4 -Function Abort -ViMode Command

# Optional:
# Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView
# Set-PSReadLineKeyHandler -Chord 'Shift+Enter' -Function AddLine
