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
		local tint = require("tint")
		diffview.setup({
			enhanced_diff_hl = true,
			keymaps = {
				file_panel = {
					{ "n", "<cr>", actions.focus_entry, { desc = "Open and focus the diff" } },
					{ "n", "}", actions.select_next_entry, { desc = "Open the diff for the next file" } },
					{ "n", "{", actions.select_prev_entry, { desc = "Open the diff for the previous file" } },
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
					tint.disable() -- don't tint diffviews
					vim.cmd(":Barbecue hide") -- hide breadcrumbs

					local bufnr = view.buffer
					-- keymaps set only for this buffer
					vim.keymap.set("n", "<c-q>", "<cmd>DiffviewClose<cr>", { buffer = bufnr }) -- use <c-q> to close,
					vim.keymap.set("n", "cc", "<cmd>DiffviewClose<cr><cmd>vertical Git commit<cr>", { buffer = bufnr }) -- use cc to commit
				end,
				view_leave = function()
					tint.enable() -- reenable tints
					vim.cmd(":Barbecue show") -- show breadcrumbs
				end,
			},
		})
	end,

	cmd = { "DiffviewOpen" },
	cond = function()
		return not vim.g.vscode
	end,
}
