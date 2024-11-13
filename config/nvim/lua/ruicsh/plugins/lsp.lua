--
-- LSP
--

local g = require("ruicsh.globals")

-- set keymaps for lsp commands
local function set_keymaps(event)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	local telescope = require("telescope.builtin")

	-- when displaying the document/worspace symbols, only show these
	local lsp_symbols = { "method", "function", "class" }
	local function lsp_document_symbols()
		telescope.lsp_document_symbols({ symbols = lsp_symbols })
	end
	local function lsp_workspace_symbols()
		telescope.lsp_workspace_symbols({ symbols = lsp_symbols })
	end

	map("K", "<cmd>lua vim.lsp.buf.hover()<cr>", "LSP: Display hover for symbol")
	map("gd", telescope.lsp_definitions, "LSP: Jump to [d]efinition")
	map("gi", telescope.lsp_implementations, "LSP: Jump to [i]mplementation")
	map("go", telescope.lsp_type_definitions, "LSP: Jump to type definition")
	map("gr", telescope.lsp_references, "LSP: List [r]eferences")
	map("gy", lsp_document_symbols, "LSP: Document s[y]mbols")
	map("gY", lsp_workspace_symbols, "LSP: Workspace s[Y]mbols")
	map("<f2>", vim.lsp.buf.rename, "LSP: Rename symbol")
end

-- install and configure lsp servers
local function conf_lsp_servers()
	local servers = {
		angularls = {
			filetypes = { "htmlangular", "typescript" },
		},
		cssls = {},
		cssmodules_ls = {},
		html = {},
		jsonls = {},
		lua_ls = {
			settings = {
				Lua = {
					diagnostics = {
						disable = { "missing-parameters", "missing-fields" },
					},
				},
			},
		},
		rust_analyzer = {},
	}

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	require("mason").setup()

	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"stylua", -- Used to format Lua code
	})
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		},
	})
end

return {
	{ -- config (nvim-lspconfig)
		-- https://github.com/neovim/nvim-lspconfig
		"neovim/nvim-lspconfig",
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					set_keymaps(event)
				end,
			})

			conf_lsp_servers()
		end,

		ft = g.ft_code,
		dependencies = {
			{ "williamboman/mason.nvim", ft = g.ft_code },
			{ "williamboman/mason-lspconfig.nvim", ft = g.ft_code },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim", ft = g.ft_code },
			{ "pmizio/typescript-tools.nvim", opts = {}, ft = { "typescript", "typescriptreact" } },
			{ "onsails/lspkind.nvim", ft = g.ft_code },
		},
		cond = function()
			return not vim.g.vscode
		end,
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

		ft = g.ft_code,
		event = { "InsertEnter" },
		dependencies = {
			{ "hrsh7th/nvim-cmp", ft = g.ft_code, event = { "InsertEnter" } },
			{ "hrsh7th/cmp-nvim-lsp", ft = g.ft_code, event = { "InsertEnter" } },
			{ "hrsh7th/cmp-path", ft = g.ft_code, event = { "InsertEnter" } },
		},
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- jump to reference (refjump.nvim)
		-- https://github.com/mawkler/refjump.nvim
		"mawkler/refjump.nvim",
		opts = {
			highlights = {
				enabled = false,
			},
		},

		ft = g.ft_code,
		event = { "BufReadPost", "BufNewFile" },
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- diagnostics (trouble.nvim)
		-- https://github.com/folke/trouble.nvim
		"folke/trouble.nvim",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Trouble: Diagnostics",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Trouble: Location List",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Trouble: Quickfix List",
			},
		},
		opts = {
			focus = true,
		},

		cmd = "Trouble",
		cond = function()
			return not vim.g.vscode
		end,
	},

	{ -- neovim apis lsp (lazydev.nvim)
		-- used for completion, annotations and signatures of Neovim apis
		-- https://github.com/folke/lazydev.nvim
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
}
