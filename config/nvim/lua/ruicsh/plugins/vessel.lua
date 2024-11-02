-- buffers, marks and jumplist
-- https://github.com/gcmt/vessel.nvim

return {
	"gcmt/vessel.nvim",
	keys = {
		{ "§", "<plug>(VesselViewBuffers)" },
		{ "[§", "<plug>(VesselPinnedPrev)" },
		{ "]§", "<plug>(VesselPinnedNext)" },
		{ "<leader>j", "<plug>(VesselViewJumps)" },
		{ "<leader>m", "<plug>(VesselViewMarks)" },
	},
	opts = {
		create_commands = true,
		buffers = {
			view = "tree",
		},
	},

	event = { "BufReadPost" },
	cond = function()
		return not vim.g.vscode
	end,
}
