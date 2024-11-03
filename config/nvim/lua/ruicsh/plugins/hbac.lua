-- buffer auto-close
-- https://github.com/axkirillov/hbac.nvim

return {
	"axkirillov/hbac.nvim",
	opts = {
		autoclose = true,
		threshold = 10,
		close_command = function(bufnr)
			vim.api.nvim_buf_delete(bufnr, {})
		end,
		close_buffers_with_windows = false,
	},

	event = { "BufReadPost", "BufNewFile" },
	cond = function()
		return not vim.g.vscode
	end,
}
