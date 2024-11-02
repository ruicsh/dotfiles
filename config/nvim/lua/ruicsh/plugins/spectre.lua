-- search/replace
-- https://github.com/nvim-pack/nvim-spectre

return {
	"nvim-pack/nvim-spectre",
	keys = {
		{
			"<leader>sr",
			"<cmd>lua require('spectre').open_file_search({ select_word = true })<cr>",
			{ desc = "[s]earch and [r]eplace current word" },
		},
		{
			"<leader>sr",
			"<esc><cmd>lua require('spectre').open_file_search()<cr>",
			mode = { "v" },
			{ desc = "[s]earch and [r]eplace current word" },
		},
	},
	opts = {},

	event = { "BufReadPost" },
	cond = function()
		return not vim.g.vscode
	end,
}
