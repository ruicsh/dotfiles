-- autocomplete
-- https://github.com/hrsh7th/nvim-cmp

return {
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local cmp_action = require("lsp-zero").cmp_action()

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<cr>"] = cmp.mapping.confirm({ select = false }),
					["<tab>"] = cmp_action.tab_complete(),
					["<s-tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
				}),
				preselect = "item",
				completion = {
					autocomplete = false,
					completeopt = "menu,menuone,noinsert",
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
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
		end,

		event = "InsertEnter",
		dependencies = {
			{ "VonHeikemen/lsp-zero.nvim", event = { "InsertEnter" } },
			{ "hrsh7th/nvim-cmp", event = { "InsertEnter" } },
			{ "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter" } },
			{ "hrsh7th/cmp-path", event = { "InsertEnter" } },
		},
	},
}
