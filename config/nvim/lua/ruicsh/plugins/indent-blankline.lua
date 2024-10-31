-- indent guides
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
	"lukas-reineke/indent-blankline.nvim",
	opts = {
		scope = {
			show_start = false,
			show_end = false,
		},
	},

	main = "ibl",
	cond = function()
		return not vim.g.vscode
	end,
}
