-- lsp
-- https://github.com/neovim/nvim-lspconfig

local set_keymaps = function(event)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	local telescope = require("telescope.builtin")

	map("<leader>cd", telescope.lsp_definitions, "Goto [D]efinition")
	map("<leader>cr", telescope.lsp_references, "List [R]eferences")
	map("<leader>cI", telescope.lsp_implementations, "Goto [I]mplementation")
	map("<leader>cD", telescope.lsp_type_definitions, "Type [D]efinition")
	map("<leader>cs", telescope.lsp_document_symbols, "Document [S]ymbols")
	map("<leader>cw", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace Symbols")
	map("<leader>cn", vim.lsp.buf.rename, "Re[n]ame")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
	map("<leader>cD", vim.lsp.buf.declaration, "Goto [D]eclaration")
end

local load_servers = function()
	-- LSP servers and clients are able to communicate to each other what features they support.
	--  By default, Neovim doesn't support everything that is in the LSP specification.
	--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
	--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	-- Enable the following language servers
	--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
	--
	--  Add any additional override configuration in the following tables. Available keys are:
	--  - cmd (table): Override the default command used to start the server
	--  - filetypes (table): Override the default list of associated filetypes for the server
	--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
	--  - settings (table): Override the default settings passed when initializing the server.
	--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
	local servers = {
		angularls = {},
		cssls = {},
		cssmodules_ls = {},
		html = {},
		jsonls = {},
		lua_ls = {},
		rust_analyzer = {},
	}

	-- Ensure the servers and tools above are installed
	--  To check the current status of installed tools and/or manually install
	--  other tools, you can run
	--    :Mason
	--
	--  You can press `g?` for help in this menu.
	require("mason").setup()

	-- You can add other tools here that you want Mason to install
	-- for you, so that they are available from within Neovim.
	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"stylua", -- Used to format Lua code
	})
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				-- This handles overriding only values explicitly passed
				-- by the server configuration above. Useful when disabling
				-- certain features of an LSP (for example, turning off formatting for ts_ls)
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
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					set_keymaps(event)
				end,
			})

			load_servers()
		end,

		dependencies = {
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
			{ "pmizio/typescript-tools.nvim", opts = {} },
		},
		cond = function()
			return not vim.g.vscode
		end,
	},
}
