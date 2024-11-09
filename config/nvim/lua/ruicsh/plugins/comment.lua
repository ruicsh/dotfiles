-- comments
-- https://github.com/numToStr/Comment.nvim

return {
	"numToStr/Comment.nvim",
	config = function()
		local comment = require("Comment")
		comment.setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,

	dependencies = {
		{ -- comments on embbeded languages (ex: html inside ts, css inside html)
			-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = {
				enable_autocmd = false,
			},
		},
	},
}
