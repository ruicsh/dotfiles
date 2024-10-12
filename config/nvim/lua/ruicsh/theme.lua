return {
	"shaunsingh/nord.nvim",
	config = function()
		vim.g.nord_disable_background = true
		vim.cmd.colorscheme("nord")
	end,

	priority = 1000,
	cond = function()
		return not vim.g.vscode
	end,
}
