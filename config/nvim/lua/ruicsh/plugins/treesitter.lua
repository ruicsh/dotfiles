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
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = {
							query = "@function.outer",
							desc = "Syntax: Select [a] [f]unction",
						},
						["if"] = {
							query = "@function.inner",
							desc = "Syntax: Select [i]nner [f]unction",
						},
						["aa"] = {
							query = "@paramenter.outer",
							desc = "Syntax: Select [a] [a]rgument",
						},
						["ia"] = {
							query = "@paramenter.inner",
							desc = "Syntax: Select [i]nner [a]rgument",
						},
					},
				},
				move = {
					enable = true,
					set_jumps = false,
					goto_previous_start = {
						["[f"] = { query = "@function.outer", desc = "Syntax: Previous [f]unction" },
						["[a"] = { query = "@parameter.inner", desc = "Syntax: Previous [a]rgument" },
						["[d"] = { query = "@block.inner", desc = "Syntax: Previous block" },
					},
					goto_previous_end = {
						["[F"] = { query = "@function.outer", desc = "Syntax: Previous [f]unction" },
						["[A"] = { query = "@parameter.inner", desc = "Syntax: Previous [a]rgument" },
						["[D"] = { query = "@block.inner", desc = "Syntax: Previous block" },
					},
					goto_next_start = {
						["]f"] = { query = "@function.outer", desc = "Syntax: Next [f]unction" },
						["]a"] = { query = "@parameter.inner", desc = "Syntax: Next [a]rgument" },
						["]d"] = { query = "@block.inner", desc = "Syntax: Next block" },
					},
					goto_next_end = {
						["]F"] = { query = "@function.outer", desc = "Syntax: Next [f]unction" },
						["]A"] = { query = "@parameter.inner", desc = "Syntax: Next [a]rgument" },
						["]D"] = { query = "@block.inner", desc = "Syntax: Next block" },
					},
				},
			},
		},

		main = "nvim-treesitter.configs", -- sets main module to use for opts
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- syntax aware text objects
		-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		"nvim-treesitter/nvim-treesitter-textobjects",

		event = { "BufReadPost", "BufNewFile" },
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

		event = { "BufReadPost", "BufNewFile" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- syntax aware join lines
		-- https://github.com/Wansmer/treesj
		"Wansmer/treesj",
		keys = {
			{ "<space>j", "<cmd>TSJToggle<cr>", desc = "TreeSJ: [j]oin toggle" },
		},
		opts = {
			use_default_keymaps = false,
			max_join_length = 150,
		},

		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
