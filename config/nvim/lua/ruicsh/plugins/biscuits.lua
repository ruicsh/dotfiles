-- annotations context of the end of that AST node
-- https://github.com/code-biscuits/nvim-biscuits

return {
	"code-biscuits/nvim-biscuits",
	opts = {
		cursor_line_only = true,
	},

	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	cond = function()
		return not vim.g.vscode
	end,
}
