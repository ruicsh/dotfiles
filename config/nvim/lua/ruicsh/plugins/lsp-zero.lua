-- set keymaps for lsp commands
local set_keymaps = function(event)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	local telescope = require("telescope.builtin")

	map("K", "<cmd>lua vim.lsp.buf.hover()<cr>", "Display hover for symbol")
	map("gd", telescope.lsp_definitions, "Goto [D]efinition")
	map("gi", telescope.lsp_implementations, "Goto [I]mplementation")
	map("go", telescope.lsp_type_definitions, "Goto type definition")
	map("gr", telescope.lsp_references, "List [R]eferences")
	map("gs", telescope.lsp_document_symbols, "Document [S]ymbols")
	map("gS", telescope.lsp_workspace_symbols, "Workspace [S]ymbols")
	map("<f2>", vim.lsp.buf.rename, "Rename")
end

-- install and configure lsp servers
local conf_lsp_servers = function()
	local servers = {
		angularls = {},
		cssls = {},
		cssmodules_ls = {},
		html = {},
		jsonls = {},
		lua_ls = {},
		rust_analyzer = {},
	}

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	require("mason").setup({})

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

-- configure auto complete
local conf_autocomplete = function()
	local cmp = require("cmp")
	local cmp_action = require("lsp-zero").cmp_action()

	cmp.setup({
		sources = {
			{ name = "nvim_lsp" },
		},
		mapping = cmp.mapping.preset.insert({
			-- `Enter` key to confirm completion
			["<cr>"] = cmp.mapping.confirm({ select = false }),

			-- trigger completion menu when cursor is inside a word
			["<tab>"] = cmp_action.tab_complete(),
			["<s-tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		}),
		preselect = "item",
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		snippet = {
			expand = function(args)
				vim.snippet.expand(args.body)
			end,
		},
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
end

return {
	{
		"VonHeikemen/lsp-zero.nvim",
		config = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = "yes"

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			local lspconfig_defaults = require("lspconfig").util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)

			-- This is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					set_keymaps(event)
				end,
			})

			conf_lsp_servers()
			conf_autocomplete()
		end,

		branch = "v4.x",
		cond = function()
			return not vim.g.vscode
		end,
	},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "pmizio/typescript-tools.nvim", opts = {} },
	{ "onsails/lspkind.nvim" },
}
