-- tree-view
-- https://github.com/nvim-tree/nvim-tree.lua

return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "\\", "<cmd>NvimTreeToggle<cr>" },
	},
	config = true,

	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	cond = function()
		return not vim.g.vscode
	end,
}

