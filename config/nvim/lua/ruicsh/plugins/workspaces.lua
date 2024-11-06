-- workspaces
-- https://github.com/natecraddock/workspaces.nvim

return {
	"natecraddock/workspaces.nvim",
	keys = {
		{ "<leader>pp", "<cmd>Telescope workspaces<cr>", { desc = "Workspaces: List" } },
	},
	opts = {
		cd_type = "tab",
		auto_open = true,
		hooks = {
			open_pre = "SessionSave",
			open = "SessionRestore",
		},
	},

	event = { "VimEnter" },
	cond = function()
		return not vim.g.vscode
	end,
}
