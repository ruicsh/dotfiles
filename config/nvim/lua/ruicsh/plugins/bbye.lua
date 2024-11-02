-- delete buffer
-- https://github.com/moll/vim-bbye

return {
	"moll/vim-bbye",

	cmd = { "Bdelete" },
	cond = function()
		return not vim.g.vscode
	end,
}
