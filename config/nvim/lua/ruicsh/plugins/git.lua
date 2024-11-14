--
-- Git
--

return {
	{ -- git client (vim-fugitive)
		-- https://github.com/tpope/vim-fugitive
		"tpope/vim-fugitive",

		cmd = "Git",
	},

	{ -- git blame (git-blame.nvim)
		-- https://github.com/f-person/git-blame.nvim
		"f-person/git-blame.nvim",
		opts = {
			enabled = true,
			message_template = "<summary> • <date> • <author>",
			date_format = "%r",
			message_when_not_committed = "Not commited yet",
			ignored_filetypes = { "term" },
		},

		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- merge conflicts (git-conflict.nvim)
		-- https://github.com/akinsho/git-conflict.nvim
		"akinsho/git-conflict.nvim",
		config = true,

		event = { "BufReadPost", "BufNewFile" },
		version = "*",
	},

	{ -- diffview (diffview.nvim)
		-- https://github.com/sindrets/diffview.nvim
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>hd", "<cmd>DiffviewOpen<cr>", { desc = "Git: Open [d]iffview" } },
		},
		config = function()
			local diffview = require("diffview")
			local actions = require("diffview.actions")
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
					diff_buf_read = function(buffnr)
						vim.api.nvim_buf_call(buffnr, function()
							vim.cmd("normal! gg]czz")
						end)
					end,
					diff_buf_win_enter = function()
						vim.wo.cursorline = false -- disable cursorline
						vim.opt_local.foldenable = false -- disable folding
					end,
					diff_buf_win_leave = function()
						vim.wo.cursorline = true -- enable cursorline
						vim.opt_local.foldenable = true -- enable folding
					end,
					view_enter = function(view)
						vim.cmd(":VimadeDisable") -- disable dimming windows
						vim.cmd(":Barbecue hide") -- hide breadcrumbs

						local bufnr = view.buffer
						-- keymaps set only for this buffer
						vim.keymap.set("n", "<c-q>", "<cmd>DiffviewClose<cr>", { buffer = bufnr }) -- use <c-q> to close,
						vim.keymap.set(
							"n",
							"cc",
							"<cmd>DiffviewClose<cr><cmd>vertical Git commit<cr>",
							{ buffer = bufnr }
						) -- use cc to commit
					end,
					view_leave = function()
						vim.cmd(":VimadeEnable") --reenable dimming windows
						vim.cmd(":Barbecue show") -- show breadcrumbs
					end,
				},
			})
		end,

		cmd = { "DiffviewOpen" },
	},

	{ -- buffer integration (gitsigns.nvim)
		-- https://github.com/lewis6991/gitsigns.nvim
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
				map({ "n", "v" }, "<leader>hs", gitsigns.stage_hunk, { desc = "Git: [s]tage hunk", buffer = bufnr })
				map({ "n", "v" }, "<leader>hr", gitsigns.reset_hunk, { desc = "Git: [r]eset hunk", buffer = bufnr })
				map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Git: [S]tage file" })
				map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Git: [R]eset file" })
				map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Git: [u]nstage hunk" })
				map("n", "<leader>hp", gitsigns.preview_hunk_inline, { desc = "Git: [p]review hunk" })

				-- Text object
				map({ "o", "x" }, "ih", ":<c-u>Gitsigns select_hunk<cr>")
			end,
		},

		event = { "BufReadPost", "BufNewFile" },
	},
}
