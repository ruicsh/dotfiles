-- highlight selection when yanking
-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "Highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
			visual = true,
		})
	end,
})
