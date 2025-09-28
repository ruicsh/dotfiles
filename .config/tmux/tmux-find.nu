#!/usr/bin/env nu
source ~/.config/nushell/config.nu

# List directories in ~/code,  let user select one with fzf, 
# and open a new tmux window in that directory

let dirs = ls ~/code | where type == "dir" | select name
let choices = $dirs | each {|row| {name: ($row.name | path basename), path: $row.name}}
let selected_name = ($choices | get name | to text | fzf)
let selected_path = ($choices | where name == $selected_name | get path)

if ($selected_path == null or $selected_path == "") {
    exit 0
}

let tmux_name = ($selected_name | str replace '.' '_')
tmux new-window -S -n $tmux_name -c ($selected_path | first)
