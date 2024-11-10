-- Detect and set the proper file type for Angular Template files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.component.html",
	desc = "Detect and set the proper file type for Angular Template files",
	callback = function()
		vim.cmd("set filetype=htmlangular")
	end,
})
