-- jump to reference
-- https://github.com/mawkler/refjump.nvim

local g = require("ruicsh.globals")

return {
	"mawkler/refjump.nvim",
	opts = {
		highlights = {
			enabled = false,
		},
	},

	ft = g.ft_code,
	event = { "BufReadPost", "BufNewFile" },
	cond = function()
		return not vim.g.vscode
	end,
}
