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
				component_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,

	event = { "VimEnter" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cond = function()
		return not vim.g.vscode
	end,
}
