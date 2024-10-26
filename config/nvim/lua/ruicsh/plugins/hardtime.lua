-- quit bad habit
-- https://github.com/m4xshen/hardtime.nvim

return {
	"m4xshen/hardtime.nvim",
	opts = {
		notification = false,
		force_exit_insert_mode = true,
		max_insert_idle_ms = 10000,
	},

	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
}
