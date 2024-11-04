-- project management
-- https://github.com/ahmedkhalf/project.nvim

return {
	"ahmedkhalf/project.nvim",
	opts = {},

	main = "project_nvim",
	event = { "VeryLazy" },
	cond = function()
		return not vim.g.vscode
	end,
}
