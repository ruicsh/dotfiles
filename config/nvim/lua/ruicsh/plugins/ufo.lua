-- folds
-- https://github.com/kevinhwang91/nvim-ufo

local g = require("ruicsh.globals")

return {
	"kevinhwang91/nvim-ufo",
	opts = {
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	},

	ft = g.ft_code,
	dependencies = {
		"kevinhwang91/promise-async",
	},
	cond = function()
		return not vim.g.vscode
	end,
}
