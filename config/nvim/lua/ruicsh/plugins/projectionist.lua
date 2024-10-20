-- alternate files (missing from vscode)
-- https://github.com/tpope/vim-projectionist

return {
	"tpope/vim-projectionist",
	config = function()
		vim.g.projectionist_heuristics = {
			["*"] = {
				-- angular / template / scss
				["*.component.ts"] = { alternate = { "{}.component.html", "{}.component.scss" } },
				["*.component.html"] = { alternate = { "{}.component.ts" } },
				["*.component.scss"] = { alternate = { "{}.component.ts" } },
				-- source / tests
				["*.ts"] = { alternate = { "{}.spec.ts", "{}.test.ts" } },
				["*.spec.ts"] = { alternate = "{}.ts" },
				["*.test.ts"] = { alternate = "{}.ts" },
				-- react / scss
				["*.tsx"] = { alternate = { "{}.scss", "{}.module.scss" } },
				["*.scss"] = { alternate = "{}.tsx" },
				["*.module.scss"] = { alternate = "{}.tsx" },
			},
		}
	end,

	event = { "BufReadPost" },
	cond = function()
		return not vim.g.vscode
	end,
}

