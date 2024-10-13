return {
	{ -- 2char navigation
		-- https://github.com/ggandor/leap.nvim
		"ggandor/leap.nvim",
		keys = {
			{ "s", "<plug>(leap-forward)", mode = { "n", "x", "o" }, silent = true },
			{ "S", "<plug>(leap-backward)", mode = { "n", "x", "o" }, silent = true },
			{ "gs", "<plug>(leap-from-window)", mode = { "n", "x", "o" }, silent = true },
		},

		dependencies = {
			"tpope/vim-repeat",
		},
	},

	{ -- additional text objects
		-- https://github.com/wellle/targets.vim
		"wellle/targets.vim",
	},

	{ -- text objects for entire buffer
		-- https://github.com/kana/vim-textobj-entire
		"kana/vim-textobj-entire",

		dependencies = {
			"kana/vim-textobj-user",
		},
	},

	{ -- surroundings (brackets, quotes)
		-- https://github.com/tpope/vim-surround
		"tpope/vim-surround",
	},

	{ -- insert mode navigation
		-- https://github.com/tpope/vim-rsi
		"tpope/vim-rsi",
	},
}
