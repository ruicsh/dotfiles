-- sessions
-- https://github.com/rmagatti/auto-session

return {
	"rmagatti/auto-session",
	opts = {},

	event = { "VimEnter" },
	cond = function()
		return not vim.g.vscode
	end,
}
