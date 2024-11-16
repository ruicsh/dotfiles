local k = vim.keymap.set

-- quit with <c-]>
k("n", "<c-]>", "<plug>fugitive:gq", { noremap = true, buffer = true })
