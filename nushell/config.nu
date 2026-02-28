# https://www.nushell.sh/book/configuration.html

$env.config.buffer_editor = "vim"
$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"
$env.config.edit_mode = "vi"
$env.config.ls.use_ls_colors = true
$env.config.show_banner = false
$env.config.table.index_mode = "auto"
$env.config.table.mode = "none"

source "env.nu"
source "path.nu"
source "externs.nu"
source "aliases.nu"
source "theme.nu"

