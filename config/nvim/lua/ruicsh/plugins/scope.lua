-- tab scoping
-- https://github.com/tiagovla/scope.nvim

return {
	"tiagovla/scope.nvim",

	event = { "VimEnter" },
	cond = function()
		return not vim.g.vscode
	end,
}
