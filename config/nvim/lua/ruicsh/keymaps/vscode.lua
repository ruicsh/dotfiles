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
vim.keymap.set("n", "<leader>g", ac("workbench.view.scm"))
vim.keymap.set("n", "<leader>vb", ac("workbench.action.toggleSidebarVisibility"))
vim.keymap.set("n", "\\", ac("workbench.files.action.focusFilesExplorer"))
vim.keymap.set("n", "<leader>kz", ac("workbench.action.toggleZenMode"))
vim.keymap.set("n", "<leader>sr", ac("actions.find"))

-- tabs
vim.keymap.set("n", "[t", ac("workbench.action.previousEditorInGroup"))
vim.keymap.set("n", "]t", ac("workbench.action.nextEditorInGroup"))
vim.keymap.set("n", "<c-w>m", ac("workbench.action.toggleMaximizeEditorGroup"))
vim.keymap.set("n", "<c-w>o", ac("workbench.action.closeOtherEditors"))
vim.keymap.set("n", "<leader>b1", ac("workbench.action.openEditorAtIndex1"))
vim.keymap.set("n", "<leader>b2", ac("workbench.action.openEditorAtIndex2"))
vim.keymap.set("n", "<leader>b3", ac("workbench.action.openEditorAtIndex3"))
vim.keymap.set("n", "<leader>b4", ac("workbench.action.openEditorAtIndex4"))
vim.keymap.set("n", "<leader>b5", ac("workbench.action.openEditorAtIndex5"))
vim.keymap.set("n", "<leader>b6", ac("workbench.action.openEditorAtIndex6"))
vim.keymap.set("n", "<leader>b7", ac("workbench.action.openEditorAtIndex7"))
vim.keymap.set("n", "<leader>b8", ac("workbench.action.openEditorAtIndex8"))
vim.keymap.set("n", "<leader>b9", ac("workbench.action.openEditorAtIndex9"))
vim.keymap.set("n", "<leader>bc", ac("workbench.action.closeActiveEditor"))
vim.keymap.set("n", "<s-tab>", ac("workbench.action.openNextRecentlyUsedEditor"))
vim.keymap.set("n", "<tab>", ac("workbench.action.openPreviousRecentlyUsedEditor"))

-- lsp
vim.keymap.set("n", "gD", ac("editor.action.peekDefinition"))
vim.keymap.set("n", "gI", ac("editor.action.peekImplementation"))
vim.keymap.set("n", "gO", ac("editor.action.peekTypeDefinition"))
vim.keymap.set("n", "gR", ac("editor.action.goToReferences"))
vim.keymap.set("n", "gd", ac("editor.action.revealDefinition"))
vim.keymap.set("n", "gi", ac("references-view.findImplementations"))
vim.keymap.set("n", "go", ac("editor.action.goToTypeDefinition"))
vim.keymap.set("n", "gr", ac("references-view.findReferences"))

-- fuzzy find (equivalent to telescope)
vim.keymap.set("n", "<leader>fb", ac("workbench.action.showAllEditors"))
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

-- [[ VISUAL MODE ]]

-- native
vim.keymap.set("x", "<leader>ss", ac("editor.action.sortLinesAscending"))
vim.keymap.set("x", "<leader>sr", ac("actions.find"))
