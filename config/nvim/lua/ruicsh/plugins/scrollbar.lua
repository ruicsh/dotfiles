-- scrollbar
-- https://github.com/petertriho/nvim-scrollbar

return {
	"petertriho/nvim-scrollbar",
	opts = {
		handlers = {
			cursor = true,
			diagnostic = true,
			gitsigns = true,
			handle = true,
			search = true,
			ale = false,
		},
	},

	event = { "VeryLazy" },
	cond = function()
		return not vim.g.vscode
	end,
}
