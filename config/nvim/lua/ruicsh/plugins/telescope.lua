-- fuzzy finder
-- https://github.com/nvim-telescope/telescope.nvim

return {
	"nvim-telescope/telescope.nvim",
	config = function()
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			--
			-- defaults = {
			--   mappings = {
			--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
			--   },
			-- },
			-- pickers = {}
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- see `:help telescope.builtin`
		local k = vim.keymap
		local builtin = require("telescope.builtin")
		k.set("n", "<up>.", builtin.oldfiles, { desc = 'Telescope: find recent files ("." for repeat)' })
		-- k.set("n", "<up><up>", function()
		-- 	builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
		-- end, { desc = "Buffers" })
		k.set("n", "<up>c", builtin.commands, { desc = "Telescope: [c]ommands" })
		k.set("n", "<up>d", builtin.diagnostics, { desc = "Telescope: [d]iagnostics" })
		k.set("n", "<up>f", builtin.find_files, { desc = "Telescope: [f]iles" })
		k.set("n", "<up>g", builtin.live_grep, { desc = "Telescope: find word in workspace" })
		k.set("n", "<up>h", builtin.help_tags, { desc = "Telescope: [h]elp" })
		k.set("n", "<up>k", builtin.keymaps, { desc = "Telescope: [k]eymaps" })
		k.set("n", "<up>r", builtin.resume, { desc = "Telescope: [l]esume" })
		k.set("n", "<up>t", builtin.builtin, { desc = "Telescope: select [t]elescope" })
		k.set("n", "<up>w", builtin.grep_string, { desc = "Telescope: find current [w]ord" })

		-- Slightly advanced example of overriding default behavior and theme
		k.set("n", "<up>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Telescope: [/] Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		k.set("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Telescope: [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		k.set("n", "<up>n", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Telescope: [N]eovim files" })
	end,

	event = "VimEnter",
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

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	cond = function()
		return not vim.g.vscode
	end,
}
