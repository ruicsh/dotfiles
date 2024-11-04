-- dim inactive windows
-- https://github.com/levouh/tint.nvim

return {
	"levouh/tint.nvim",
	opts = {
		saturation = 0,
	},

	event = { "VeryLazy" },
	cond = function()
		return not vim.g.vscode
	end,
}
