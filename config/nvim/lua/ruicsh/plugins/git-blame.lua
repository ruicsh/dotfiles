-- git blame
-- https://github.com/f-person/git-blame.nvim

return {
	"f-person/git-blame.nvim",
	opts = {
		enabled = true,
		message_template = " <summary> • <date> • <author> • <<sha>>",
		date_format = "%m-%d-%Y %H:%M:%S",
		virtual_text_column = 80,
	},

	event = { "BufReadPost" },
	cond = function()
		return not vim.g.vscode
	end,
}
