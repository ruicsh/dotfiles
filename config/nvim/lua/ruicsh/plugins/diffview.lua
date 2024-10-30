-- diffview
-- https://github.com/sindrets/diffview.nvim

return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>df", "<cmd>DiffviewOpen<cr>", { desc = "Git: Open [d]iffview" } },
	},
	config = function()
		local diffview = require("diffview")
		local actions = require("diffview.actions")
		diffview.setup({
			enhanced_diff_hl = true,
			keymaps = {
				file_panel = {
					{
						"n",
						"{",
						actions.select_next_entry,
						{ desc = "Open the diff for the next file" },
					},
					{
						"n",
						"}",
						actions.select_prev_entry,
						{ desc = "Open the diff for the previous file" },
					},
				},
			},
			hooks = {
				diff_buf_win_enter = function()
					vim.wo.cursorline = false -- disable cursorline
					vim.opt_local.foldenable = false -- disable folding
				end,
				diff_buf_win_leave = function()
					vim.wo.cursorline = true -- enable cursorline
					vim.opt_local.foldenable = true -- enable folding
				end,
				view_enter = function(view)
					vim.cmd(":SunglassesDisable") -- unshade all windows
					vim.cmd(":Barbecue hide") -- hide breadcrumbs

					local bufnr = view.buffer
					-- keymaps set only for this buffer
					vim.keymap.set("n", "<c-q>", "<cmd>DiffviewClose<cr>", { buffer = bufnr }) -- use <c-q> to close,
					vim.keymap.set("n", "cc", "<cmd>DiffviewClose<cr><cmd>vertical Git commit<cr>", { buffer = bufnr }) -- use cc to commit
				end,
				view_leave = function()
					vim.cmd(":SunglassesEnable") -- bring back the shades
					vim.cmd(":Barbecue show") -- show breadcrumbs
				end,
			},
		})
	end,

	cond = function()
		return not vim.g.vscode
	end,
}
