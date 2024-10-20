-- start screen
-- https://github.com/goolord/alpha-nvim

return {
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
}

