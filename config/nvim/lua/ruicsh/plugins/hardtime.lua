-- quit bad habit
-- https://github.com/m4xshen/hardtime.nvim

return {
	"m4xshen/hardtime.nvim",
	opts = {
		notification = false,
		force_exit_insert_mode = true,
	},

	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
}
