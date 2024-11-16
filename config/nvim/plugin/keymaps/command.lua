local k = vim.keymap.set

-- move up/down in the history and in wildmenu
k("c", "<c-k>", "<c-p>")
k("c", "<c-j>", "<c-n>")
