-- annotations context of the end of that AST node
-- https://github.com/code-biscuits/nvim-biscuits

local g = require("ruicsh.globals")

return {
	"code-biscuits/nvim-biscuits",
	opts = {
		cursor_line_only = true,
	},

	ft = g.ft_code,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	cond = function()
		return not vim.g.vscode
	end,
}
