#!/usr/bin/env bash

# https://stackoverflow.com/a/44549662
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s "$(which zsh)"
