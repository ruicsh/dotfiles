local c = require("ruicsh.theme.colors")
local _ = require("ruicsh.theme.util")

-- editor
_.loadColorSet({
	ColorColumn = { fg = "NONE", bg = "NONE" },
	CommandMode = { fg = c.nord4, bg = "NONE", style = "reverse" },
	Conceal = { fg = c.nord1 },
	Cursor = { fg = c.nord4, bg = "NONE", style = "reverse" },
	CursorColumn = { fg = "NONE", bg = c.nord0 },
	CursorIM = { fg = c.nord5, bg = "NONE", style = "reverse" },
	CursorLine = { fg = "NONE", bg = c.nord0 },
	CursorLineNr = { fg = c.nord4 },
	Directory = { fg = c.nord4, bg = "NONE" },
	DiffAdd = { fg = c.nord14, bg = "NONE", style = "reverse" },
	DiffChange = { fg = c.nord13, bg = "NONE", style = "reverse" },
	DiffDelete = { fg = c.nord11, bg = "NONE", style = "reverse" },
	DiffText = { fg = c.nord15, bg = "NONE", style = "reverse" },
	EndOfBuffer = { fg = c.nord1 },
	ErrorMsg = { fg = "NONE" },
	FloatBorder = { fg = c.nord4, bg = "NONE" },
	FoldColumn = { fg = c.nord7 },
	Folded = { fg = c.nord3_1, bg = "NONE", style = "italic" },
	Function = { fg = c.nord8 },
	IncSearch = { fg = c.nord6, bg = c.nord10 },
	InsertMode = { fg = c.nord14, bg = "NONE", style = "reverse" },
	LineNr = { fg = c.nord3_1 },
	MatchParen = { fg = c.nord15, bg = "NONE", style = "bold" },
	ModeMsg = { fg = c.nord4 },
	MoreMsg = { fg = c.nord4 },
	NonText = { fg = c.nord1 },
	Normal = { fg = c.nord4, bg = c.stone1 },
	NormalFloat = { fg = c.nord4, bg = "NONE" },
	NormalMode = { fg = c.nord4, bg = "NONE", style = "reverse" },
	Pmenu = { fg = c.nord4, bg = c.nord2 },
	PmenuSbar = { fg = c.nord4, bg = c.nord2 },
	PmenuSel = { fg = c.nord4, bg = c.nord10 },
	PmenuThumb = { fg = c.nord4, bg = c.nord4 },
	qfLineNr = { fg = c.nord4, bg = "NONE", style = "reverse" },
	Question = { fg = c.nord14 },
	QuickFixLine = { fg = c.nord4, bg = "NONE", style = "reverse" },
	ReplacelMode = { fg = c.nord11, bg = "NONE", style = "reverse" },
	Search = { fg = c.nord6, bg = c.nord10 },
	Special = { fg = c.nord7 },
	SignColumn = { fg = c.nord4, bg = "NONE" },
	SpecialKey = { fg = c.nord9 },
	SpellBad = { fg = c.nord11, bg = "NONE", style = "italic,undercurl" },
	SpellCap = { fg = c.nord7, bg = "NONE", style = "italic,undercurl" },
	SpellLocal = { fg = c.nord8, bg = "NONE", style = "italic,undercurl" },
	SpellRare = { fg = c.nord9, bg = "NONE", style = "italic,undercurl" },
	StatusLine = { fg = c.nord4, bg = c.nord2 },
	StatusLineNC = { fg = c.nord4, bg = c.nord1 },
	StatusLineTerm = { fg = c.nord4, bg = c.nord2 },
	StatusLineTermNC = { fg = c.nord4, bg = c.nord1 },
	Substitute = { fg = c.nord0, bg = c.nord12 },
	Tabline = { fg = c.nord4, bg = c.nord1 },
	TabLineFill = { fg = c.nord4, bg = "NONE" },
	TablineSel = { fg = c.nord1, bg = c.nord9 },
	Title = { fg = c.nord14, bg = "NONE", style = "bold" },
	ToolbarButton = { fg = c.nord4, bg = "NONE", style = "bold" },
	ToolbarLine = { fg = c.nord4, bg = c.nord1 },
	VertSplit = { fg = c.nord2, bg = "NONE" },
	Visual = { fg = "NONE", bg = c.nord2 },
	VisualMode = { fg = c.nord9, bg = "NONE", style = "reverse" },
	VisualNOS = { fg = "NONE", bg = c.nord2 },
	WarningMsg = { fg = c.nord15 },
	Warnings = { fg = c.nord15 },
	WildMenu = { fg = c.nord12, bg = "NONE", style = "bold" },

	healthError = { fg = c.nord11 },
	healthSuccess = { fg = c.nord14 },
	healthWarning = { fg = c.nord15 },
})

-- lsp
_.loadColorSet({
	LspDiagnosticsDefaultError = { fg = c.nord11 },
	LspDiagnosticsSignError = { fg = c.nord11 },
	LspDiagnosticsFloatingError = { fg = c.nord11 },
	LspDiagnosticsVirtualTextError = { fg = c.nord11 },
	LspDiagnosticsUnderlineError = { style = "undercurl", sp = c.nord11 },
	LspDiagnosticsDefaultWarning = { fg = c.nord15 },
	LspDiagnosticsSignWarning = { fg = c.nord15 },
	LspDiagnosticsFloatingWarning = { fg = c.nord15 },
	LspDiagnosticsVirtualTextWarning = { fg = c.nord15 },
	LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = c.nord15 },
	LspDiagnosticsDefaultInformation = { fg = c.nord10 },
	LspDiagnosticsSignInformation = { fg = c.nord10 },
	LspDiagnosticsFloatingInformation = { fg = c.nord10 },
	LspDiagnosticsVirtualTextInformation = { fg = c.nord10 },
	LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = c.nord10 },
	LspDiagnosticsDefaultHint = { fg = c.nord9 },
	LspDiagnosticsSignHint = { fg = c.nord9 },
	LspDiagnosticsFloatingHint = { fg = c.nord9 },
	LspDiagnosticsVirtualTextHint = { fg = c.nord9 },
	LspDiagnosticsUnderlineHint = { style = "undercurl", sp = c.nord10 },
	LspReferenceText = { fg = c.nord4, bg = c.nord1 },
	LspReferenceRead = { fg = c.nord4, bg = c.nord1 },
	LspReferenceWrite = { fg = c.nord4, bg = c.nord1 },

	DiagnosticError = { link = "LspDiagnosticsDefaultError" },
	DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
	DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
	DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
	DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
	DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
	DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
	DiagnosticSignError = { link = "LspDiagnosticsSignError" },
	DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
	DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
	DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
	DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
	DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
	DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
	DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
	DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
	DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
	DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
	DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
	DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
})

-- terminal
vim.g.terminal_color_0 = c.nord1
vim.g.terminal_color_1 = c.nord11
vim.g.terminal_color_2 = c.nord14
vim.g.terminal_color_3 = c.nord13
vim.g.terminal_color_4 = c.nord9
vim.g.terminal_color_5 = c.nord15
vim.g.terminal_color_6 = c.nord8
vim.g.terminal_color_7 = c.nord5
vim.g.terminal_color_8 = c.nord3
vim.g.terminal_color_9 = c.nord11
vim.g.terminal_color_10 = c.nord14
vim.g.terminal_color_11 = c.nord13
vim.g.terminal_color_12 = c.nord9
vim.g.terminal_color_13 = c.nord15
vim.g.terminal_color_14 = c.nord7
vim.g.terminal_color_15 = c.nord6
