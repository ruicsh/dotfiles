local c = require("ruicsh.theme.colors")
local _ = require("ruicsh.theme.util")

-- GitSigns
_.loadColorSet({
	GitSignsAdd = { fg = c.nord14 },
	GitSignsAddNr = { fg = c.nord14 },
	GitSignsAddLn = { fg = c.nord14 },
	GitSignsChange = { fg = c.nord13 },
	GitSignsChangeNr = { fg = c.nord13 },
	GitSignsChangeLn = { fg = c.nord13 },
	GitSignsDelete = { fg = c.nord11 },
	GitSignsDeleteNr = { fg = c.nord11 },
	GitSignsDeleteLn = { fg = c.nord11 },
	GitSignsCurrentLineBlame = { fg = c.nord3_500, style = "bold" },
})

-- Fugitive
_.loadColorSet({
	fugitiveUnmergedHeading = { fg = c.nord13 },
	fugitiveUntrackedHeading = { fg = c.nord11 },
	fugitiveStagedHeading = { fg = c.nord14 },
	fugitiveStashedHeading = { fg = c.nord12 },
	fugitiveRemoteHeading = { fg = c.nord9 },
	fugitiveMergedHeading = { fg = c.nord8 },
	fugitiveIgnoredHeading = { fg = c.nord3 },
	fugitiveUnstagedHeading = { fg = c.nord13 },
})

-- Telescope
_.loadColorSet({
	TelescopePromptBorder = { fg = c.nord4 },
	TelescopeResultsBorder = { fg = c.nord4 },
	TelescopePreviewBorder = { fg = c.nord4 },
	TelescopeSelectionCaret = { fg = c.nord9 },
	TelescopeSelection = { fg = c.nord6, bg = c.nord2 },
	TelescopeMatching = { link = "Search" },
})

-- WhichKey
_.loadColorSet({
	WhichKey = { fg = c.nord8, style = "bold" },
	WhichKeyGroup = { fg = c.nord5 },
	WhichKeyDesc = { fg = c.nord7, style = "italic" },
	WhichKeySeperator = { fg = c.nord9 },
	WhichKeyFloating = { bg = c.nord1 },
	WhichKeyFloat = { bg = c.nord1 },
	WhichKeyValue = { fg = c.nord7 },
})

-- Diff
_.loadColorSet({
	diffAdded = { fg = c.nord14 },
	diffRemoved = { fg = c.nord11 },
	diffChanged = { fg = c.nord15 },
	diffOldFile = { fg = c.nord13 },
	diffNewFile = { fg = c.nord12 },
	diffFile = { fg = c.nord7 },
	diffLine = { fg = c.nord3 },
	diffIndexLine = { fg = c.nord9 },
})

-- NeoTree
_.loadColorSet({
	NeoTreeGitDirty = { fg = c.nord13 },
	NeoTreeGitStaged = { fg = c.nord14 },
	NeoTreeGitMerge = { fg = c.nord8 },
	NeoTreeGitRenamed = { fg = c.nord12 },
	NeoTreeGitNew = { fg = c.nord14 },
	NeoTreeGitUntracked = { fg = c.nord14 },
})

-- hlsearch
_.loadColorSet({
	HlSearchNear = { bg = c.nord10 },
})

-- avante
_.loadColorSet({
	AvanteInlineHint = { fg = c.nord3 },
})

-- vim-iluminate
_.loadColorSet({
	IlluminatedWordText = { bg = c.nord2 },
	IlluminatedWordRead = { bg = c.nord2 },
	IlluminatedWordWrite = { bg = c.nord2 },
})
