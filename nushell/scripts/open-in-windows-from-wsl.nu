#!/usr/bin/env -S nu

# Open a file in Windows from WSL
# Usage: open-in-windows-from-wsl.nu <file>

def main [file?: string] {
  if ($file | is-empty) {
    print "Usage: open-in-windows-from-wsl.nu <file>"
    exit 1
  }

  # Convert WSL path to Windows path
  let win_path = $file
    | path expand
    # Drive letter /mnt/c -> c:
    | str replace -r '^/mnt/([a-zA-Z])' '$1:'
    # Change forward slashes to backslashes
    | str replace '/' '\'

  ^cmd.exe /c start '""' $win_path
}
