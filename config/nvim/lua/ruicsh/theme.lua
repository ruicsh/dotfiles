-- nord
-- https://github.com/shaunsingh/nord.nvim

return {
	"shaunsingh/nord.nvim",
	config = function()
		vim.g.nord_disable_background = true
		vim.cmd.colorscheme("nord")
	end,
}
