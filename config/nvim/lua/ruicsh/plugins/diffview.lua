return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Git: Open [d]iffview" } },
		{ "<c-q>", "<cmd>DiffviewClose<cr>", { desc = "Git: Close diffview" } },
	},
	opts = {
		enhanced_diff_hl = true,
		hooks = {
			diff_buf_win_enter = function()
				vim.wo.cursorline = false -- disable cursorline
				vim.opt_local.foldenable = false -- disable folding
			end,
			diff_buf_win_leave = function()
				vim.wo.cursorline = true -- enable cursorline
				vim.opt_local.foldenable = true -- enable folding
			end,
			view_enter = function()
				vim.cmd(":SunglassesDisable") -- unshade all windows
				vim.cmd(":Barbecue hide") -- hide breadcrumbs
			end,
			view_leave = function()
				vim.cmd(":SunglassesEnable") -- bring back the shades
				vim.cmd(":Barbecue show") -- show breadcrumbs
			end,
		},
	},

	cond = function()
		return not vim.g.vscode
	end,
}
