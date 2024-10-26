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
				"diff",
				"dockerfile",
				"gitcommit",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"powershell",
				"regex",
				"rust",
				"scss",
				"toml",
				"tsx",
				"typescript",
				"yaml",
			},
			-- Autoinstall languages that are not installed
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

		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-refactor",
		},
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
						["am"] = {
							query = "@function.outer",
							desc = "Select outer part of a method/function definition",
						},
						["im"] = {
							query = "@function.inner",
							desc = "Select inner part of a method/function definition",
						},
					},
				},
				move = {
					enabled = true,
					set_jumps = false,
					goto_next_start = {
						["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
					},
					goto_previous_start = {
						["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
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

	{ -- syntax aware navigation
		-- https://github.com/nvim-treesitter/nvim-treesitter-refactor
		"nvim-treesitter/nvim-treesitter-refactor",
		opts = {
			refactor = {
				navigation = {
					enable = true,
					keymaps = {
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
}
