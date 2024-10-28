-- notifications
-- https://github.com/j-hui/fidget.nvim

return {
	"j-hui/fidget.nvim",
	opts = {
		notification = {
			window = {
				winblend = 0,
			},
		},
	},

	cond = function()
		return not vim.g.vscode
	end,
}
