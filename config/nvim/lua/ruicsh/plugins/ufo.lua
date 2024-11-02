-- folds
-- https://github.com/kevinhwang91/nvim-ufo

return {
	"kevinhwang91/nvim-ufo",
	opts = {
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	},

	event = { "BufReadPost" },
	dependencies = {
		"kevinhwang91/promise-async",
	},
	cond = function()
		return not vim.g.vscode
	end,
}
