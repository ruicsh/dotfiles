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

	{ -- indentation guides
		-- https://github.com/lukas-reineke/indent-blankline.nvim
		"lukas-reineke/indent-blankline.nvim",
		-- optional `vim.uv` typings
		-- See `:help ibl`
		opts = {
			whitespace = { highlight = { "Whitespace", "Normal" } },
		},

		main = "ibl",
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

	{ -- scrollbar
		-- https://github.com/petertriho/nvim-scrollbar
		"petertriho/nvim-scrollbar",
		config = true,

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

	{ -- status bar
		-- https://github.com/nvim-lualine/lualine.nvim
		"nvim-lualine/lualine.nvim",
		config = true,
		opts = {
			options = {
				theme = "auto",
			},
		},

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
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

	{ -- search/replace
		-- https://github.com/nvim-pack/nvim-spectre
		"nvim-pack/nvim-spectre",
		keys = {
			{ "<leader>ss", "<cmd>lua require('spectre').toggle()<cr>", desc = "[S]pectre" },
			{
				"<leader>sw",
				"<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
				desc = "[S]earch [W]ord",
			},
			{
				"<leader>sw",
				"<cmd>lua require('foobar').open_visual()<cr>",
				mode = "v",
				desc = "[S]earch [W]ord",
			},
			{
				"<leader>sf",
				"<cmd>lua require('spectre').open_file_search({select_word=true})<cr>",
				desc = "[S]earch on [F]ile",
			},
		},

		cond = function()
			return not vim.g.vscode
		end,
	},
}
