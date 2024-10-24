-- search motions
-- https://github.com/folke/flash.nvim

return {
	"folke/flash.nvim",
	config = function()
		local flash = require("flash")
		vim.keymap.set({ "n", "x", "o" }, "s", flash.jump, { desc = "Flash" })
		vim.keymap.set({ "n", "x", "o" }, "S", flash.treesitter, { desc = "Flash: Treesitter" })
		vim.keymap.set("o", "r", flash.remote, { desc = "Flash: Remote" })
		vim.keymap.set({ "x", "o" }, "R", flash.treesitter_search, { desc = "Flash: Treesitter Search" })
		vim.keymap.set("c", "<c-s>", flash.toggle, { desc = "Flash: Toggle" })
	end,

	event = "VeryLazy",
}
