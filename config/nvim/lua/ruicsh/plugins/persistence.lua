-- session management
-- https://github.com/folke/persistence.nvim

return {
	"folke/persistence.nvim",
	keys = function()
		local persistence = require("persistence")
		local load_last_session = function()
			persistence.load({ last = true })
		end

		return {
			{ "<leader>ws", persistence.load, "Session: Load" },
			{ "<leader>wS", persistence.select, "Session: Pick" },
			{ "<leader>wl", load_last_session, "Session: Load last" },
			{ "<leader>wd", persistence.stop, "Session: Stop saving" },
		}
	end,
	opts = {},

	event = { "BufReadPre" },
	cond = function()
		return not vim.g.vscode
	end,
}
