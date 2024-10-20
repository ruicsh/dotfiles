-- 2char navigation
-- https://github.com/ggandor/leap.nvim

return {
	"ggandor/leap.nvim",
	keys = {
		{ "s", "<plug>(leap-forward)", mode = { "n", "x", "o" }, silent = true },
		{ "S", "<plug>(leap-backward)", mode = { "n", "x", "o" }, silent = true },
		{ "gs", "<plug>(leap-from-window)", mode = { "n", "x", "o" }, silent = true },
	},

	dependencies = {
		"tpope/vim-repeat",
	},
}

