--
-- Text objects, motions and actions
--

local g = require("ruicsh.globals")

return {
	{ -- move line/selection up/down (mini.move.nvim)
		-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-move.md
		"echasnovski/mini.move",
		opts = {
			mappings = {
				down = "]e",
				up = "[e",
				line_up = "[e",
				line_down = "]e",
			},
			options = {
				reindent_linewise = true,
			},
		},

		event = { "BufReadPost", "BufNewFile" },
		version = "*",
	},

	{ -- search results labels (nvim-hlslens)
		-- https://github.com/kevinhwang91/nvim-hlslens
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup({
				nearest_only = true,
			})
			require("scrollbar.handlers.search").setup()

			local k = vim.api.nvim_set_keymap
			local kopts = { noremap = true, silent = true }

			k("n", "n", [[<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>]], kopts)
			k("n", "N", [[<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>]], kopts)
			k("n", "*", [[*<cmd>lua require('hlslens').start()<cr>]], kopts)
			k("n", "#", [[#<Cmd>lua require('hlslens').start()<cr>]], kopts)
			k("n", "g*", [[g*<cmd>lua require('hlslens').start()<cr>]], kopts)
			k("n", "g#", [[g#<cmd>lua require('hlslens').start()<cr>]], kopts)
		end,

		event = { "BufReadPost", "BufNewFile" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- text exchange operator (vim-exchange)
		-- https://github.com/tommcdo/vim-exchange
		"tommcdo/vim-exchange",

		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- repeat plugin keymaps (vim-repeat)
		-- https://github.com/tpope/vim-repeat
		"tpope/vim-repeat",

		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- insert mode navigation (vim-rsi)
		-- https://github.com/tpope/vim-rsi
		"tpope/vim-rsi",

		event = { "InsertEnter" },
	},

	{ -- sort selection (sort.nvim)
		-- https://github.com/sQVe/sort.nvim
		"sQVe/sort.nvim",
		opts = {
			delimiters = {
				",",
				"|",
				";",
				":",
				"s", -- Space
				"t", -- Tab
			},
		},

		cmd = "Sort",
	},

	{ -- search/replace (nvim-spectre)
		-- https://github.com/nvim-pack/nvim-spectre
		"nvim-pack/nvim-spectre",
		keys = {
			{
				"<leader>r",
				"<cmd>lua require('spectre').open_file_search()<cr>",
				{ desc = "[r]eplace" },
			},
		},
		opts = {},

		event = { "BufReadPost", "BufNewFile" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- surroundings (brackets, quotes) (vim-surround)
		-- https://github.com/tpope/vim-surround
		"tpope/vim-surround",

		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- additional text objects (targets.vim)
		-- https://github.com/wellle/targets.vim
		"wellle/targets.vim",

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
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- autopairs (mini.pairs.nvim)
		-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
		"echasnovski/mini.pairs",
		opts = {
			modes = { insert = true, command = false, terminal = false },

			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

				['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
				["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		},

		ft = g.ft_code,
		version = false,
		cond = function()
			return not vim.g.vscode
		end,
	},
}
