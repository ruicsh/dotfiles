#!/usr/bin/env bash
set -euo pipefail

_homebrew() {
  brew update
	brew tap Homebrew/bundle
	brew bundle --verbose
	brew upgrade --greedy
}

_stow() {
  stow --dir=. --target="${HOME}" --restow 
}

main() {
  source './macos.sh' # system settings
  _homebrew # install software
  _stow # link config files
}

main
