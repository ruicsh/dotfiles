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
			vim.o.foldcolumn = "0" -- '0' is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,

		dependencies = {
			"kevinhwang91/promise-async",
		},
		event = "BufReadPost",
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- tabs
		-- https://github.com/akinsho/bufferline.nvim
		"akinsho/bufferline.nvim",
		config = function()
			local bufferline = require("bufferline")
			local colors = require("nord.colors")
			local highlights = require("nord").bufferline.highlights({
				bg = colors.nord0_gui,
				bold = true,
				buffer_bg = colors.nord0_gui,
				buffer_bg_selected = "none",
				buffer_bg_visible = "#2A2F3A",
				fill = "none",
				indicator = colors.nord9_gui,
				italic = true,
			})
			bufferline.setup({
				highlights = highlights,
				options = {
					enforce_regular_tabs = true,
					show_buffer_close_icons = false,
				},
			})
		end,

		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
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
}
