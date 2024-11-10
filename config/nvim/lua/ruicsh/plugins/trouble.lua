-- diagnostics
-- https://github.com/folke/trouble.nvim

return {
	"folke/trouble.nvim",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Trouble: Diagnostics",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Trouble: Location List",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Trouble: Quickfix List",
		},
	},
	opts = {
		focus = true,
	},

	cmd = "Trouble",
	cond = function()
		return not vim.g.vscode
	end,
}
