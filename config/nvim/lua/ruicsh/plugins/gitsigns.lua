-- gutter signs
-- https://github.com/lewis6991/gitsigns.nvim

return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "Git: Jump to next [c]hange" })

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "Git: Jump to previous [c]hange" })

			-- Actions
			map("n", "<leader>ds", gitsigns.stage_hunk, { desc = "Git: [s]tage hunk" })
			map("n", "<leader>dr", gitsigns.reset_hunk, { desc = "Git: [r]eset hunk" })
			map("v", "<leader>ds", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git: [s]tage hunk" })
			map("v", "<leader>dr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git: [r]eset hunk" })
			map("n", "<leader>dS", gitsigns.stage_buffer, { desc = "Git: [S]tage file" })
			map("n", "<leader>du", gitsigns.undo_stage_hunk, { desc = "Git: [u]nstage hunk" })
			map("n", "<leader>dR", gitsigns.reset_buffer, { desc = "Git: [R]eset file" })
			map("n", "<leader>dp", gitsigns.preview_hunk, { desc = "Git: [p]review hunk" })
			map("n", "<leader>db", gitsigns.blame_line, { desc = "Git: toggle [b]lame" })
			map("n", "<leader>dt", gitsigns.toggle_deleted, { desc = "Git: [t]oggle deleted" })

			-- Text object
			map({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")
		end,
	},

	cond = function()
		return not vim.g.vscode
	end,
}
