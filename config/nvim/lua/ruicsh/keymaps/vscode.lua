if not vim.g.vscode then
	return
end

-- run vscode action
local function ac(action)
	return function()
		require("vscode").action(action)
	end
end

-- [[ NORMAL MODE ]]

-- native
vim.keymap.set("n", "<leader>gg", ac("workbench.view.scm"))
vim.keymap.set("n", "<leader>vb", ac("workbench.action.toggleSidebarVisibility"))
vim.keymap.set("n", "\\", ac("workbench.files.action.focusFilesExplorer"))
vim.keymap.set("n", "<leader>sr", ac("actions.find"))
vim.keymap.set("n", "<c-t>", ac("workbench.action.terminal.new"))

-- tabs
vim.keymap.set("n", "[b", ac("workbench.action.previousEditorInGroup"))
vim.keymap.set("n", "]b", ac("workbench.action.nextEditorInGroup"))
vim.keymap.set("n", "<tab>", ac("workbench.action.openPreviousRecentlyUsedEditor"))
vim.keymap.set("n", "<s-tab>", ac("workbench.action.openNextRecentlyUsedEditor"))
vim.keymap.set("n", "<leader><leader>", ac("workbench.action.showAllEditors"))
vim.keymap.set("n", "<leader>bc", ac("workbench.action.closeActiveEditor"))
vim.keymap.set("n", "<leader>bC", ac("workbench.action.closeAllEditors"))
vim.keymap.set("n", "<leader>bo", ac("workbench.action.closeOtherEditors"))

-- splits
vim.keymap.set("n", "<c-w>m", ac("workbench.action.toggleMaximizeEditorGroup"))

-- lsp
vim.keymap.set("n", "<leader>cD", ac("editor.action.peekDefinition"))
vim.keymap.set("n", "<leader>cI", ac("editor.action.peekImplementation"))
vim.keymap.set("n", "<leader>cO", ac("editor.action.peekTypeDefinition"))
vim.keymap.set("n", "<leader>cR", ac("editor.action.goToReferences"))
vim.keymap.set("n", "<leader>cd", ac("editor.action.revealDefinition"))
vim.keymap.set("n", "<leader>cn", ac("editor.action.rename"))
vim.keymap.set("n", "<leader>co", ac("editor.action.goToTypeDefinition"))
vim.keymap.set("n", "<leader>cr", ac("references-view.findReferences"))
vim.keymap.set("n", "<leader>cs", ac("workbench.action.gotoSymbol"))
vim.keymap.set("n", "<leader>cw", ac("workbench.action.showAllSymbols"))
vim.keymap.set("n", "[r", ac("editor.action.wordHighlight.prev"))
vim.keymap.set("n", "]r", ac("editor.action.wordHighlight.next"))

-- fuzzy find (equivalent to telescope)
vim.keymap.set("n", "<leader>fc", ac("workbench.action.showCommands"))
vim.keymap.set("n", "<leader>ff", ac("workbench.action.quickOpen"))
vim.keymap.set("n", "<leader>fg", ac("workbench.action.findInFiles"))

-- folds
vim.keymap.set("n", "za", ac("editor.toggleFold"))
vim.keymap.set("n", "zA", ac("editor.toggleFoldRecursively"))
vim.keymap.set("n", "zC", ac("editor.foldRecursively"))
vim.keymap.set("n", "zM", ac("editor.foldAll"))
vim.keymap.set("n", "zO", ac("editor.unfoldRecursively"))
vim.keymap.set("n", "zR", ac("editor.unfoldAll"))
vim.keymap.set("n", "zc", ac("editor.fold"))
vim.keymap.set("n", "zo", ac("editor.unfold"))
vim.keymap.set("n", "[z", ac("editor.gotoParentFold"))
vim.keymap.set("n", "zk", ac("editor.gotoPreviousFold"))
vim.keymap.set("n", "zj", ac("editor.gotoNextFold"))

-- harpoon
vim.keymap.set("n", "<leader>1", ac("vscode-harpoon.gotoEditor1"))
vim.keymap.set("n", "<leader>2", ac("vscode-harpoon.gotoEditor2"))
vim.keymap.set("n", "<leader>3", ac("vscode-harpoon.gotoEditor3"))
vim.keymap.set("n", "<leader>4", ac("vscode-harpoon.gotoEditor4"))
vim.keymap.set("n", "<leader>5", ac("vscode-harpoon.gotoEditor5"))
vim.keymap.set("n", "<leader>6", ac("vscode-harpoon.gotoEditor6"))
vim.keymap.set("n", "<leader>7", ac("vscode-harpoon.gotoEditor7"))
vim.keymap.set("n", "<leader>8", ac("vscode-harpoon.gotoEditor8"))
vim.keymap.set("n", "<leader>9", ac("vscode-harpoon.gotoEditor9"))
vim.keymap.set("n", "<leader>ha", ac("vscode-harpoon.addEditor"))
vim.keymap.set("n", "<leader>hh", ac("vscode-harpoon.editEditors"))
vim.keymap.set("n", "<leader>hn", ac("vscode-harpoon.navigateNextEditor"))
vim.keymap.set("n", "<leader>hp", ac("vscode-harpoon.navigatePreviousEditor"))

-- git
vim.keymap.set("n", "<leader>gs", ac("git.stageSelectedRanges"))
vim.keymap.set("n", "<leader>gr", ac("git.revertSelectedRanges"))
vim.keymap.set("n", "<leader>gu", ac("git.unstageSelectedRanges"))
vim.keymap.set("n", "<leader>gS", ac("git.stageFile"))
vim.keymap.set("n", "<leader>gR", ac("workbench.action.files.revert"))
vim.keymap.set("n", "<leader>gb", ac("gitlens.toggleFileBlame"))
vim.keymap.set("n", "<leader>gp", ac("git.openChange"))
vim.keymap.set("n", "[c", ac("workbench.action.editor.previousChange"))
vim.keymap.set("n", "]c", ac("workbench.action.editor.nextChange"))

-- [[ VISUAL MODE ]]

-- native
vim.keymap.set("x", "<leader>ss", ac("editor.action.sortLinesAscending"))
vim.keymap.set("x", "<leader>sr", ac("actions.find"))

-- move lines
vim.keymap.set("v", "J", ":move '>+1<cr>gv") -- move selected lines down
vim.keymap.set("v", "K", ":move '<-2<cr>gv") -- move selected lines up
