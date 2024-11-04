-- breadcrumbs
-- https://github.com/utilyre/barbecue.nvim

local c = require("ruicsh.theme.colors")
local g = require("ruicsh.globals")

return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	opts = {
		theme = {
			normal = { fg = c.nord4_900 },
			ellipsis = { fg = c.nord4_900 },
			separator = { fg = c.nord4_900 },
			basename = { fg = c.nord4 },
			dirname = { fg = c.nord4_900 },
		},
	},

	ft = g.ft_code,
	cmd = { "Barbecue" },
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
}
