return {
	{ -- neovim apis
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},

		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- type definitions for lua
		"Bilal2453/luvit-meta",

		lazy = true,
		cond = function()
			return not vim.g.vscode
		end,
	},
}
