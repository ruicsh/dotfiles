-- welcome screen
-- https://github.com/goolord/alpha-nvim

return {
	"goolord/alpha-nvim",
	config = function()
		local startify = require("alpha.themes.startify")
		startify.file_icons.provider = "devicons"
		startify.section.header.val = ""

		require("alpha").setup(startify.config)
	end,

	dependencies = { "nvim-tree/nvim-web-devicons" },
	cond = function()
		return not vim.g.vscode
	end,
}
