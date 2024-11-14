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

	{ -- additional text objects (targets.vim)
		-- https://github.com/wellle/targets.vim
		"wellle/targets.vim",

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

		ft = g.ft_code,
		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- use jj to escape (better-escape.nvim)
		-- https://github.com/max397574/better-escape.nvim
		"max397574/better-escape.nvim",
		config = true,

		event = { "VimEnter" },
	},
}
