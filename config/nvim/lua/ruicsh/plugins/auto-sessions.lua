-- sessions
-- https://github.com/rmagatti/auto-session

return {
	"rmagatti/auto-session",
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',
	},

	lazy = false,
	cond = function()
		return not vim.g.vscode
	end,
}
