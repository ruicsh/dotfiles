local k = vim.keymap.set

-- quit with <c-bs>
k("n", "<c-bs>", "<plug>fugitive:gq", { noremap = true, buffer = true })
