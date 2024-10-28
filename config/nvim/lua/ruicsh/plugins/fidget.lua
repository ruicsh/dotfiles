-- notifications
-- https://github.com/j-hui/fidget.nvim

return {
	"j-hui/fidget.nvim",
	opts = {
		notification = {
			override_vim_notify = true,
			window = {
				winblend = 0,
			},
		},
	},

	cond = function()
		return not vim.g.vscode
	end,
}
