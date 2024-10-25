local k = vim.keymap

-- navigation (alt-* keymaps from vim-rsi don't work on vscode)
k.set("i", "<c-n>", "<c-o>j", { desc = "Jump down a line" })
k.set("i", "<c-p>", "<c-o>k", { desc = "Jump up a line" })
k.set("i", "<c-r>", "<c-r>+", { desc = "Paste" })
