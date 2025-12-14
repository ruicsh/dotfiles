local vim = vim

-- NordStone theme

-- UTILITIES

-- Set highlight group
local function hl(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""

	local h = table.concat({
		"highlight",
		group,
		style,
		fg,
		bg,
		sp,
	}, " ")

	vim.cmd(h)
	if color.link then
		vim.cmd("highlight! link " .. group .. " " .. color.link)
	end
end

-- Load a set of colours
local function loadColorSet(colorSet)
	for group, colors in pairs(colorSet) do
		hl(group, colors)
	end
end

vim.g.colors_name = "nordstone"

-- COLOURS

local NordStoneColors = {
	nord0 = "#2e3440",
	nord1 = "#3b4252",
	nord2 = "#434c5e",
	nord3 = "#4c566a",
	nord3_500 = "#616e88",
	nord3_700 = "#8c97ad",
	nord3_900 = "#b7becb",
	nord4 = "#d8dee9",
	nord4_900 = "#b7c2d7",
	nord5 = "#e5e9f0",
	nord6 = "#eceff4",
	nord7 = "#8fbcbb",
	nord8 = "#88c0d0",
	nord9 = "#81a1c1",
	nord10 = "#5e81ac",
	nord11 = "#bf616a",
	nord11_900 = "#3c181c",
	nord12 = "#d08770",
	nord13 = "#ebcb8b",
	nord14 = "#a3be8c",
	nord14_800 = "#202a18",
	nord15 = "#b48ead",
	neutral_900 = "#171717",
	neutral_880 = "#181818",
	neutral_850 = "#1a1a1a",
	neutral_800 = "#262626",
	neutral_700 = "#404040",
	neutral_600 = "#525252",
	neutral_500 = "#71717a",
	neutral_400 = "#a1a1aa",
}

local c = NordStoneColors

-- PLUGINS

-- flash.nvim
loadColorSet({
	FlashLabel = { fg = c.nord0, bg = c.nord13 },
})
