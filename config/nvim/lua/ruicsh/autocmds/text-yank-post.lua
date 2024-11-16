vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("ruicsh/TextYankPost", { clear = true }),
	callback = function()
		-- highlight selection when yanking
		-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
			visual = true,
		})
	end,
})
