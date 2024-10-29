-- search/replace
-- https://github.com/nvim-pack/nvim-spectre

return {
	"nvim-pack/nvim-spectre",
	keys = {
		{
			"<leader>ss",
			"<esc><cmd>lua require('spectre').toggle()<cr>",
			{ desc = "[s]earch and replace" },
		},
		{
			"<leader>sw",
			"<cmd>lua require('spectre').open_file_search({ select_word = true })<cr>",
			{ desc = "[s]earch current [w]ord" },
		},
		{
			"<leader>sw",
			"<esc><cmd>lua require('spectre').open_file_search()<cr>",
			mode = { "v" },
			{ desc = "[s]earch current [w]ord" },
		},
	},
	opts = {},

	cond = function()
		return not vim.g.vscode
	end,
}
