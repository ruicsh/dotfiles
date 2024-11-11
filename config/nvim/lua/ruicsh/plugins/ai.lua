--
-- AI
--

local g = require("ruicsh.globals")

return {
	{ -- github copilot (copilot.lua)
		-- https://github.com/zbirenbaum/copilot.lua
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<s-tab>",
					dismiss = "q",
					next = "<c-j>",
					prev = "<c-k>",
				},
			},
		},

		cmd = "Copilot",
		event = { "InsertEnter" },
		ft = g.ft_code,
		cond = function()
			return not vim.g.vscode
		end,
	},
}
