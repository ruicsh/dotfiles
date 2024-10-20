-- tabs bookmarks
-- using grapple instead of harpoon, but same features, just easier config
-- https://github.com/cbochs/grapple.nvim

return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git_branch",
	},
	keys = {
		{ "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Harpoon: Go to file [1]" },
		{ "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Harpoon: Go to file [2]" },
		{ "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Harpoon: Go to file [3]" },
		{ "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Harpoon: Go to file [4]" },
		{ "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Harpoon: Go to file [5]" },
		{ "<leader>6", "<cmd>Grapple select index=6<cr>", desc = "Harpoon: Go to file [6]" },
		{ "<leader>7", "<cmd>Grapple select index=7<cr>", desc = "Harpoon: Go to file [7]" },
		{ "<leader>8", "<cmd>Grapple select index=8<cr>", desc = "Harpoon: Go to file [7]" },
		{ "<leader>9", "<cmd>Grapple select index=9<cr>", desc = "Harpoon: Go to file [8]" },
		{ "<leader>ha", "<cmd>Grapple toggle<cr>", desc = "[H]arpoon: [A]dd buffer" },
		{ "<leader>hh", "<cmd>Grapple toggle_tags<cr>", desc = "[H]arpoon: [H]arpoon" },
		{ "<leader>hn", "<cmd>Grapple cycle_tags next<cr>", desc = "[H]arpoon: [N]ext file" },
		{ "<leader>hp", "<cmd>Grapple cycle_tags prev<cr>", desc = "[H]arpoon: [P]revious file" },
		{ "<leader>hr", "<cmd>Grapple untag<cr>", desc = "[H]arpoon: [R]emove file" },
	},

	cmd = "Grapple",
	event = { "BufReadPost", "BufNewFile" },
	cond = function()
		return not vim.g.vscode
	end,
}

