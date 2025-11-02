#!/usr/bin/env -S nu

# Open the GitHub repository URL of the current tmux pane in the default web browser

def main [] {
    let pane_path = try {
        tmux run 'echo #{pane_current_path}' | str trim
    } catch {
        return (print "Failed to get pane path")
    }
    
    cd $pane_path
    
    let url = try {
        git remote get-url origin | str trim
    } catch {
        return (print "Not a git repository or no remote 'origin'")
    }
    
    if ($url | str contains 'github.com') {
        let final_url = if ($url | str starts-with 'git@') {
            let cleaned = ($url | str replace 'git@' '' | str replace ':' '/')
            $"https://($cleaned)"
        } else { $url }

        if (which wslpath | is-not-empty) {
          ^cmd.exe /c start $final_url
        } else {
          ^open $final_url
        }
    } else {
        print "This repository is not hosted on GitHub"
    }
}
