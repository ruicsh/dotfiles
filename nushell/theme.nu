# https://www.nushell.sh/book/coloring_and_theming.html

$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_INDICATOR_VI_INSERT = "" 

$env.LS_COLORS = (
  open ($nu.config-path | path dirname | path join ".dircolors")
    | lines
    | each { |l| $l | str trim }
    | where { |l| $l != "" and not ($l =~ '^#') and not ($l =~ '^(COLOR|TERM)') }
    | each { |l|
        let parts = $l | split row ' ' | where { |p| $p != "" };
        if ($parts | length) >= 2 {
          $"($parts.0)=($parts.1)"
        } else {
          null
        }
      }
    | compact
    | str join ':'
)

# Retrieve the theme settings
export def main [] {
    return {
        binary: '#e5e9f0'
        block: '#d8dee9'
        cell-path: '#8fbcbb'
        closure: '#eceff4'
        custom: '#5e81ac'
        duration: '#4c566a'
        float: '#d08770'
        glob: '#5e81ac'
        int: '#e5e9f0'
        list: '#eceff4'
        nothing: '#3b4252'
        range: '#4c566a'
        record: '#eceff4'
        string: '#b7becb'

        bool: {|| if $in { '#b48ead' } else { '#4c566a' } }

        datetime: { fg: "#b7becb" }
        filesize: { fg: "#b7becb" }

        shape_and: { fg: '#e5e9f0' attr: 'b' }
        shape_binary: { fg: '#e5e9f0' attr: 'b' }
        shape_block: { fg: '#d8dee9' attr: 'b' }
        shape_bool: '#b48ead'
        shape_closure: { fg: '#eceff4' attr: 'b' }
        shape_custom: '#434c5e'
        shape_datetime: { fg: '#eceff4' attr: 'b' }
        shape_directory: '#eceff4'
        shape_external: '#eceff4'
        shape_external_resolved: '#b48ead'
        shape_externalarg: { fg: '#b7becb' attr: 'b' }
        shape_filepath: '#eceff4'
        shape_flag: { fg: '#d8dee9' attr: 'b' }
        shape_float: { fg: '#d08770' attr: 'b' }
        shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
        shape_glob_interpolation: { fg: '#eceff4' attr: 'b' }
        shape_globpattern: { fg: '#eceff4' attr: 'b' }
        shape_int: { fg: '#e5e9f0' attr: 'b' }
        shape_internalcall: { fg: '#eceff4' attr: 'b' }
        shape_keyword: { fg: '#e5e9f0' attr: 'b' }
        shape_list: { fg: '#eceff4' attr: 'b' }
        shape_literal: '#d8dee9'
        shape_match_pattern: '#434c5e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b7becb'
        shape_operator: '#4c566a'
        shape_or: { fg: '#e5e9f0' attr: 'b' }
        shape_pipe: { fg: '#e5e9f0' attr: 'b' }
        shape_range: { fg: '#4c566a' attr: 'b' }
        shape_raw_string: { fg: '#5e81ac' attr: 'b' }
        shape_record: { fg: '#eceff4' attr: 'b' }
        shape_redirection: { fg: '#e5e9f0' attr: 'b' }
        shape_signature: { fg: '#434c5e' attr: 'b' }
        shape_string: '#b7becb'
        shape_string_interpolation: { fg: '#eceff4' attr: 'b' }
        shape_table: { fg: '#d8dee9' attr: 'b' }
        shape_vardecl: { fg: '#d8dee9' attr: 'u' }
        shape_variable: '#e5e9f0'

        foreground: '#d8dee9'
        cursor: '#d8dee9'

        empty: '#d8dee9'
        header: { fg: '#b7becb' attr: 'b' }
        hints: '#4c566a'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#b7becb' attr: 'b' }
        search_result: { fg: '#3b4252' bg: '#8fbcbb' }
        separator: '#8fbcbb'
    }
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Update terminal colors
export def "update terminal" [] {
    let theme = (main)

    # Set terminal colors
    let osc_screen_foreground_color = '10;'
    let osc_screen_background_color = '11;'
    let osc_cursor_color = '12;'
        
    $"
    (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
    (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
    "
    # Line breaks above are just for source readability
    # but create extra whitespace when activating. Collapse
    # to one line and print with no-newline
    | str replace --all "\n" ''
    | print -n $"($in)\r"
}

# https://www.nushell.sh/book/line_editor.html#completion-menu
export def --env "completion menu colors" [] {
    $env.config.menus ++= [{
        name: completion_menu
        only_buffer_difference: false 
        marker: ""
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: "#d8dee9"
            selected_text: { fg: "#2e3440", bg: "#81a1c1" }
            description_text: "#8c97ad"
        }
    }]
}

# https://www.nushell.sh/book/line_editor.html#history-menu
export def --env "history menu colors" [] {
    $env.config.menus ++= [{
        name: history_menu
        only_buffer_difference: false 
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: "#d8dee9"
            selected_text: { fg: "#2e3440", bg: "#81a1c1" }
            description_text: "#8c97ad"
        }
    }]
}


export module activate {
    export-env {
        set color_config
        update terminal
        completion menu colors
        history menu colors
    }
}

# Activate the theme when sourced
use activate
