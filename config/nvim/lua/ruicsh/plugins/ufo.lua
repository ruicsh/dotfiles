-- folds
-- https://github.com/kevinhwang91/nvim-ufo

return {
	"kevinhwang91/nvim-ufo",
	opts = {
		provider_selector = function()
			return { "treesitter", "indent" }
		end,
	},
	init = function()
		vim.o.foldcolumn = "0" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,

	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = "BufReadPost",
	cond = function()
		return not vim.g.vscode
	end,
}
