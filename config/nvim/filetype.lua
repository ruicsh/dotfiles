vim.filetype.add({
	extension = {
		conf = "conf",
		env = "dotenv",
	},
	filename = {
		[".env"] = "dotenv",
		["tsconfig.json"] = "jsonc",
	},
	pattern = {
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})
