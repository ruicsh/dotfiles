-- opened buffers menu
-- https://github.com/leath-dub/snipe.nvim

return {
	"leath-dub/snipe.nvim",
	config = function()
		local snipe = require("snipe")
		snipe.setup({
			ui = {
				open_win_override = {
					title = "",
					border = "rounded",
				},
			},
		})

		vim.keymap.set("n", "§", snipe.open_buffer_menu, { desc = "Open list of opened files" })
	end,

	cond = function()
		return not vim.g.vscode
	end,
}
