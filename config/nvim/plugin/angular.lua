vim.filetype.add({
	pattern = {
		[".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "htmlangular",
	callback = function()
		vim.treesitter.language.register("angular", "htmlangular")
	end,
})
