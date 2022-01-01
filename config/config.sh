#!/usr/bin/env bash

# # fzf
# "$(brew --prefix)"/opt/fzf/install --all

# git
source 'config/git/install.sh'


# vscode
source 'config/vscode/install.sh'


# zsh
source 'config/zsh/install.sh'


if test "$(uname)" = "Darwin" ; then
  # chromium
  # so that the firewall doesn't ask to block incoming connections
  codesign --force --deep --sign - /Applications/Chromium.app/Contents/MacOS/Chromium


  # iterm2
  source 'config/iterm2/install.sh'


  # rectangle
  defaults write com.knollsoft.Rectangle launchOnLogin -bool true
  defaults write com.knollsoft.Rectangle alternateDefaultShortcuts -bool true


  # wallpaper
  # set wallpaper to solid color from nord theme
  wallpaper set-solid-color 434c5e


fi