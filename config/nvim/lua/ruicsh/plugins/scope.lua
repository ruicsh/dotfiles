-- tab scoping
-- https://github.com/tiagovla/scope.nvim

return {
	"tiagovla/scope.nvim",
	opts = {},

	event = { "VimEnter" },
	cond = function()
		return not vim.g.vscode
	end,
}
