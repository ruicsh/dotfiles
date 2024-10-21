-- dim inactive window
-- https://github.com/levouh/tint.nvim

return {
	"levouh/tint.nvim",
	opts = {},

	cond = function()
		return not vim.g.vscode
	end,
}
