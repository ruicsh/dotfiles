-- Enable line number in telescope preview
vim.api.nvim_create_autocmd("User", {
	pattern = "TelescopePreviewerLoaded",
	callback = function()
		vim.opt_local.number = true
	end,
	group = vim.api.nvim_create_augroup("General", { clear = true }),
})
