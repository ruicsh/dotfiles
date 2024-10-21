-- maximize window
-- https://github.com/szw/vim-maximizer

return {
	"szw/vim-maximizer",
	config = function()
		vim.keymap.set("n", "<c-w>m", "<cmd>MaximizerToggle<cr>", { desc = "[M]aximize window" })
	end,

	cond = function()
		return not vim.g.vscode
	end,
}
