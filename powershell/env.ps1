# Environment variables (mirrors zsh/env.zsh)

if (-not $env:XDG_CONFIG_HOME) {
  $env:XDG_CONFIG_HOME = "$HOME\.config"
}

$env:EDITOR                         = 'nvim'
$env:VISUAL                         = 'nvim'
$env:BAT_CONFIG_DIR                 = Join-Path $env:XDG_CONFIG_HOME 'bat'
$env:FZF_DEFAULT_OPTS_FILE          = Join-Path $env:XDG_CONFIG_HOME 'fzf\.fzfrc'
$env:RIPGREP_CONFIG_PATH            = Join-Path $env:XDG_CONFIG_HOME 'ripgrep\.ripgreprc'
$env:OPENCODE_ENABLE_EXA            = '1'
$env:OPENCODE_EXPERIMENTAL_LSP_TOOL = 'true'
$env:CLAUDE_CONFIG_DIR              = Join-Path $env:XDG_CONFIG_HOME 'claude'

# LS_COLORS (mirrors zsh/.dircolors)
$env:LS_COLORS = 'di=38;5;110:ow=38;5;110:tw=38;5;110:st=38;5;110:ln=38;5;108:ex=38;5;73:*.app=38;5;73:*.bat=38;5;73:*.btm=38;5;73:*.cmd=38;5;73:*.com=38;5;73:*.exe=38;5;73:*.reg=38;5;73'

# fzf: the shared .fzfrc binds ctrl-y to a zsh script. FZF_DEFAULT_OPTS is
# applied after FZF_DEFAULT_OPTS_FILE, so this overrides it on Windows.
# {r} is fzf's raw placeholder (no quotes that cmd would keep).
$env:FZF_DEFAULT_OPTS = '--bind="ctrl-y:execute-silent(echo {r} | clip)+abort"'

# PATH (mirrors zsh/path.zsh)
foreach ($dir in @("$HOME\_scripts", "$HOME\.local\bin", "$HOME\.cargo\bin")) {
  if (($env:PATH -split ';') -notcontains $dir) {
    $env:PATH = "$dir;$env:PATH"
  }
}

# Nord palette for Get-ChildItem output (PowerShell 7.2+)
$PSStyle.FileInfo.Directory    = "`e[38;5;110m"
$PSStyle.FileInfo.SymbolicLink = "`e[38;5;108m"
$PSStyle.FileInfo.Executable   = "`e[38;5;73m"
