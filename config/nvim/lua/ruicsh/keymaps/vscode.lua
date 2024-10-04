if not vim.g.vscode then
	return
end

-- run vscode action
local function ac(action)
	return function()
		require("vscode").action(action)
	end
end

-- [[ native ]]
vim.keymap.set("n", "<leader>g", ac("workbench.view.scm"))
vim.keymap.set("n", "<leader>vb", ac("workbench.action.toggleSidebarVisibility"))
vim.keymap.set("n", "\\", ac("workbench.files.action.focusFilesExplorer"))
vim.keymap.set("n", "<leader>kz", ac("workbench.action.toggleZenMode"))

-- [[ tabs ]]
vim.keymap.set("n", "<c-w>m", ac("workbench.action.toggleMaximizeEditorGroup"))
vim.keymap.set("n", "<c-w>o", ac("workbench.action.closeOtherEditors"))
vim.keymap.set("n", "<s-tab>", ac("workbench.action.openNextRecentlyUsedEditor"))
vim.keymap.set("n", "<tab>", ac("workbench.action.openPreviousRecentlyUsedEditor"))
vim.keymap.set("n", "[t", ac("workbench.action.previousEditorInGroup"))
vim.keymap.set("n", "]t", ac("workbench.action.nextEditorInGroup"))

-- [[ lsp ]]
vim.keymap.set("n", "gD", ac("editor.action.peekDefinition"))
vim.keymap.set("n", "gI", ac("editor.action.peekImplementation"))
vim.keymap.set("n", "gO", ac("editor.action.peekTypeDefinition"))
vim.keymap.set("n", "gR", ac("editor.action.goToReferences"))
vim.keymap.set("n", "gd", ac("editor.action.revealDefinition"))
vim.keymap.set("n", "gi", ac("references-view.findImplementations"))
vim.keymap.set("n", "go", ac("editor.action.goToTypeDefinition"))
vim.keymap.set("n", "gr", ac("references-view.findReferences"))

-- [[ fuzzy find (equivalent to telescope) ]]
vim.keymap.set("n", "<leader>fb", ac("workbench.action.showAllEditors"))
vim.keymap.set("n", "<leader>fc", ac("workbench.action.showCommands"))
vim.keymap.set("n", "<leader>ff", ac("workbench.action.quickOpen"))
vim.keymap.set("n", "<leader>fg", ac("workbench.action.findInFiles"))

-- [[ folds ]]
vim.keymap.set("n", "zA", ac("editor.toggleFoldRecursively"))
vim.keymap.set("n", "zC", ac("editor.foldRecursively"))
vim.keymap.set("n", "zM", ac("editor.foldAll"))
vim.keymap.set("n", "zO", ac("editor.unfoldRecursively"))
vim.keymap.set("n", "zR", ac("editor.unfoldAll"))
vim.keymap.set("n", "za", ac("editor.toggleFold"))
vim.keymap.set("n", "zc", ac("editor.fold"))
vim.keymap.set("n", "zo", ac("editor.unfold"))
