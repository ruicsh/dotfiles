-- file tree explorer
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "\\", "<cmd>Neotree toggle reveal<cr>" },
	},
	opts = {
		close_if_last_window = true,
		sources = { "filesystem", "git_status" },
		window = {
			position = "current",
			mappings = {
				["<c-v>"] = { "open_vsplit", desc = "Explorer: Open file to the side" },
				["h"] = { "close_node", desc = "Explorer: Collapse directory" },
				["l"] = { "open", desc = "Explorer: Open file or expand directory" },
				["H"] = { "close_all_nodes", desc = "Explorer: Collapse all" },
				["L"] = { "expand_all_nodes", desc = "Explorer: Expand all" },
				["<c-q>"] = { "close_window", desc = "Explorer: Quit" },
				["[c"] = { "prev_git_modified", desc = "Explorer: Previous git change" },
				["]c"] = { "next_git_modified", desc = "Explorer: Next git change" },
			},
		},
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.opt_local.relativenumber = true
				end,
			},
		},
		nesting_rules = {
			["ts"] = { "css", "scss", "module.scss", "test.ts", "spec.ts", "html" },
			["tsx"] = { "css", "scss", "module.scss", "test.ts", "spec.ts", "html" },
			["package.json"] = {
				pattern = "^package%.json",
				files = { "package-lock.json", "yarn*" },
			},
		},
	},

	cmd = { "Neotree" },
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cond = function()
		return not vim.g.vscode
	end,
}
