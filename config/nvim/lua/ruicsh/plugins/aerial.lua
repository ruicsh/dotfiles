-- lsp symbols navigation
-- https://github.com/stevearc/aerial.nvim

return {
	"stevearc/aerial.nvim",
	opts = {
		on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr, desc = "Jump to previous symbol" })
			vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr, desc = "Jump to next symbol" })
		end,
		highlight_on_jump = false,
	},

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	cond = function()
		return not vim.g.vscode
	end,
}
