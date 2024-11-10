--
-- Buffers, splits and tabs management
--

return {
	{ -- delete buffer (vim-bbye)
		-- https://github.com/moll/vim-bbye
		"moll/vim-bbye",

		cmd = { "Bdelete" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- buffer auto-close (hbac.nvim)
		-- https://github.com/axkirillov/hbac.nvim
		"axkirillov/hbac.nvim",
		opts = {
			autoclose = true,
			threshold = 10,
			close_command = function(bufnr)
				vim.api.nvim_buf_delete(bufnr, {})
			end,
			close_buffers_with_windows = false,
		},

		event = { "BufReadPost", "BufNewFile" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- tab scoping (scope.nvim)
		-- https://github.com/tiagovla/scope.nvim
		"tiagovla/scope.nvim",
		opts = {},

		event = { "VimEnter" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- tabs (tabby.nvim)
		-- https://github.com/nanozuki/tabby.nvim
		"nanozuki/tabby.nvim",
		config = function()
			local theme = {
				fill = "TabLineFill",
				head = "TabLine",
				current_tab = "TabLineSel",
				tab = "TabLine",
				win = "TabLine",
				tail = "TabLine",
			}

			local tabby = require("tabby")
			tabby.setup({
				line = function(line)
					return {
						{
							{ "  ", hl = theme.head },
							line.sep("", theme.head, theme.fill),
						},
						line.tabs().foreach(function(tab)
							local hl = tab.is_current() and theme.current_tab or theme.tab
							return {
								line.sep("", hl, theme.fill),
								tab.is_current() and "" or "󰆣",
								tab.number(),
								line.sep("", hl, theme.fill),
								hl = hl,
								margin = " ",
							}
						end),
						line.spacer(),
						line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
							return {
								line.sep("", theme.win, theme.fill),
								win.is_current() and "" or "",
								win.buf_name(),
								line.sep("", theme.win, theme.fill),
								hl = theme.win,
								margin = " ",
							}
						end),
						{
							line.sep("", theme.tail, theme.fill),
							{ "  ", hl = theme.tail },
						},
						hl = theme.fill,
					}
				end,
			})
		end,

		event = { "VimEnter" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	{ -- pinned and opened buffers (vessel.nvim)
		-- https://github.com/gcmt/vessel.nvim
		-- "gcmt/vessel.nvim",
		"ruicsh/vessel.nvim",
		keys = {
			{ "§", "<plug>(VesselViewBuffers)" },
			{ "[§", "<plug>(VesselPinnedPrev)" },
			{ "]§", "<plug>(VesselPinnedNext)" },
		},
		opts = {
			create_commands = true,
			buffers = {
				view = "tree",
				mappings = {
					close = { "§" },
				},
			},
		},

		event = { "BufReadPost", "BufNewFile" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- maximize/restore windows (windows.nvim)
		-- https://github.com/anuvyklack/windows.nvim
		"anuvyklack/windows.nvim",
		keys = {
			{ "<c-w>m", "<cmd>WindowsMaximize<cr>", mode = { "n", "x", "i" }, silent = true },
		},
		opts = {
			animation = {
				enable = false,
			},
		},

		events = { "VeryLazy" },
		dependencies = {
			"anuvyklack/middleclass",
		},
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- dim inactive windows (tint.nvim)
		-- https://github.com/levouh/tint.nvim
		"levouh/tint.nvim",
		opts = {
			tint = -60,
		},

		event = { "VeryLazy" },
		cond = function()
			return not vim.g.vscode
		end,
	},
}
