vim.opt.backup = false -- do not create backup files
vim.opt.cursorline = true -- highlight current line
vim.opt.guifont = "JetBrainsMono Nerd Font:h12" -- font family and size
vim.opt.ignorecase = true -- ignore case on search patterns
vim.opt.inccommand = "nosplit" -- show live preview of substitution
vim.opt.linespace = 4 -- line height
vim.opt.mouse = "a" -- enable mouse support
vim.opt.number = true -- show line numbers
vim.opt.numberwidth = 5 -- more space on the gutter column
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.scrolloff = 10 -- number of lines to keep above and below the cursor
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
vim.opt.smartcase = true -- use case sensitive if keyword contains capital letters
vim.opt.smartindent = true -- smart indent
vim.opt.softtabstop = 2 -- number of spaces that a <Tab> key in the file counts for
vim.opt.splitbelow = true -- open a new horizontal split below
vim.opt.splitright = true -- open a new vertical split to the right
vim.opt.swapfile = false -- stop creating swp files
vim.opt.tabstop = 2 -- number of spaces that a <Tab> in the file counts for
vim.opt.termguicolors = true -- enable true colors
vim.opt.updatetime = 250 -- time in milliseconds to wait for CursorHold event
vim.opt.wrap = false -- do not automatically wrap text

-- disable netrw in favor of oil
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- clipboard (so that yank goes to OS clipboard)
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- [[ VSCODE ]]
if vim.g.vscode then
	-- https://stackoverflow.com/questions/78611905/turn-off-neovim-messages-in-vscode
	vim.opt.cmdheight = 1
end

-- [[ WINDOWS ]]
local OS = vim.uv.os_uname().sysname
if OS:find("Windows") then
	vim.o.shell = "powershell.exe"
end

-- [[ NEOVIDE ]]
if vim.g.neovide then
	-- turn off all animations
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_scroll_animation_length = 0.00
end
