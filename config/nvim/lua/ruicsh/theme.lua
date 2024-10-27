-- nord
-- https://github.com/shaunsingh/nord.nvim

return {
	"shaunsingh/nord.nvim",
	config = function()
		vim.g.nord_disable_background = true
		vim.g.nord_borders = true

		vim.cmd.colorscheme("nord")

		vim.api.nvim_set_hl(0, "NormalFloat", { fg = "none", bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "none", bg = "none" })
	end,
}
