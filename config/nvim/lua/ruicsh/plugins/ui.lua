return {
	{ -- start screen
		-- https://github.com/goolord/alpha-nvim
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,

		dependencies = {
			"echasnovski/mini.icons",
			"nvim-lua/plenary.nvim",
		},
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- folds
		-- https://github.com/kevinhwang91/nvim-ufo
		"kevinhwang91/nvim-ufo",
		opts = {
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		},
		init = function()
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,

		dependencies = {
			"kevinhwang91/promise-async",
		},
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- tabs
		-- https://github.com/akinsho/bufferline.nvim
		"akinsho/bufferline.nvim",
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					enforce_regular_tabs = true,
					offsets = {
						filetype = "NvimTree",
					},
					separator_style = "thick",
					show_buffer_close_icons = false,
					style_preset = {
						bufferline.style_preset.no_italic,
						bufferline.style_preset.no_bold,
					},
					themable = true,
				},
			})
		end,
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- breadcrumbs
		-- https://github.com/utilyre/barbecue.nvim
		"utilyre/barbecue.nvim",
		config = true,

		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- status line
		-- https://github.com/nvim-lualine/lualine.nvim
		"nvim-lualine/lualine.nvim",
		config = true,
		opts = {
			options = {
				theme = "nord",
			},
		},

		dependencies = { "nvim-tree/nvim-web-devicons" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- maximize the current window
		-- https://github.com/szw/vim-maximizer
		"szw/vim-maximizer",
		keys = {
			{ "<c-w>m", ":MaximizerToggle!<cr>", silent = true },
		},
		init = function()
			vim.g.maximizer_set_default_mapping = 0
		end,

		event = "VeryLazy",
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- nake the yanked region apparent
		-- https://github.com/machakann/vim-highlightedyank
		"machakann/vim-highlightedyank",
	},

	{ -- zen mode
		-- https://github.com/folke/zen-mode.nvim
		"folke/zen-mode.nvim",
		keys = {
			{ "<leader>kz", "<cmd>ZenMode<cr>" },
		},
		opts = {
			window = {
				backdrop = 1,
				width = 0.85,
			},
		},

		cmd = "ZenMode",
		cond = function()
			return not vim.g.vscode
		end,
	},
}
