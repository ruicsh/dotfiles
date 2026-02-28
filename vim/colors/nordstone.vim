hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "nordstone"
set background=dark

let s:nord0 = "#2E3440"
let s:nord1 = "#3B4252"
let s:nord2 = "#434C5E"
let s:nord3 = "#4C566A"
let s:nord3_500 = "#616E88"
let s:nord3_700 = "#8c97ad"
let s:nord3_900 = "#b7becb"
let s:nord4 = "#D8DEE9"
let s:nord5 = "#E5E9F0"
let s:nord6 = "#ECEFF4"
let s:nord7 = "#8FBCBB"
let s:nord8 = "#88C0D0"
let s:nord9 = "#81A1C1"
let s:nord10 = "#5E81AC"
let s:nord11 = "#BF616A"
let s:nord11_900 = "#3c181c"
let s:nord12 = "#D08770"
let s:nord13 = "#EBCB8B"
let s:nord14 = "#A3BE8C"
let s:nord14_800 = "#202a18"
let s:nord15 = "#B48EAD"

let s:neutral_900 = "#171717"
let s:neutral_880 = "#181818"
let s:neutral_850 = "#1a1a1a"
let s:neutral_800 = "#262626"
let s:neutral_700 = "#404040"
let s:neutral_600 = "#525252"
let s:neutral_500 = "#71717a"
let s:neutral_400 = "#a1a1aa"

let g:nord_bold = get(g:, "nord_bold", 1)
let s:bold = (g:nord_bold == 0) ? "" : "bold,"

let g:nord_underline = get(g:, "nord_underline", 1)
let s:underline = (g:nord_underline == 0) ? "NONE," : "underline,"

let g:nord_italic = get(g:, "nord_italic", (has("gui_running") || $TERM_ITALICS == "true"))
let s:italic = (g:nord_italic == 0) ? "" : "italic,"

let g:nord_italic_comments = get(g:, "nord_italic_comments", 0)
let s:italicize_comments = (g:nord_italic_comments == 0) ? "" : get(s:, "italic")

let g:nord_uniform_status_lines = get(g:, "nord_uniform_status_lines", 0)

let g:nord_bold_vertical_split_line = get(g:, "nord_bold_vertical_split_line", 0)
let g:nord_cursor_line_number_background = get(g:, "nord_cursor_line_number_background", 0)
let g:nord_uniform_diff_background = get(g:, "nord_uniform_diff_background", 0)

function! s:hi(group, guifg, guibg, attr, guisp)
  let cmd = ""
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:attr != ""
    let cmd = cmd . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    let cmd = cmd . " guisp=" . a:guisp
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", s:bold, "")
call s:hi("Italic", "", "", s:italic, "")
call s:hi("Underline", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", "", "", "")
call s:hi("CommandMode", s:nord4, s:nord1, "reverse", "")
call s:hi("Conceal", s:nord1, "", "", "")
call s:hi("CurSearch", s:nord1, s:nord9, "", "")
call s:hi("Cursor", s:nord4, "", "reverse", "")
call s:hi("CursorColumn", "", s:nord0, "", "")
call s:hi("CursorLine", "", s:neutral_800, "NONE", "")
call s:hi("CursorLineNr", s:nord4, "", "NONE", "")
call s:hi("DiffAdd", "", s:nord14_800, "", "")
call s:hi("DiffChange", "", s:nord0, "", "")
call s:hi("DiffDelete", "", s:nord11_900, "", "")
call s:hi("DiffText", "", s:nord3, "", "")
call s:hi("Directory", s:nord9, "", "", "")
call s:hi("EndOfBuffer", s:nord1, "", "", "")
call s:hi("Error", s:nord4, s:nord11, "", "")
call s:hi("ErrorMsg", s:nord4, s:nord11, "", "")
call s:hi("FloatBorder", s:neutral_600, "NONE", "", "")
call s:hi("FloatTitle", s:nord4, "NONE", "", "")
call s:hi("FoldColumn", s:nord3_500, "NONE", "", "")
call s:hi("Folded", s:nord9, "NONE", s:bold, "")
call s:hi("IncSearch", s:nord0, s:nord9, s:underline, "")
call s:hi("InsertMode", s:nord14, "NONE", "reverse", "")
call s:hi("LineNr", s:neutral_500, "NONE", "", "")
call s:hi("MatchParen", s:nord13, "NONE", "bold", "")
call s:hi("ModeMsg", s:nord4, "", "", "")
call s:hi("MoreMsg", s:nord4, "", "", "")
call s:hi("NonText", s:nord1, "", "", "")
call s:hi("Normal", s:nord4, "NONE", "", "")
call s:hi("Pmenu", s:nord4, "NONE", "NONE", "")
call s:hi("PmenuExtra", s:nord8, "NONE", "NONE", "")
call s:hi("PmenuExtraSel", s:nord1, s:nord9, "", "")
call s:hi("PmenuKindSel", s:nord1, s:nord9, "", "")
call s:hi("PmenuSbar", "", s:nord0, "", "")
call s:hi("PmenuSel", s:nord0, s:nord9, "", "")
call s:hi("PmenuThumb", "", s:nord3_500, "", "")
call s:hi("Question", s:nord14, "", "", "")
call s:hi("Search", "", s:nord2, "NONE", "")
call s:hi("SignColumn", s:nord4, "NONE", "", "")
call s:hi("Special", s:nord7, "", "", "")
call s:hi("SpecialKey", s:nord9, "", "", "")
call s:hi("SpellBad", s:nord12, "", "undercurl", s:nord12)
call s:hi("SpellCap", s:nord7, "", "undercurl", s:nord7)
call s:hi("SpellLocal", s:nord8, "", "undercurl", s:nord8)
call s:hi("SpellRare", s:nord9, "", "undercurl", s:nord9)
call s:hi("StatusLine", s:nord4, "NONE", "NONE", "")
call s:hi("StatusLineNC", s:nord4, "NONE", "NONE", "")
call s:hi("StatusLineTerm", s:nord4, "", "NONE", "")
call s:hi("StatusLineTermNC", s:nord4, "", "NONE", "")
call s:hi("TabLine", s:nord3_900, "", "", "")
call s:hi("TabLineFill", "", "", "", "")
call s:hi("TabLineSel", s:nord3_900, "", "NONE", "")
call s:hi("Title", s:nord4, "NONE", "bold", "")
call s:hi("ToolbarButton", s:nord4, "NONE", "bold", "")
call s:hi("ToolbarLine", s:nord4, s:nord1, "", "")
call s:hi("VertSplit", s:nord2, "NONE", "NONE", "")
call s:hi("Visual", s:nord4, s:nord1, "", "")
call s:hi("VisualMode", s:nord0, s:nord9, "", "")
call s:hi("WarningMsg", s:nord15, "", "", "")
call s:hi("Warnings", s:nord15, "", "", "")
call s:hi("WildMenu", s:nord12, "NONE", "bold", "")
call s:hi("WinSeparator", s:neutral_600, "NONE", "", "")

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:nord9, "", "", "")
call s:hi("Character", s:nord14, "", "", "")
call s:hi("Comment", s:nord3_500, "", s:italicize_comments, "")
call s:hi("Conceal", "", "NONE", "", "")
call s:hi("Conditional", s:nord9, "", "", "")
call s:hi("Constant", s:nord13, "", "", "")
call s:hi("Decorator", s:nord12, "", "", "")
call s:hi("Define", s:nord9, "", "", "")
call s:hi("Delimiter", s:nord3_700, "", "", "")
call s:hi("Exception", s:nord9, "", "", "")
call s:hi("Float", s:nord15, "", "", "")
call s:hi("Function", s:nord8, "", "", "")
call s:hi("Identifier", s:nord9, "", "NONE", "")
call s:hi("Include", s:nord9, "", "", "")
call s:hi("Keyword", s:nord9, "", "", "")
call s:hi("Label", s:nord9, "", "", "")
call s:hi("Number", s:nord15, "", "", "")
call s:hi("Operator", s:nord9, "", "NONE", "")
call s:hi("PreProc", s:nord9, "", "NONE", "")
call s:hi("Repeat", s:nord9, "", "", "")
call s:hi("Special", s:nord4, "", "", "")
call s:hi("SpecialChar", s:nord13, "", "", "")
call s:hi("SpecialComment", s:nord8, "", s:italicize_comments, "")
call s:hi("Statement", s:nord9, "", "", "")
call s:hi("StorageClass", s:nord9, "", "", "")
call s:hi("String", s:nord14, "", "", "")
call s:hi("Structure", s:nord9, "", "", "")
call s:hi("Tag", s:nord4, "", "", "")
call s:hi("Title", s:nord9, "", "bold", "")
call s:hi("Todo", s:nord13, "NONE", "", "")
call s:hi("Type", s:nord8, "", "NONE", "")
call s:hi("Typedef", s:nord9, "", "", "")

"+----------------------+
"+ Languages
"+----------------------+

" CSS
call s:hi("cssAttr", s:nord9, "", "", "")
call s:hi("cssProp", s:nord4, "", "", "")
call s:hi("cssUnitDecorators", s:nord9, "", "", "")


" HTML
call s:hi("htmlArg", s:nord7, "", "", "")
call s:hi("htmlTag", s:nord9, "", "", "")
call s:hi("htmlTagN", s:nord8, "", "", "")

" JSON
hi link jsonNull Boolean

" Markdown
hi link markdownHeadingDelimiter Title
call s:hi("markdownCode", s:nord7, "", "", "")
hi link markdownCodeBlock markdownCode
call s:hi("markdownLinkText", s:nord8, "", "", "")
call s:hi("markdownUrl", s:nord4, "", "", "")

" Sass
call s:hi("sassMedia", s:nord12, "", "", "")

" TSX
hi link tsxIntrinsicTagName htmlTag

" TypeScript
hi link typescriptEnum Type
hi link typescriptImport Keyword
hi link typescriptExport Keyword
hi link typescriptImportType Keyword
hi link typescriptMember Variable
hi link typescriptTypeReference Type
hi link typescriptIdentifierName Constant

