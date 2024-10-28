-- cmdline, popups ui
-- https://github.com/folke/noice.nvim

return {
	"folke/noice.nvim",
	keys = function()
		local noice = require("noice")
		local show_history = function()
			noice.cmd("pick")
		end

		return {
			{ "<leader>nn", show_history, { desc = "Noice: Show history" } },
		}
	end,
	opts = {
		notify = {
			enabled = false,
		},
		lsp = {
			progress = {
				enabled = false,
			},
		},
		presets = {
			lsp_doc_border = true,
		},
		views = {
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
	},

	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	cond = function()
		return not vim.g.vscode
	end,
}
