" Copyright (c) 2016-present Sven Greb <development@svengreb.de>
" This source code is licensed under the MIT license found in the license file.

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "nord"
let s:nord_vim_version="0.19.0"
set background=dark

let s:nord0 = "#2E3440"
let s:nord1 = "#3B4252"
let s:nord2 = "#434C5E"
let s:nord3 = "#4C566A"
let s:nord3_bright = "#616E88"
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

let s:nord1_term = "0"
let s:nord3_term = "8"
let s:nord5_term = "7"
let s:nord6_term = "15"
let s:nord7_term = "14"
let s:nord8_term = "6"
let s:nord9_term = "4"
let s:nord10_term = "12"
let s:nord11_term = "1"
let s:nord12_term = "11"
let s:nord13_term = "3"
let s:nord14_term = "2"
let s:nord15_term = "5"

let s:nord3_brightened = [
  \ s:nord3,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

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

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  let cmd = ""
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    let cmd = cmd . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    let cmd = cmd . " ctermbg=" . a:ctermbg
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
call s:hi("Bold", "", "", "", "", s:bold, "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:nord1, "NONE", s:nord1_term, "", "")
call s:hi("Cursor", s:nord0, s:nord4, "", "NONE", "", "")
call s:hi("CursorLine", "", s:nord0, "NONE", s:nord1_term, "NONE", "")
call s:hi("Error", s:nord4, s:nord11, "", s:nord11_term, "", "")
call s:hi("iCursor", s:nord0, s:nord4, "", "NONE", "", "")
call s:hi("LineNr", s:nord3, "NONE", s:nord3_term, "NONE", "", "")
call s:hi("MatchParen", s:nord13, "NONE", s:nord8_term, s:nord3_term, "", "")
call s:hi("NonText", s:nord2, "", s:nord3_term, "", "", "")
call s:hi("Normal", s:nord4, "NONE", "NONE", "NONE", "", "")
call s:hi("Pmenu", s:nord4, s:nord2, "NONE", s:nord1_term, "NONE", "")
call s:hi("PmenuSbar", s:nord4, s:nord2, "NONE", s:nord1_term, "", "")
call s:hi("PmenuSel", s:nord8, s:nord3, s:nord8_term, s:nord3_term, "", "")
call s:hi("PmenuThumb", s:nord8, s:nord3, "NONE", s:nord3_term, "", "")
call s:hi("SpecialKey", s:nord3, "", s:nord3_term, "", "", "")
call s:hi("SpellBad", s:nord11, s:nord0, s:nord11_term, "NONE", "undercurl", s:nord11)
call s:hi("SpellCap", s:nord13, s:nord0, s:nord13_term, "NONE", "undercurl", s:nord13)
call s:hi("SpellLocal", s:nord5, s:nord0, s:nord5_term, "NONE", "undercurl", s:nord5)
call s:hi("SpellRare", s:nord6, s:nord0, s:nord6_term, "NONE", "undercurl", s:nord6)
call s:hi("Visual", s:nord4, s:nord1, "", s:nord1_term, "", "")
call s:hi("VisualNOS", "", s:nord2, "", s:nord1_term, "", "")

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:nord1, "NONE", s:nord1_term, "", "")
call s:hi("CursorLineNr", s:nord4, "", "NONE", "", "NONE", "")
call s:hi("Folded", s:nord9, "NONE", s:nord3_term, s:nord1_term, s:bold, "")
call s:hi("FoldColumn", s:nord3, "NONE", s:nord3_term, "NONE", "", "")
call s:hi("SignColumn", s:nord4, "NONE", s:nord1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:nord8, "", s:nord8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:nord1, "", s:nord1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:nord4, s:nord11, "NONE", s:nord11_term, "", "")
call s:hi("ModeMsg", s:nord4, "", "", "", "", "")
call s:hi("MoreMsg", s:nord8, "", s:nord8_term, "", "", "")
call s:hi("Question", s:nord4, "", "NONE", "", "", "")
call s:hi("StatusLine", s:nord4, s:nord0, s:nord8_term, s:nord3_term, "NONE", "")
call s:hi("StatusLineNC", s:nord4, s:nord1, "NONE", s:nord1_term, "NONE", "")
call s:hi("StatusLineTerm", s:nord8, s:nord3, s:nord8_term, s:nord3_term, "NONE", "")
call s:hi("StatusLineTermNC", s:nord4, s:nord1, "NONE", s:nord1_term, "NONE", "")
call s:hi("WarningMsg", s:nord0, s:nord13, s:nord1_term, s:nord13_term, "", "")
call s:hi("WildMenu", s:nord8, "NONE", s:nord8_term, s:nord1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:nord0, s:nord9, s:nord6_term, s:nord10_term, s:underline, "")
call s:hi("Search", s:nord1, s:nord8, s:nord1_term, s:nord8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:nord4, s:nord1, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineFill", s:nord4, s:nord1, "NONE", s:nord1_term, "NONE", "")
call s:hi("TabLineSel", s:nord8, s:nord3, s:nord8_term, s:nord3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:nord4, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:nord2, "NONE", s:nord1_term, "NONE", "NONE", "")

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("Character", s:nord14, "", s:nord14_term, "", "", "")
call s:hi("Comment", s:nord3_bright, "", s:nord3_term, "", s:italicize_comments, "")
call s:hi("Conceal", "", "NONE", "", "NONE", "", "")
call s:hi("Conditional", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("Constant", s:nord4, "", "NONE", "", "", "")
call s:hi("Decorator", s:nord12, "", s:nord12_term, "", "", "")
call s:hi("Define", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("Delimiter", s:nord6, "", s:nord6_term, "", "", "")
call s:hi("Exception", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("Float", s:nord15, "", s:nord15_term, "", "", "")
call s:hi("Function", s:nord8, "", s:nord8_term, "", "", "")
call s:hi("Identifier", s:nord4, "", "NONE", "", "NONE", "")
call s:hi("Include", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("Keyword", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("Label", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("Number", s:nord15, "", s:nord15_term, "", "", "")
call s:hi("Operator", s:nord9, "", s:nord9_term, "", "NONE", "")
call s:hi("PreProc", s:nord9, "", s:nord9_term, "", "NONE", "")
call s:hi("Repeat", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("Special", s:nord4, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:nord13, "", s:nord13_term, "", "", "")
call s:hi("SpecialComment", s:nord8, "", s:nord8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("StorageClass", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("String", s:nord14, "", s:nord14_term, "", "", "")
call s:hi("Structure", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("Tag", s:nord4, "", "", "", "", "")
call s:hi("Todo", s:nord13, "NONE", s:nord13_term, "NONE", "", "")
call s:hi("Type", s:nord9, "", s:nord9_term, "", "NONE", "")
call s:hi("Typedef", s:nord9, "", s:nord9_term, "", "", "")
hi! link Annotation Decorator
hi! link Macro Define
hi! link PreCondit PreProc
hi! link Variable Identifier

"+-----------+
"+ Languages +
"+-----------+
call s:hi("asciidocAttributeEntry", s:nord10, "", s:nord10_term, "", "", "")
call s:hi("asciidocAttributeList", s:nord10, "", s:nord10_term, "", "", "")
call s:hi("asciidocAttributeRef", s:nord10, "", s:nord10_term, "", "", "")
call s:hi("asciidocHLabel", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("asciidocListingBlock", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("asciidocMacroAttributes", s:nord8, "", s:nord8_term, "", "", "")
call s:hi("asciidocOneLineTitle", s:nord8, "", s:nord8_term, "", "", "")
call s:hi("asciidocPassthroughBlock", s:nord9, "", s:nord9_term, "", "", "")
call s:hi("asciidocQuotedMonospaced", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("asciidocTriplePlusPassthrough", s:nord7, "", s:nord7_term, "", "", "")
hi! link asciidocAdmonition Keyword
hi! link asciidocAttributeRef markdownH1
hi! link asciidocBackslash Keyword
hi! link asciidocMacro Keyword
hi! link asciidocQuotedBold Bold
hi! link asciidocQuotedEmphasized Italic
hi! link asciidocQuotedMonospaced2 asciidocQuotedMonospaced
hi! link asciidocQuotedUnconstrainedBold asciidocQuotedBold
hi! link asciidocQuotedUnconstrainedEmphasized asciidocQuotedEmphasized
hi! link asciidocURL markdownLinkText

call s:hi("awkCharClass", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("awkPatterns", s:nord9, "", s:nord9_term, "", s:bold, "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:nord7, "", s:nord7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit
hi! link cConstant Type

call s:hi("cmakeGeneratorExpression", s:nord10, "", s:nord10_term, "", "", "")

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("cssDefinition", s:nord7, "", s:nord7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:nord7, "", s:nord7_term, "", s:underline, "")
call s:hi("cssStringQ", s:nord7, "", s:nord7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:nord8, "", s:nord8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("dtExecKey", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("dtLocaleKey", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("dtNumericKey", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("dtTypeKey", s:nord7, "", s:nord7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

call s:hi("DiffAdd", "NONE", s:nord14_800, s:nord14_term, "NONE", "", "")
call s:hi("DiffChange", s:nord13, s:nord0, s:nord13_term, "NONE", "", "")
call s:hi("DiffDelete", s:nord11_900, s:nord0, s:nord11_term, "NONE", "inverse", "")
call s:hi("DiffText", "NONE", s:nord3, s:nord9_term, "NONE", "", "")
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("elixirModuleDeclaration", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("elixirAlias", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("elixirAtom", s:nord6, "", s:nord6_term, "", s:bold, "")

call s:hi("gitconfigVariable", s:nord7, "", s:nord7_term, "", "", "")

call s:hi("goBuiltins", s:nord7, "", s:nord7_term, "", "", "")
hi! link goConstants Keyword

" fatih/vim-go
call s:hi("gomodVersion", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("gomodGoVersion", s:nord8, "", s:nord8_term, "", "", "")

call s:hi("helpBar", s:nord3, "", s:nord3_term, "", "", "")
call s:hi("helpHyperTextJump", s:nord8, "", s:nord8_term, "", s:underline, "")

call s:hi("htmlArg", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("htmlLink", s:nord4, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:nord7, "", s:nord7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:nord7, "", s:nord7_term, "", "", "")

call s:hi("lessClass", s:nord7, "", s:nord7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("markdownCode", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("markdownFootnote", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("markdownId", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("markdownH1", s:nord8, "", s:nord8_term, "", "", "")
call s:hi("markdownLinkText", s:nord8, "", s:nord8_term, "", "", "")
call s:hi("markdownUrl", s:nord4, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:nord7, "", s:nord7_term, "", "", "")

call s:hi("phpClasses", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("phpDocTags", s:nord7, "", s:nord7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("podVerbatimLine", s:nord4, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("rubySymbol", s:nord6, "", s:nord6_term, "", s:bold, "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("rustAttribute", s:nord10, "", s:nord10_term, "", "", "")
call s:hi("rustEnum", s:nord7, "", s:nord7_term, "", s:bold, "")
call s:hi("rustMacro", s:nord8, "", s:nord8_term, "", s:bold, "")
call s:hi("rustModPath", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("rustPanic", s:nord9, "", s:nord9_term, "", s:bold, "")
call s:hi("rustTrait", s:nord7, "", s:nord7_term, "", s:italic, "")
hi! link rustCommentLineDoc Comment
hi! link rustDerive rustAttribute
hi! link rustEnumVariant rustEnum
hi! link rustEscape SpecialChar
hi! link rustQuestionMark Keyword

call s:hi("sassClass", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("sassId", s:nord7, "", s:nord7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("vimMapRhs", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("vimNotation", s:nord7, "", s:nord7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:nord7, "", s:nord7_term, "", "", "")
call s:hi("xmlCdataStart", s:nord3_bright, "", s:nord3_term, "", s:bold, "")
call s:hi("xmlNamespace", s:nord7, "", s:nord7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:nord7, "", s:nord7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+------------+
"+ Public API +
"+------------+
"+--- Functions ---+

function! NordPalette() abort
  let ret = {}
  for color in range(16)
    execute 'let ret["nord'.color.'"] = s:nord'.color.''
  endfor
  let ret["nord3_bright"] = s:nord3_bright
  return ret
endfunction
