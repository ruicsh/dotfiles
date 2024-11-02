-- neovim apis
-- used for completion, annotations and signatures of Neovim apis

return {
	{
		"folke/lazydev.nvim",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},

		lazy = true,
		ft = "lua",
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- type definitions for lua
		"Bilal2453/luvit-meta",

		lazy = true,
		ft = "lua",
		cond = function()
			return not vim.g.vscode
		end,
	},
}
