vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("ruicsh/TermOpen", { clear = true }),
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			-- don't show line numbers on terminal
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
			-- start on insert mode
			vim.cmd(":startinsert")
		end
	end,
})
