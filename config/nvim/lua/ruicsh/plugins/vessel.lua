-- pinned and opened buffers
-- https://github.com/gcmt/vessel.nvim

return {
	"gcmt/vessel.nvim",
	keys = {
		{ "§", "<plug>(VesselViewBuffers)" },
		{ "[§", "<plug>(VesselPinnedPrev)" },
		{ "]§", "<plug>(VesselPinnedNext)" },
	},
	opts = {
		create_commands = true,
		buffers = {
			view = "tree",
			mappings = {
				close = { "§" },
			},
		},
	},

	event = { "BufReadPost", "BufNewFile" },
	cond = function()
		return not vim.g.vscode
	end,
}
