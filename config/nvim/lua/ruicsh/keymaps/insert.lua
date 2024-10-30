local k = vim.keymap.set

-- navigation (alt-* keymaps from vim-rsi don't work on vscode)
k("i", "<c-j>", "<c-o>j", { desc = "Jump down a line" })
k("i", "<c-k>", "<c-o>k", { desc = "Jump up a line" })
k("i", "<c-r>", "<c-r>+", { desc = "Paste" })

k({ "i", "c" }, "<c-l>", "<c-o>A", { desc = "Go to the end of the line" })
