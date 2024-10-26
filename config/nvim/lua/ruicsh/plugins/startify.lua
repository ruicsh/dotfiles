-- welcome screen
-- https://github.com/mhinz/vim-startify

return {
	"mhinz/vim-startify",
	config = function()
		vim.g.startify_custom_header = ""
		vim.g.startify_lists = {
			{ type = "dir", header = { "   Current Directory " .. vim.fn.getcwd() } },
			{ type = "files", header = { "   Files" } },
			{ type = "sessions", header = { "   Sessions" } },
			{ type = "bookmarks", header = { "   Bookmarks" } },
			{ type = "commands", header = { "   Commands" } },
		}
	end,

	cond = function()
		return not vim.g.vscode
	end,
}
