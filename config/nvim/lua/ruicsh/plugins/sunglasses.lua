return {
	"miversen33/sunglasses.nvim",
	opts = {
		filter_type = "SHADE",
		filter_percent = 0.35,
	},

	cond = function()
		return not vim.g.vscode
	end,
}
