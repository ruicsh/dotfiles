-- syntax aware join lines
-- https://github.com/Wansmer/treesj

return {
	"Wansmer/treesj",
	keys = {
		{ "<space>j", "<cmd>TSJToggle<cr>", desc = "TreeSJ: [j]oin toggle" },
	},
	opts = {
		use_default_keymaps = false,
		max_join_length = 150,
	},

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
