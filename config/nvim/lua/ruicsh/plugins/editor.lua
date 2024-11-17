--
-- Text objects, motions and actions
--

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

	{ -- surrounding delimiter pairs (nvim-surround)
		-- https://github.com/kylechui/nvim-surround
		"kylechui/nvim-surround",
		config = true,

		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- move by subwords in camelCase (nvim-spider)
		-- https://github.com/chrisgrieser/nvim-spider
		"chrisgrieser/nvim-spider",
		keys = {
			{ "w", "<cmd>lua require('spider').motion('w')<cr>" },
			{ "e", "<cmd>lua require('spider').motion('e')<cr>" },
			{ "b", "<cmd>lua require('spider').motion('b')<cr>" },
			{ "ge", "<cmd>lua require('spider').motion('ge')<cr>" },
		},

		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- use jj to escape (better-escape.nvim)
		-- https://github.com/max397574/better-escape.nvim
		"max397574/better-escape.nvim",
		config = true,

		event = { "VimEnter" },
	},

	{ -- various text objects (nvim-various-textobjs)
		-- https://github.com/chrisgrieser/nvim-various-textobjs
		"chrisgrieser/nvim-various-textobjs",
		opts = {
			useDefaultKeymaps = true,
		},

		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- yank history (yanky.nvim)
		-- https://github.com/gbprod/yanky.nvim
		"gbprod/yanky.nvim",
		keys = {
			{ "p", "<Plug>(YankyPutAfter)", { mode = { "n", "x" } } },
			{ "P", "<Plug>(YankyPutBefore)", { mode = { "n", "x" } } },
			{ "gp", "<Plug>(YankyGPutAfter)", { mode = { "n", "x" } } },
			{ "gP", "<Plug>(YankyGPutBefore)", { mode = { "n", "x" } } },
			{ "P", "<Plug>(YankyPutBefore)", { mode = { "n", "x" } } },
			{ "]p", "<Plug>(YankyPutIncidentAfterLinewise)", { mode = "n" } },
			{ "[p", "<Plug>(YankyPutIndentBeforeLinewise)", { mode = "n" } },

			{ "<c-p>", "<Plug>(YankyPreviousEntry)", { mode = "n" } },
			{ "<c-n>", "<Plug>(YankyNextEntry)", { mode = "n" } },
		},
		opts = {
			highlight = {
				timer = 200,
			},
		},

		event = { "BufReadPost", "BufNewFile" },
	},
}
