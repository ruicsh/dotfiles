-- Splitting/joining blocks of code.
-- https://github.com/Wansmer/treesj

return {
	"Wansmer/treesj",
	keys = {
		{ "<leader>j", ":TSJToggle<cr>", desc = "Toggle split/join" },
	},
	opts = {
		use_default_keymaps = false,
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
