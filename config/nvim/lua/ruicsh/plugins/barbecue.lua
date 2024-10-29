-- breadcrumbs
-- https://github.com/utilyre/barbecue.nvim

local c = require("ruicsh.theme.colors")

return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	opts = {
		theme = {
			normal = { fg = c.nord4 },
			ellipsis = { fg = c.nord4 },
			separator = { fg = c.nord4 },
			dirname = { fg = c.nord4 },
		},
	},

	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
}
