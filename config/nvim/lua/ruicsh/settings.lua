vim.opt.backup = false -- do not create backup files
vim.opt.cursorline = true -- highlight current line
vim.opt.fillchars:append({ diff = "╱" }) -- diffview deleted lines marker
vim.opt.guifont = "JetBrainsMono Nerd Font:h10" -- font family and size
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
vim.opt.showtabline = 0 -- hide tabline
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

-- disable netrw in favor of nvim-tree/oil
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
	-- https://github.com/akinsho/toggleterm.nvim/wiki/Tips-and-Tricks#windows
	local powershell_options = {
		shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
		shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
		shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
		shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
		shellquote = "",
		shellxquote = "",
	}

	for option, value in pairs(powershell_options) do
		vim.opt[option] = value
	end
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
