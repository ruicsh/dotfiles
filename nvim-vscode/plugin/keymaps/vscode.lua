if not vim.g.vscode then
	return
end

local k = vim.keymap.set

-- Run vscode action
local function ac(action)
	return function()
		require("vscode").action(action)
	end
end

-- Explorer
k("n", "<leader><space>", ac("workbench.action.quickOpen"))
k("n", "-", ac("workbench.files.action.focusFilesExplorer"))

-- Buffers
k("n", "<bs>", ac("workbench.action.openPreviousRecentlyUsedEditorInGroup"))
k("n", "<s-bs>", ac("workbench.action.openNextRecentlyUsedEditorInGroup"))
k("n", "<leader>,", ac("workbench.action.showAllEditors"))
k("n", "<c-s>", ac("workbench.action.files.save"))

-- Windows
k("n", "|", ac("workbench.action.focusNextGroup"))

-- Folds
k("n", "<tab>", ac("editor.toggleFold"))

-- LSP
k("n", "<c-]>", ac("editor.action.revealDefinition"))
k("n", "<cr>", ac("editor.action.revealDefinition"))
k("n", "[r", ac("editor.action.wordHighlight.prev"))
k("n", "]r", ac("editor.action.wordHighlight.next"))
k("n", "gO", ac("workbench.action.gotoSymbol"))
k("n", "grI", ac("editor.showCallHierarchy"))
k("n", "grn", ac("editor.action.rename"))
k("n", "grr", ac("editor.action.referenceSearch.trigger"))

-- Git
k({ "n", "x" }, "<leader>hh", ac("workbench.view.scm"))
k("n", "[c", ac("workbench.action.editor.previousChange"))
k("n", "]c", ac("workbench.action.editor.nextChange"))
k("n", "<leader>hs", ac("git.stageSelectedRanges"))
k("n", "<leader>hr", ac("git.revertSelectedRanges"))

-- AI Chat
k({ "n", "x" }, "<leader>aa", ac("workbench.action.newChatWindow"))

-- Extension
k("n", "<c-l>", ac("vscode-neovim.restart"))
