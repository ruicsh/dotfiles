-- git client
-- https://github.com/tpope/vim-fugitive

return {
	"tpope/vim-fugitive",

	cond = function()
		return not vim.g.vscode
	end,
}

