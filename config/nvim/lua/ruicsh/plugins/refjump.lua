-- jump to reference
-- https://github.com/mawkler/refjump.nvim

return {
	"mawkler/refjump.nvim",
	opts = {
		highlights = {
			enabled = false,
		},
	},

	cond = function()
		return not vim.g.vscode
	end,
}
