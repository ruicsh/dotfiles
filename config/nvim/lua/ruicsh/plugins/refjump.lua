-- jump to reference
-- https://github.com/mawkler/refjump.nvim

return {
	"mawkler/refjump.nvim",
	opts = {
		highlights = {
			enabled = false,
		},
	},

	event = { "BufReadPost", "BufNewFile" },
	cond = function()
		return not vim.g.vscode
	end,
}
