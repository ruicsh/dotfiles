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
k.set("n", "<leader>nc", ac("workbench.action.showCommands"))

-- explorer
k.set("n", "\\", ac("workbench.files.action.focusFilesExplorer"))
k.set("n", "<leader><leader>", ac("workbench.action.quickOpen"))

-- settings
k.set("n", "<leader>nk", ac("workbench.action.openGlobalKeybindings"))
k.set("n", "<leader>nK", ac("workbench.action.openGlobalKeybindingsFile"))
k.set("n", "<leader>n,", ac("workbench.action.openGlobalSettings"))
k.set("n", "<leader>n<", ac("workbench.action.openSettingsJson"))

-- search
k.set("n", "<leader>fr", ac("actions.find"))
k.set("n", "<leader>s", ac("workbench.action.findInFiles"))

-- opened files
k.set("n", "[b", ac("workbench.action.previousEditorInGroup"))
k.set("n", "]b", ac("workbench.action.nextEditorInGroup"))
k.set("n", "<bs>", ac("workbench.action.openPreviousRecentlyUsedEditor"))
k.set("n", "<s-bs>", ac("workbench.action.openNextRecentlyUsedEditor"))
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
k.set("n", "go", ac("editor.action.goToTypeDefinition"))
k.set("n", "gr", ac("references-view.findReferences"))
k.set("n", "gs", ac("workbench.action.gotoSymbol"))
k.set("n", "gS", ac("workbench.action.showAllSymbols"))
k.set("n", "[r", ac("editor.action.wordHighlight.prev"))
k.set("n", "]r", ac("editor.action.wordHighlight.next"))
k.set("n", "<f4>", ac("editor.action.refactor"))

-- lsp - typescript
k.set("n", "<leader>to", ac("editor.action.organizeImports"))
k.set("n", "<leader>ts", ac("typescript.sortImports"))
k.set("n", "<leader>tu", ac("typescript.removeUnusedImports"))
k.set("n", "<leader>td", ac("typescript.goToSourceDefinition"))

-- syntax
k.set({ "n", "x" }, "[n", ac("editor.action.smartSelect.expand"))
k.set({ "n", "x" }, "]n", ac("editor.action.smartSelect.shrink"))

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

-- pinned tabs
k.set("n", "§1", ac("vscode-harpoon.gotoEditor1"))
k.set("n", "$2", ac("vscode-harpoon.gotoEditor2"))
k.set("n", "$3", ac("vscode-harpoon.gotoEditor3"))
k.set("n", "$4", ac("vscode-harpoon.gotoEditor4"))
k.set("n", "$5", ac("vscode-harpoon.gotoEditor5"))
k.set("n", "$6", ac("vscode-harpoon.gotoEditor6"))
k.set("n", "$7", ac("vscode-harpoon.gotoEditor7"))
k.set("n", "$8", ac("vscode-harpoon.gotoEditor8"))
k.set("n", "$9", ac("vscode-harpoon.gotoEditor9"))
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
