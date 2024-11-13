--
-- Finder (files, words, commands)
--

return {
	{ -- fuzzy finder (telescope.nvim)
		-- https://github.com/nvim-telescope/telescope.nvim
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<c-k>"] = actions.move_selection_previous,
							["<c-j>"] = actions.move_selection_next,
							["<c-q>"] = actions.close,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						"\\.git",
						"\\.next",
						"package-lock.json",
						"yarn.lock",
					},
					hidden = true,
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"-l",
					},
				},
				pickers = {
					live_grep = {
						path_display = function(opts, filepath)
							-- display the parent directory name and basename
							local path = vim.fs.dirname(filepath)
							local parent = vim.fs.basename(path)
							local basename = vim.fs.basename(filepath)
							if parent == "." then
								return basename
							end
							return vim.fs.joinpath(parent, basename)
						end,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "ui-select")
			pcall(telescope.load_extension, "workspaces")

			-- see `:help telescope.builtin`
			local k = vim.keymap
			local builtin = require("telescope.builtin")

			local function show_jumplist()
				return builtin.jumplist({ show_line = false })
			end

			k.set("n", "<leader>,", builtin.oldfiles, { desc = "Telescope: find recent files)" })
			k.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope: Files" })
			k.set("n", "<leader>f", builtin.live_grep, { desc = "Telescope: [f]ind word in workspace" })
			k.set("n", "<leader>.", builtin.resume, { desc = "Telescope: Resume last search" })
			k.set("n", "<leader>nc", builtin.commands, { desc = "Telescope: [c]ommands" })
			k.set("n", "<leader>nh", builtin.help_tags, { desc = "Telescope: [h]elp" })
			k.set("n", "<leader>nk", builtin.keymaps, { desc = "Telescope: [k]eymaps" })
			k.set("n", "<leader>nt", builtin.builtin, { desc = "Telescope: select [t]elescope" })
			k.set("n", "<leader>hf", builtin.git_status, { desc = "Git: list files" })
			k.set("n", "<leader>jj", show_jumplist, { desc = "Jumplist: Show" })

			-- Slightly advanced example of overriding default behavior and theme
			k.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Telescope: [/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			k.set("n", "<leader><c-f>", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "Telescope: [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			k.set("n", "<leader>n,", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Telescope: [N]eovim files" })
		end,

		event = { "VeryLazy" },
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			"natecraddock/workspaces.nvim",
		},
		cond = function()
			return not vim.g.vscode
		end,
	},
}
