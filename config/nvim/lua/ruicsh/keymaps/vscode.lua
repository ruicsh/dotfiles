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
vim.keymap.set("n", "<leader>kz", ac("workbench.action.toggleZenMode"))
vim.keymap.set("n", "<leader>sr", ac("actions.find"))

-- tabs
vim.keymap.set("n", "<tab>", ac("workbench.action.openPreviousRecentlyUsedEditor"))
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
vim.keymap.set("n", "<leader>bC", ac("workbench.action.closeAllEditors"))
vim.keymap.set("n", "<leader>bc", ac("workbench.action.closeActiveEditor"))
vim.keymap.set("n", "<leader>bb", ac("workbench.action.showAllEditors"))
vim.keymap.set("n", "<s-tab>", ac("workbench.action.openNextRecentlyUsedEditor"))
vim.keymap.set("n", "[t", ac("workbench.action.previousEditorInGroup"))
vim.keymap.set("n", "]t", ac("workbench.action.nextEditorInGroup"))

-- lsp
vim.keymap.set("n", "<leader>cD", ac("editor.action.peekDefinition"))
vim.keymap.set("n", "<leader>cI", ac("editor.action.peekImplementation"))
vim.keymap.set("n", "<leader>cO", ac("editor.action.peekTypeDefinition"))
vim.keymap.set("n", "<leader>cR", ac("editor.action.goToReferences"))
vim.keymap.set("n", "<leader>cd", ac("editor.action.revealDefinition"))
vim.keymap.set("n", "<leader>co", ac("editor.action.goToTypeDefinition"))
vim.keymap.set("n", "<leader>cr", ac("references-view.findReferences"))
vim.keymap.set("n", "<leader>cn", ac("editor.action.rename"))

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

-- harpoon
vim.keymap.set("n", "<leader>1", ac("vscode-harpoon.gotoEditor1"), { desc = "Harpoon: Go to file [1]" })
vim.keymap.set("n", "<leader>2", ac("vscode-harpoon.gotoEditor2"), { desc = "Harpoon: Go to file [2]" })
vim.keymap.set("n", "<leader>3", ac("vscode-harpoon.gotoEditor3"), { desc = "Harpoon: Go to file [3]" })
vim.keymap.set("n", "<leader>4", ac("vscode-harpoon.gotoEditor4"), { desc = "Harpoon: Go to file [4]" })
vim.keymap.set("n", "<leader>5", ac("vscode-harpoon.gotoEditor5"), { desc = "Harpoon: Go to file [5]" })
vim.keymap.set("n", "<leader>6", ac("vscode-harpoon.gotoEditor6"), { desc = "Harpoon: Go to file [6]" })
vim.keymap.set("n", "<leader>7", ac("vscode-harpoon.gotoEditor7"), { desc = "Harpoon: Go to file [9]" })
vim.keymap.set("n", "<leader>8", ac("vscode-harpoon.gotoEditor8"), { desc = "Harpoon: Go to file [8]" })
vim.keymap.set("n", "<leader>9", ac("vscode-harpoon.gotoEditor9"), { desc = "Harpoon: Go to file [9]" })
vim.keymap.set("n", "<leader>ha", ac("vscode-harpoon.addEditor"), { desc = "Harpoon: [A]dd file" })
vim.keymap.set("n", "<leader>hh", ac("vscode-harpoon.editEditors"), { desc = "Harpoon: [H]arpoon" })
vim.keymap.set("n", "<leader>hn", ac("vscode-harpoon.navigateNextEditor"), { desc = "Harpoon: [N]ext file" })
vim.keymap.set("n", "<leader>hp", ac("vscode-harpoon.navigatePreviousEditor"), { desc = "Harpoon: [P]revious file" })

-- git
vim.keymap.set("n", "<leader>gs", ac("git.stageSelectedRanges"), { desc = "Git: [s]tage hunk" })
vim.keymap.set("n", "<leader>gr", ac("git.revertSelectedRanges"), { desc = "Git: [r]evert hunk" })
vim.keymap.set("n", "<leader>gu", ac("git.unstageSelectedRanges"), { desc = "Git: [u]nstage hunk" })
vim.keymap.set("n", "<leader>gS", ac("git.stageFile"), { desc = "Git: [S]tage file" })
vim.keymap.set("n", "<leader>gR", ac("workbench.action.files.revert"), { desc = "Git: [R]evert file" })
vim.keymap.set("n", "<leader>gb", ac("gitlens.toggleFileBlame"), { desc = "Git: toggle [b]lame" })
vim.keymap.set("n", "<leader>gp", ac("git.openChange"), { desc = "Git: [p]review change" })
vim.keymap.set("n", "[c", ac("workbench.action.editor.previousChange"), { desc = "Git: jump to previous [c]hange" })
vim.keymap.set("n", "]c", ac("workbench.action.editor.nextChange"), { desc = "Git: jump to next [c]hange" })

-- move lines
vim.keymap.set("n", "∆", ":m .+1<cr>", { desc = "Move line down" })
vim.keymap.set("n", "˚", ":m .-2<cr>", { desc = "Move line up" })

-- [[ VISUAL MODE ]]

-- native
vim.keymap.set("x", "<leader>ss", ac("editor.action.sortLinesAscending"))
vim.keymap.set("x", "<leader>sr", ac("actions.find"))

-- move lines
vim.keymap.set("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move selected lines up" })
