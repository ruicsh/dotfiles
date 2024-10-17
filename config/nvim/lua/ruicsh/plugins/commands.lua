return {
	{ -- autocomplete
		-- https://github.com/hrsh7th/nvim-cmp
		"hrsh7th/nvim-cmp",
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<c-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<c-p>"] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					["<c-b>"] = cmp.mapping.scroll_docs(-4),
					["<c-f>"] = cmp.mapping.scroll_docs(4),

					-- Accept ([y]es) the completion.
					--  This will auto-import if your LSP supports it.
					--  This will expand snippets if the LSP sent a snippet.
					["<tab>"] = cmp.mapping.confirm({ select = true }),
					["<enter>"] = cmp.mapping.confirm({ select = true }),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<c-space>"] = cmp.mapping.complete({}),

					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),
				sources = {
					{
						name = "lazydev",
						-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
						group_index = 0,
					},
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,

		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- sessions
		-- "https://github.com/rmagatti/auto-session",
		"rmagatti/auto-session",
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			-- log_level = 'debug',
		},

		lazy = false,
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- autopairs
		-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
		"echasnovski/mini.pairs",
		opts = {
			-- In which modes mappings from this `config` should be created
			modes = { insert = true, command = false, terminal = false },

			-- Global mappings. Each right hand side should be a pair information, a
			-- table with at least these fields (see more in |MiniPairs.map|):
			-- - <action> - one of 'open', 'close', 'closeopen'.
			-- - <pair> - two character string for pair to be used.
			-- By default pair is not inserted after `\`, quotes are not recognized by
			-- `<CR>`, `'` does not insert pair after a letter.
			-- Only parts of tables can be tweaked (others will use these defaults).
			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

				['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
				["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
			},
		},

		version = false,
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- delete buffer
		-- https://github.com/moll/vim-bbye
		"moll/vim-bbye",

		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- quit bad habit
		-- https://github.com/m4xshen/hardtime.nvim
		"m4xshen/hardtime.nvim",
		opts = {},

		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
	},

	{ -- sort selection
		-- https://github.com/sQVe/sort.nvim
		"sQVe/sort.nvim",
		keys = {
			{ "<leader>ss", "<cmd>Sort<cr>", mode = "v" },
		},
		config = true,
	},

	{ -- search/replace
		-- https://github.com/nvim-pack/nvim-spectre
		"nvim-pack/nvim-spectre",
		keys = {
			{
				"<leader>sr",
				"<cmd>lua require('spectre').open_file_search({ select_word = true })<cr>",
				desc = "[S]earch [R]eplace",
			},
		},

		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- better %
		-- https://github.com/andymass/vim-matchup
		"andymass/vim-matchup",
	},

	{ -- bracket mappings
		-- https://github.com/tpope/vim-unimpaired
		"tpope/vim-unimpaired",
	},
}
