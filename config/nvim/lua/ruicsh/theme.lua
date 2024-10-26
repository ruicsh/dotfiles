-- rasmus
-- https://github.com/kvrohit/rasmus.nvim

return {
	"kvrohit/rasmus.nvim",
	config = function()
		vim.g.rasmus_transparent = true
		vim.cmd.colorscheme("rasmus")
	end,
}
