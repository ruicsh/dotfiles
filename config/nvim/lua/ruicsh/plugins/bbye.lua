-- delete buffer
-- https://github.com/moll/vim-bbye

return {
	"moll/vim-bbye",

	cond = function()
		return not vim.g.vscode
	end,
}

