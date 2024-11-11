local k = vim.keymap.set

-- paste
k("i", "<c-v>", "<c-r>", { desc = "Paste" })

-- navigation (alt-* keymaps from vim-rsi don't work on vscode)
k("i", "<c-j>", "<c-o>j", { desc = "Jump down a line" })
k("i", "<c-k>", "<c-o>k", { desc = "Jump up a line" })
k("i", "<c-r>", "<c-r>+", { desc = "Paste" })
