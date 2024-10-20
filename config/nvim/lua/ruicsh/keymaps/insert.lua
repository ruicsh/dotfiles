-- navigation (alt-* keymaps from vim-rsi don't work on vscode)
vim.keymap.set("i", "<c-n>", "<c-o>j", { desc = "Jump down a line" })
vim.keymap.set("i", "<c-p>", "<c-o>k", { desc = "Jump up a line" })
vim.keymap.set("i", "<c-r>", "<c-r>+", { desc = "Paste" })
