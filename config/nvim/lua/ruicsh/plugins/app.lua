--
-- Application furniture
--

local c = require("ruicsh.theme.colors")

return {
	{ -- sessions (auto-session)
		-- https://github.com/rmagatti/auto-session
		"rmagatti/auto-session",
		opts = {},

		event = { "VimEnter" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- load env variables from a .env file (dotenv)
		-- https://github.com/ellisonleao/dotenv.nvim
		"ellisonleao/dotenv.nvim",
		config = function()
			local dotenv = require("dotenv")
			dotenv.setup()

			local init_file = vim.uv.fs_realpath(vim.fn.expand("~/.config/nvim/init.lua"))
			local path = vim.fs.dirname(init_file)
			local dotenv_file = vim.fs.joinpath(path, ".env")

			if vim.fn.filereadable(dotenv_file) then
				vim.cmd(":Dotenv " .. dotenv_file)
			end
		end,

		event = { "VimEnter" },
	},

	{ -- notifications (fidget.nvim)
		-- https://github.com/j-hui/fidget.nvim
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				override_vim_notify = true,
				window = {
					winblend = 0,
				},
			},
		},

		event = { "VeryLazy" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- breadcrumbs (barbecue.nvim)
		-- https://github.com/utilyre/barbecue.nvim
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

		cmd = { "Barbecue" },
		event = { "BufReadPost", "BufNewFile" },
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{ -- scrollbar (nvim-scrollbar)
		-- https://github.com/petertriho/nvim-scrollbar
		"petertriho/nvim-scrollbar",
		opts = {
			handlers = {
				cursor = true,
				diagnostic = true,
				gitsigns = true,
				handle = true,
				search = true,
				ale = false,
			},
		},

		event = { "VeryLazy" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- shortcuts cheatsheet (which-key.nvim)
		-- https://github.com/folke/which-key.nvim
		"folke/which-key.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},

		event = { "VeryLazy" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- command line (wilder.nvim)
		-- https://github.com/gelguy/wilder.nvim
		"gelguy/wilder.nvim",
		config = function()
			local wilder = require("wilder")
			wilder.setup({
				modes = { ":", "/", "?" },
			})
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
					border = "rounded",
					highlighter = wilder.basic_highlighter(),
					max_height = "50%",
					min_height = 0,
					prompt_position = "bottom",
					reverse = 1,
				}))
			)
		end,

		event = { "VeryLazy" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- workspaces (workspaces.nvim)
		-- https://github.com/natecraddock/workspaces.nvim
		"natecraddock/workspaces.nvim",
		keys = {
			{ "<leader>pp", "<cmd>Telescope workspaces<cr>", { desc = "Workspaces: List" } },
		},
		opts = {
			cd_type = "tab",
			auto_open = true,
			hooks = {
				open_pre = "SessionSave",
				open = "SessionRestore",
			},
		},

		event = { "VimEnter" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- terminal (toggleterm.nvim)
		-- https://github.com/akinsho/toggleterm.nvim
		"akinsho/toggleterm.nvim",
		opts = {
			open_mapping = "<c-t>",
			direction = "float",
		},

		event = { "VeryLazy" },
		version = "*",
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- status line (lualine.nvim)
		-- https://github.com/nvim-lualine/lualine.nvim
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
	},

	{ -- auto-save (auto-save.nvim)
		-- https://github.com/pocco81/auto-save.nvim
		"Pocco81/auto-save.nvim",
		opts = {
			enabled = true,
		},

		event = { "VeryLazy" },
		cond = function()
			return not vim.g.vscode
		end,
	},
}
