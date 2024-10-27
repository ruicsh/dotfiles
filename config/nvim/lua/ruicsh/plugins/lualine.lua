-- status line
-- https://github.com/nvim-lualine/lualine.nvim

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local theme = require("lualine.themes.nord")
		theme.normal.c.bg = "NONE"
		theme.inactive.c.bg = "NONE"

		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = theme,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,

	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cond = function()
		return not vim.g.vscode
	end,
}
