#!/usr/bin/env bash
set -euo pipefail

main() {
  # can't symlink the profile file
  mkdir -p "${HOME}/Library/Application Support/iTerm2/DynamicProfiles"
  cp config/iterm2/ruic.profile.json "${HOME}/Library/Application Support/iTerm2/DynamicProfiles/ruic"

  defaults write com.googlecode.iterm2 "Default Bookmark Guid" 04902148-e89d-4ca2-818d-dae26d7aa557
  defaults write com.googlecode.iterm2 PromptOnQuit 0
  defaults write com.googlecode.iterm2 QuitWhenAllWindowsClosed 1
  defaults write com.googlecode.iterm2 SUEnableAutomaticChecks 1
  defaults write com.googlecode.iterm2 "Mouse Reporting" 1
  defaults write com.googlecode.iterm2 "Mouse Reporting allow mouse wheel" 1
  # can't set the theme to minimal
}

main
