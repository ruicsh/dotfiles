-- maximize/restore windows
-- https://github.com/anuvyklack/windows.nvim

return {
	"anuvyklack/windows.nvim",
	keys = {
		{ "<c-w>m", "<cmd>WindowsMaximize<cr>", mode = { "n", "x", "i" }, silent = true },
	},
	opts = {
		animation = {
			enable = false,
		},
	},

	dependencies = {
		"anuvyklack/middleclass",
	},
	cond = function()
		return not vim.g.vscode
	end,
}
