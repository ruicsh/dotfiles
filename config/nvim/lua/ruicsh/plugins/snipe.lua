-- open buffers menu
-- https://github.com/leath-dub/snipe.nvim

return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"§",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open list of open files",
		},
	},
	opts = {},

	cond = function()
		return not vim.g.vscode
	end,
}
