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
			end, { desc = "git: Jump to next [c]hange" })

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "git: Jump to previous [c]hange" })

			-- Actions
			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git: [s]tage hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git: [r]eset hunk" })
			map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Git: [u]nstage hunk" })
			map("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git: [s]tage hunk" })
			map("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git: [r]eset hunk" })
			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Git: [S]tage file" })
			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Git: [R]eset file" })
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git: [p]review hunk" })
			map("n", "<leader>gb", gitsigns.blame_line, { desc = "Git: toggle [b]lame" })

			-- Text object
			map({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")
		end,
	},

	cond = function()
		return not vim.g.vscode
	end,
}
