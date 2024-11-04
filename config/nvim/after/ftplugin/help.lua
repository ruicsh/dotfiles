local k = vim.keymap.set

-- close help window with <c-q>
k("n", "<c-q>", "<c-w>q", { buffer = true, noremap = true, silent = true })
