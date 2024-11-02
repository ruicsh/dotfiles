-- dim unfocused windows
-- https://github.com/miversen33/sunglasses.nvim

return {
	"miversen33/sunglasses.nvim",
	opts = {
		filter_type = "SHADE",
		filter_percent = 0.35,
	},

	event = { "UIEnter" },
	cond = function()
		return not vim.g.vscode
	end,
}
