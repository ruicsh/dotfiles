--
-- Code writing
--

local g = require("ruicsh/plugins/globals")

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
				vue = { "prettier" },
			},
			format_on_save = function()
				-- stop if we disabled formatting on save
				if not vim.g.format_on_save then
					return nil
				end

				return {
					timeout_ms = 2500,
					lsp_format = "fallback",
				}
			end,
		},
		init = function()
			-- use conform for gq
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
			-- start auto-formatting by default (and disable with my ToggleFormat command)
			vim.g.format_on_save = true
		end,

		event = { "BufWritePre" },
		ft = g.CodingFiletypes,
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

		event = { "BufReadPost", "BufNewFile" },
		ft = g.CodingFiletypes,
	},

	{ -- autopairs (nvim-autopairs)
		-- https://github.com/windwp/nvim-autopairs
		"windwp/nvim-autopairs",
		opts = {
			check_ts = true,
		},

		event = { "InsertEnter" },
		ft = g.CodingFiletypes,
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

		event = "InsertCharPre",
		ft = g.CodingFiletypes,
		priority = 1000,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
		},
	},

	{ -- autocomplete (nvim-cmp)
		-- https://github.com/hrsh7th/nvim-cmp
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<c-b>"] = cmp.mapping.scroll_docs(-4),
					["<c-f>"] = cmp.mapping.scroll_docs(4),
					["<c-space>"] = cmp.mapping.complete({ mode = cmp.TriggerEvent.Insert }),
					["<c-y>"] = cmp.mapping.confirm({ select = true }),
					["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<c-e>"] = cmp.mapping.abort(),
					["<cr>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
				}),
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = require("lspkind").cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
					}),
					expandable_indicator = true,
				},
			})
		end,

		event = { "InsertEnter" },
		ft = g.CodingFiletypes,
		dependencies = {
			{ "hrsh7th/nvim-cmp", ft = g.ft_code, event = { "InsertEnter" } },
			{ "hrsh7th/cmp-nvim-lsp", ft = g.ft_code, event = { "InsertEnter" } },
			{ "hrsh7th/cmp-path", ft = g.ft_code, event = { "InsertEnter" } },
		},
	},

	{ -- highlight matching words under cursor (vim-illuminate)
		-- https://github.com/RRethy/vim-illuminate
		"rrethy/vim-illuminate",

		event = { "BufRead" },
		ft = g.CodingFiletypes,
	},

	{ -- github copilot (copilot.lua)
		-- https://github.com/zbirenbaum/copilot.lua
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<tab>",
					next = "<c-j>",
				},
			},
		},

		cmd = "Copilot",
		event = { "InsertEnter" },
		ft = g.CodingFiletypes,
	},
}
