use std/util "path add"

path add "/usr/local/bin" # Make sure user installed binaries override system's
path add "/opt/homebrew/bin" # Homebrew (macOS)
path add "/home/linuxbrew/.linuxbrew/bin" # Homebrew (linux)
path add "./node_modules/.bin" # Local node modules
path add ($nu.home-dir | path join ".scripts") # Custom scripts 
