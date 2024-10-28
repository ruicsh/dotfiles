local k = vim.keymap

k.set("t", "<esc>", [[<c-\><c-n>]], { desc = "Terminal: Exit" })
k.set("t", "<c-\\>", "<cmd>terminal<cr>", { desc = "Terminal: New" })
