-- Jump around with search labels
-- https://github.com/folke/flash.nvim

return {
	"folke/flash.nvim",
	keys = function()
		local flash = require("flash")

		return {
			{ "s", flash.jump, desc = "Flash: Jump", mode = { "n", "x", "o" } },
			{ "r", flash.remote, desc = "Flash: Remote", mode = "o" },
			{ "<leader>V", flash.treesitter, desc = "Flash: Treesitter", mode = { "n", "x", "o" } },
		}
	end,
	opts = {
		highlight = {
			backdrop = false,
			matches = false,
		},
		label = {
			uppercase = false,
		},
		labels = "asdfqwerzxcv", -- Limit labels to left side of the keyboard
		modes = {
			char = {
				char_actions = function(motion)
					return {
						[motion] = "next",
						[motion:match("%l") and motion:upper() or motion:lower()] = "prev",
					}
				end,
				highlight = {
					backdrop = false,
				},
				jump_labels = false,
				keys = { "f", "F", "t", "T" },
				multi_line = false,
			},
			treesitter = {
				actions = {
					["<c-a>"] = "next", -- Increment selection
					["<c-x>"] = "prev", -- Decrement selection
				},
				labels = "", -- Disable labels for treesitter mode
			},
		},
		prompt = {
			enabled = false,
		},
		search = {
			wrap = true,
		},
	},

	event = "VeryLazy",
}
