-- status line
-- https://github.com/nvim-lualine/lualine.nvim

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local c = require("ruicsh.theme.colors")
		local theme = require("lualine.themes.nord")
		theme.normal.c.bg = "NONE"
		theme.normal.x = { fg = c.nord3_500, bg = "NONE" }
		theme.inactive.c.bg = "NONE"

		local git_blame = require("gitblame")
		vim.g.gitblame_display_virtual_text = 0 -- disable virtual text

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
				lualine_x = {
					{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
				},
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
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
