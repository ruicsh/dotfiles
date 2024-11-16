-- toggle to enable or disable autoformat on save
vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
	vim.g.autoformat = not vim.g.autoformat
	vim.notify(string.format("%s formatting...", vim.g.autoformat and "Enabling" or "Disabling"), vim.log.levels.INFO)
end, { desc = "Toggle conform.nvim format on save", nargs = 0 })
