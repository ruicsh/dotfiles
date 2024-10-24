require("ruicsh.settings")

require("ruicsh/keymaps/leader")
require("ruicsh/keymaps/normal")
require("ruicsh/keymaps/insert")
require("ruicsh/keymaps/visual")
require("ruicsh/keymaps/terminal")
require("ruicsh/keymaps/command")
require("ruicsh/keymaps/vscode")

-- [[ Install `lazy.nvim` plugin manager ]]
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
	spec = {
		{ import = "ruicsh.plugins" },
		{ import = "ruicsh/theme" },
	},
	change_detection = { notify = false },
})
