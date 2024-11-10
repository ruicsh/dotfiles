-- load env variables from a .env file
-- https://github.com/ellisonleao/dotenv.nvim

return {
	"ellisonleao/dotenv.nvim",
	config = function()
		local dotenv = require("dotenv")
		dotenv.setup()

		local init_file = vim.uv.fs_realpath(vim.fn.expand("~/.config/nvim/init.lua"))
		local path = vim.fs.dirname(init_file)
		local dotenv_file = vim.fs.joinpath(path, ".env")

		if vim.fn.filereadable(dotenv_file) then
			vim.cmd(":Dotenv " .. dotenv_file)
		end
	end,

	event = { "VimEnter" },
}
