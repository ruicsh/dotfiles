-- indent guides
-- https://github.com/lukas-reineke/indent-blankline.nvim

local g = require("ruicsh.globals")

return {
	"lukas-reineke/indent-blankline.nvim",
	opts = {
		scope = {
			show_start = false,
			show_end = false,
		},
	},

	main = "ibl",
	ft = g.ft_code,
	cond = function()
		return not vim.g.vscode
	end,
}
