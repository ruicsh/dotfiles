#!/usr/bin/env -S nu

# Open the GitHub repository URL of the current tmux pane in the default web browser

let pane_path = (tmux run 'echo #{pane_start_path}' | str trim)
cd $pane_path

let url = (git remote get-url origin | str trim)

if ($url | str contains 'github.com') {
    if ($url | str starts-with 'git@') {
        let cleaned = ($url | str replace 'git@' '' | str replace ':' '/')
        let url = $"https://($cleaned)"
        ^open $url
    } else {
        ^open $url
    }
} else {
    print "This repository is not hosted on GitHub"
}
