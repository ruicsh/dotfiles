-- git client
-- https://github.com/tpope/vim-fugitive

return {
	"tpope/vim-fugitive",

	cmd = "Git",
	cond = function()
		return not vim.g.vscode
	end,
}
