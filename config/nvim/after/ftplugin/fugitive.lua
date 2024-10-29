local k = vim.keymap.set

-- quit with <c-q>
k("n", "<c-q>", "<plug>fugitive:gq", { noremap = true })
