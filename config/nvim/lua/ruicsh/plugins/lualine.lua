-- status line
-- https://github.com/nvim-lualine/lualine.nvim

return {
	"nvim-lualine/lualine.nvim",
	config = true,

	dependencies = { "nvim-tree/nvim-web-devicons" },
	cond = function()
		return not vim.g.vscode
	end,
}
