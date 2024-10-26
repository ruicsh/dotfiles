if not vim.g.vscode then
	return
end

local k = vim.keymap

-- run vscode action
local function ac(action)
	return function()
		require("vscode").action(action)
	end
end

-- [[ NORMAL MODE ]]

-- native
k.set("n", "<leader>vb", ac("workbench.action.toggleSidebarVisibility"))
k.set("n", "<c-t>", ac("workbench.action.terminal.new"))
k.set("n", "<up>c", ac("workbench.action.showCommands"))

-- explorer
k.set("n", "\\", ac("workbench.files.action.focusFilesExplorer"))
k.set("n", "<up>f", ac("workbench.action.quickOpen"))

-- settings
k.set("n", "<up>k", ac("workbench.action.openGlobalKeybindings"))
k.set("n", "<up>K", ac("workbench.action.openGlobalKeybindingsFile"))
k.set("n", "<up>n", ac("workbench.action.openGlobalSettings"))
k.set("n", "<up>N", ac("workbench.action.openSettingsJson"))

-- lsp - typescript
k.set("n", "<leader>toi", ac("editor.action.organizeImports"))
k.set("n", "<leader>tsi", ac("typescript.sortImports"))
k.set("n", "<leader>tui", ac("typescript.removeUnusedImports"))
k.set("n", "<leader>tcd", ac("typescript.goToSourceDefinition"))
k.set("n", "<leader>tcr", ac("typescript.findAllFileReferences"))

-- search
k.set("n", "<leader>sr", ac("actions.find"))
k.set("n", "<up>g", ac("workbench.action.findInFiles"))

-- tabs
k.set("n", "[b", ac("workbench.action.previousEditorInGroup"))
k.set("n", "]b", ac("workbench.action.nextEditorInGroup"))
k.set("n", "<tab>", ac("workbench.action.openPreviousRecentlyUsedEditor"))
k.set("n", "<s-tab>", ac("workbench.action.openNextRecentlyUsedEditor"))
k.set("n", "§", ac("workbench.action.showAllEditors"))
k.set("n", "<leader>bc", ac("workbench.action.closeActiveEditor"))
k.set("n", "<leader>bC", ac("workbench.action.closeAllEditors"))
k.set("n", "<leader>bo", ac("workbench.action.closeOtherEditors"))

-- splits
k.set("n", "|", ac("workbench.action.focusNextGroup"))
k.set("n", "<c-w>m", ac("workbench.action.toggleMaximizeEditorGroup"))
k.set("n", "<c-w>[", ac("workbench.action.moveEditorToLeftGroup"))
k.set("n", "<c-w>]", ac("workbench.action.moveEditorToRightGroup"))

-- lsp
k.set("n", "<leader>cD", ac("editor.action.peekDefinition"))
k.set("n", "<leader>cI", ac("editor.action.peekImplementation"))
k.set("n", "<leader>cO", ac("editor.action.peekTypeDefinition"))
k.set("n", "<leader>cR", ac("editor.action.goToReferences"))
k.set("n", "<leader>cd", ac("editor.action.revealDefinition"))
k.set("n", "<leader>cn", ac("editor.action.rename"))
k.set("n", "<leader>co", ac("editor.action.goToTypeDefinition"))
k.set("n", "<leader>cr", ac("references-view.findReferences"))
k.set("n", "<leader>cs", ac("workbench.action.gotoSymbol"))
k.set("n", "<leader>cw", ac("workbench.action.showAllSymbols"))
k.set("n", "[r", ac("editor.action.wordHighlight.prev"))
k.set("n", "]r", ac("editor.action.wordHighlight.next"))

-- folds
k.set("n", "za", ac("editor.toggleFold"))
k.set("n", "zA", ac("editor.toggleFoldRecursively"))
k.set("n", "zC", ac("editor.foldRecursively"))
k.set("n", "zM", ac("editor.foldAll"))
k.set("n", "zO", ac("editor.unfoldRecursively"))
k.set("n", "zR", ac("editor.unfoldAll"))
k.set("n", "zc", ac("editor.fold"))
k.set("n", "zo", ac("editor.unfold"))
k.set("n", "[z", ac("editor.gotoParentFold"))
k.set("n", "zk", ac("editor.gotoPreviousFold"))
k.set("n", "zj", ac("editor.gotoNextFold"))

-- harpoon
k.set("n", "<leader>1", ac("vscode-harpoon.gotoEditor1"))
k.set("n", "<leader>2", ac("vscode-harpoon.gotoEditor2"))
k.set("n", "<leader>3", ac("vscode-harpoon.gotoEditor3"))
k.set("n", "<leader>4", ac("vscode-harpoon.gotoEditor4"))
k.set("n", "<leader>5", ac("vscode-harpoon.gotoEditor5"))
k.set("n", "<leader>6", ac("vscode-harpoon.gotoEditor6"))
k.set("n", "<leader>7", ac("vscode-harpoon.gotoEditor7"))
k.set("n", "<leader>8", ac("vscode-harpoon.gotoEditor8"))
k.set("n", "<leader>9", ac("vscode-harpoon.gotoEditor9"))
k.set("n", "<leader>ha", ac("vscode-harpoon.addEditor"))
k.set("n", "<leader>hh", ac("vscode-harpoon.editEditors"))
k.set("n", "<leader>hn", ac("vscode-harpoon.navigateNextEditor"))
k.set("n", "<leader>hp", ac("vscode-harpoon.navigatePreviousEditor"))

-- git
k.set({ "n", "x" }, "<leader>gg", ac("workbench.view.scm"))
-- k.set({ "n", "x" }, "<leader>gg", ac("fugitive.open")) -- while fugitive isn't ready
k.set({ "n", "x" }, "<leader>gs", ac("git.stageSelectedRanges"))
k.set({ "n", "x" }, "<leader>gu", ac("git.unstageSelectedRanges"))
k.set({ "n", "x" }, "<leader>gr", ac("git.revertSelectedRanges"))
k.set("n", "<leader>gS", ac("git.stage"))
k.set("n", "<leader>gU", ac("git.unstage"))
k.set("n", "<leader>gR", ac("workbench.action.files.revert"))
k.set("n", "<leader>gb", ac("gitlens.toggleFileBlame"))
k.set("n", "<leader>gp", ac("git.openChange"))
k.set("n", "[c", ac("workbench.action.editor.previousChange"))
k.set("n", "]c", ac("workbench.action.editor.nextChange"))

-- misc
k.set("n", "<leader>a", "<nop>") -- while projectionist doesn't work on vscode

-- [[ VISUAL MODE ]]

-- native
k.set("x", "<leader>s", ac("editor.action.sortLinesAscending"))
k.set("x", "<leader>sr", ac("actions.find"))

-- move lines
k.set("v", "J", ":move '>+1<cr>gv") -- move selected lines down
k.set("v", "K", ":move '<-2<cr>gv") -- move selected lines up
