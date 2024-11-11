--
-- AI
--

local g = require("ruicsh.globals")

local avante_build_cmd = vim.loop.os_uname().sysname:find("Windows")
		and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
	or "make"

return {
	{ -- github copilot (copilot.lua)
		-- https://github.com/zbirenbaum/copilot.lua
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<c-l>",
					dismiss = "<c-h>",
					next = "<c-n>",
					prev = "<c-p>",
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

	{ -- cursor ide (avante.nvim)
		-- https://github.com/yetone/avante.nvim
		"yetone/avante.nvim",
		opts = {
			provider = "claude",
			auto_suggestions_provider = "copilot",
		},

		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		build = avante_build_cmd,
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"zbirenbaum/copilot.lua",
		},
	},
}
