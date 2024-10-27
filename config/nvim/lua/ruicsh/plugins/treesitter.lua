-- parser
-- https://github.com/nvim-treesitter/nvim-treesitter

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"angular",
				"bash",
				"css",
				"csv",
				"diff",
				"dockerfile",
				"embedded_template",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"graphql",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"nginx",
				"powershell",
				"pug",
				"regex",
				"rust",
				"scss",
				"sql",
				"styled",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			-- autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			auto_tag = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "[n",
					node_incremental = "[n",
					scope_incremental = false,
					node_decremental = "]n",
				},
			},
		},

		main = "nvim-treesitter.configs", -- sets main module to use for opts
		event = { "bufreadpre", "bufnewfile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
		},
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- syntax aware navigation
		-- https://github.com/nvim-treesitter/nvim-treesitter-refactor
		"nvim-treesitter/nvim-treesitter-refactor",
		opts = {
			refactor = {
				navigation = {
					enable = true,
					keymaps = {
						goto_definition = false,
						list_definitions = false,
						list_definitions_toc = false,
						goto_next_usage = "]r",
						goto_previous_usage = "[r",
					},
				},
			},
		},

		main = "nvim-treesitter.configs",
		lazy = true,
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- syntax aware text objects
		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		"nvim-treesitter/nvim-treesitter-textobjects",
		opts = {
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = {
							query = "@function.outer",
							desc = "select outer part of a method/function definition",
						},
						["if"] = {
							query = "@function.inner",
							desc = "select inner part of a method/function definition",
						},
						["aa"] = {
							query = "@paramenter.outer",
							desc = "select outer part of a argument/parameter",
						},
						["ia"] = {
							query = "@paramenter.inner",
							desc = "select inner part of a argument/parameter",
						},
					},
				},
				move = {
					enable = true,
					set_jumps = false,
					goto_previous_start = {
						["[f"] = { query = "@function.outer", desc = "Previous method/function" },
						["[a"] = { query = "@parameter.inner", desc = "Previous argument/parameter" },
						["[d"] = { query = "@block.inner", desc = "Previous block" },
					},
					goto_previous_end = {
						["[F"] = { query = "@function.outer", desc = "Previous method/function" },
						["[A"] = { query = "@parameter.inner", desc = "Previous argument/parameter" },
						["[D"] = { query = "@block.inner", desc = "Previous block" },
					},
					goto_next_start = {
						["]f"] = { query = "@function.outer", desc = "Next method/function" },
						["]a"] = { query = "@parameter.inner", desc = "Next argument/parameter" },
						["]d"] = { query = "@block.inner", desc = "Next block" },
					},
					goto_next_end = {
						["]F"] = { query = "@function.outer", desc = "Next method/function" },
						["]A"] = { query = "@parameter.inner", desc = "Next argument/parameter" },
						["]D"] = { query = "@block.inner", desc = "Next block" },
					},
				},
			},
		},

		main = "nvim-treesitter.configs",
		lazy = true,
		cond = function()
			return not vim.g.vscode
		end,
	},

	{
		-- code context
		-- https://github.com/nvim-treesitter/nvim-treesitter-context
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			vim.keymap.set("n", "[t", function()
				local ctx = require("treesitter-context")
				ctx.go_to_context(vim.v.count1)
			end, { silent = true })
		end,

		event = "VeryLazy",
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- auto-close/rename html tags
		-- https://github.com/windwp/nvim-ts-autotag
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true, -- Auto close on trailing </
				},
			})
		end,

		cond = function()
			return not vim.g.vscode
		end,
	},
}
