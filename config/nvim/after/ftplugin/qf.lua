local k = vim.keymap.set

-- bring back the default behavior of <cr> that we changed to remove the search highlight
k("n", "<cr>", "<cr>", { buffer = true, noremap = true, silent = true })
