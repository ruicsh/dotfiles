require("ruicsh.options")
require("ruicsh/keymaps")
require("ruicsh/autocmds")
require("ruicsh/commands")

vim.cmd.colorscheme("nordstone")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	ui = {
		border = "rounded",
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	change_detection = { notify = false },
	spec = {
		{ import = "ruicsh.plugins.buffers", cond = not vim.g.vscode },
		{ import = "ruicsh.plugins.coding", cond = not vim.g.vscode },
		{ import = "ruicsh.plugins.editor" },
		{ import = "ruicsh.plugins.explorer", cond = not vim.g.vscode },
		{ import = "ruicsh.plugins.git", cond = not vim.g.vscode },
		{ import = "ruicsh.plugins.lsp", cond = not vim.g.vscode },
		{ import = "ruicsh.plugins.search", cond = not vim.g.vscode },
		{ import = "ruicsh.plugins.treesitter", cond = not vim.g.vscode },
		{ import = "ruicsh.plugins.ui", cond = not vim.g.vscode },
	},
})
