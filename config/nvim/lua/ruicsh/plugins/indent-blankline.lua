-- indent guides
-- https://github.com/lukas-reineke/indent-blankline.nvim

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},

	cond = function()
		return not vim.g.vscode
	end,
}
