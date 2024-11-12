--
-- Code writing
--

local g = require("ruicsh.globals")

return {
	{ -- formatter (conform.nvim)
		-- https://github.com/stevearc/conform.nvim
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>=",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 2500,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				htmlangular = { "prettier" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				scss = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},
		},

		ft = g.ft_code,
		event = { "BufWritePre" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- log statements (debugprint.nvim)
		-- https://github.com/andrewferrier/debugprint.nvim
		"andrewferrier/debugprint.nvim",
		config = function()
			local js_conf = {
				display_location = false,
			}

			local debugprint = require("debugprint")
			debugprint.setup({
				print_tag = "ruic",
				keymaps = {
					normal = {
						plain_below = "g?p",
						plain_above = "g?P",
						variable_below = "g?v",
						variable_above = "g?V",
						variable_below_alwaysprompt = nil,
						variable_above_alwaysprompt = nil,
						textobj_below = "g?o",
						textobj_above = "g?O",
						toggle_comment_debug_prints = nil,
						delete_debug_prints = nil,
					},
					visual = {
						variable_below = "g?v",
						variable_above = "g?V",
					},
				},
				commands = {
					toggle_comment_debug_prints = "ToggleCommentDebugPrints",
					delete_debug_prints = "DeleteDebugPrints",
				},
				filetypes = {
					["javascript"] = js_conf,
					["javascriptreact"] = js_conf,
					["typescript"] = js_conf,
					["typescriptreact"] = js_conf,
				},
			})
		end,

		ft = g.ft_code,
		event = { "BufReadPost", "BufNewFile" },
	},

	{ -- indent guides (indent-blankline.nvim)
		-- https://github.com/lukas-reineke/indent-blankline.nvim
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			scope = {
				show_start = false,
				show_end = false,
			},
		},

		main = "ibl",
		ft = g.ft_code,
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- autopairs (mini.pairs.nvim)
		-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md
		"echasnovski/mini.pairs",
		opts = {
			modes = { insert = true, command = false, terminal = false },

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

		ft = g.ft_code,
		version = false,
	},

	{ -- tab out of from parentheses, brackets, braces, quotes, etc. (tabout.nvim)
		-- https://github.com/abecodes/tabout.nvim
		"abecodes/tabout.nvim",
		opt = {
			tabkey = "<tab>",
			backwards_tabkey = "<s-tab>",
			act_as_tab = true,
			act_as_shift_tab = false,
			enable_backwards = true,
			completion = true,
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
			},
			ignore_beginning = true,
			exclude = {},
		},

		ft = g.ft_code,
		event = "InsertCharPre",
		priority = 1000,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
		},
	},
}
