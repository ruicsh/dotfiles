-- search motions
-- https://github.com/folke/flash.nvim

return {
	"folke/flash.nvim",
	config = function()
		local k = vim.keymap
		local flash = require("flash")

		k.set({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
		k.set({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash: Treesitter" })
		k.set("o", "r", flash.remote, { desc = "Flash: Remote" })
		k.set({ "x", "o" }, "R", flash.treesitter_search, { desc = "Flash: Treesitter Search" })
		k.set("c", "<c-s>", flash.toggle, { desc = "Flash: Toggle" })
	end,

	event = "VeryLazy",
}
