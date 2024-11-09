-- lsp config
-- https://github.com/neovim/nvim-lspconfig

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
	{
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
}
