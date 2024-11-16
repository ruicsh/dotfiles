-- Autocmds for BufEnter event
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		-- do not auto-wrap comments
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
