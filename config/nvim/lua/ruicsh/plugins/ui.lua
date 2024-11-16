--
-- Application furniture
--

local c = require("ruicsh.theme.colors")
local g = require("ruicsh.globals")

return {
	{ -- load env variables from a .env file (dotenv)
		-- https://github.com/ellisonleao/dotenv.nvim
		"ellisonleao/dotenv.nvim",
		config = function()
			local dotenv = require("dotenv")
			dotenv.setup()

			local init = vim.fn.expand(vim.env.MYVIMRC)
			local path = vim.uv.fs_realpath(init)
			local dir = vim.fs.dirname(path)
			local file = vim.fs.joinpath(dir, ".env")

			if vim.fn.filereadable(file) then
				vim.cmd(":Dotenv " .. file)
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
				open = { "Telescope find_files" },
			},
		},

		event = { "VimEnter" },
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
	},

	{ -- status line (lualine.nvim)
		-- https://github.com/nvim-lualine/lualine.nvim
		"nvim-lualine/lualine.nvim",
		config = function()
			local theme = require("lualine.themes.nord")
			theme.normal.c.bg = "NONE"
			theme.normal.x = { fg = c.nord3_500, bg = "NONE" }
			theme.inactive.c.bg = "NONE"

			local git_blame = require("gitblame")
			vim.g.gitblame_display_virtual_text = 0 -- disable virtual text

			local workspaces = require("workspaces")

			local lualine = require("lualine")

			lualine.setup({
				options = {
					theme = theme,
					component_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { workspaces.name },
					lualine_c = { "diagnostics", "filename" },
					lualine_x = {
						{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
					},
					lualine_y = { "diff" },
					lualine_z = { "branch" },
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
	},

	{ -- indent guides (indent-blankline.nvim)
		-- https://github.com/lukas-reineke/indent-blankline.nvim
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			scope = {
				show_start = false,
				show_end = false,
			},
		},

		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- folds (nvim-ufo)
		-- https://github.com/kevinhwang91/nvim-ufo
		"kevinhwang91/nvim-ufo",
		opts = {
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		},

		ft = g.ft_code,
		dependencies = {
			"kevinhwang91/promise-async",
		},
	},
}
