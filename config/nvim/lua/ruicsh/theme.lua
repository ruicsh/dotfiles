return {
	"projekt0n/github-nvim-theme",
	priority = 1000,
	opts = {
		specs = {
			github_dark = {
				bg0 = "#1f1f1f", -- sidebar bg
				bg1 = "#181818", -- editor bg
				bg2 = "#181818", -- tabs inactive bg
			},
		},
	},
	init = function()
		vim.cmd.colorscheme("github_dark")
	end,

	main = "github-theme",
	cond = function()
		return not vim.g.vscode
	end,
}
