-- search/replace
-- https://github.com/nvim-pack/nvim-spectre

return {
	"nvim-pack/nvim-spectre",
	keys = {
		{
			"<leader>r",
			"<cmd>lua require('spectre').open_file_search()<cr>",
			{ desc = "[r]eplace" },
		},
	},
	opts = {},

	event = { "BufReadPost", "BufNewFile" },
	cond = function()
		return not vim.g.vscode
	end,
}
