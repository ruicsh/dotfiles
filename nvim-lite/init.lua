-- Minimal Neovim config for quick single-file edits.
-- Loaded only through `v <file>` (NVIM_APPNAME=nvim-lite).
-- Contains just the colorscheme, syntax highlighting and shortcuts.

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.laststatus = 0
vim.cmd.colorscheme("nordstone")

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = vim.keymap.set

-- Normal mode
-- More deterministic short distance jumps
map({ "n", "x", "o" }, "{", "6gkg0")
map({ "n", "x", "o" }, "}", "6gjg0")

-- Redo
map("n", "U", "<C-R>")

-- Keep same logic from `y/c/d` on `v`
map("n", "V", "v$")
map("n", "vv", "V")

-- Paste on adjacent line
map("n", "[p", ":put!<CR>==")
map("n", "]p", ":put<CR>==")

-- Move current line up/down
map("n", "<A-j>", ":move .+1<CR>==")
map("n", "<A-k>", ":move .-2<CR>==")

-- Keep cursor in place when joining lines
map("n", "J", "mzJ`z:delmarks z<CR>")

-- Save file
map("n", "<C-S>", ":silent! update<CR>")
map("n", "q", ":quit<CR>")
map("n", "<C-Q>", ":qa!<CR>")

-- Don't store on register when changing text or deleting a character.
map("n", "C", '"_C')
map("n", "c", '"_c')
map("n", "cc", '"_cc')
map("n", "x", '"_x')
map("n", "X", '"_X')

-- Toggle fold
map("n", "<Tab>", "za")

-- Enter visual block mode
map("n", "<leader>v", "<C-V>")

-- Insert mode
map("i", "<C-S>", "<C-O>:silent! update<CR><Esc>")

-- Move current line up/down
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Visual mode
map("x", "<C-S>", ":silent! update<CR>")
map("x", "<leader>s", ":'<,'>sort<CR>")

-- Move selected lines up/down
map("x", "<A-j>", ":m '>+1<CR>gv=gv")
map("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- Keep selection when indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- Diff conflict resolution mappings
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("DiffConflictMaps", { clear = true }),
	callback = function()
		if not vim.wo.diff then
			return
		end
		local opts = { buffer = true }
		map("n", "co", ":diffget LOCAL<CR>", opts)
		map("n", "ct", ":diffget REMOTE<CR>", opts)
		map("n", "cb", ":diffget LOCAL<CR>:diffget REMOTE<CR>", opts)
		map("n", "c0", ":diffput<CR>", opts)
	end,
})
