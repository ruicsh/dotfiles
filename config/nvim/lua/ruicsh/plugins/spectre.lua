-- search/replace
-- https://github.com/nvim-pack/nvim-spectre

return {
	"nvim-pack/nvim-spectre",
	config = function()
		vim.keymap.set("n", "<leader>sr", "<cmd>lua require('spectre').toggle()<cr>", { desc = "[S]earch [R]eplace" })
	end,

	cond = function()
		return not vim.g.vscode
	end,
}
