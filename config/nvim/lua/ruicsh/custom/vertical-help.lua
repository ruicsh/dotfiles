-- always open help panel on a vertical split, full height
-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("vertical_help", { clear = true }),
	pattern = "help",
	callback = function()
		vim.bo.bufhidden = "unload"
		vim.cmd.wincmd("L")
		vim.cmd.wincmd("=")
	end,
})
