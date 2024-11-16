local k = vim.keymap.set

-- when deleting the path, have it trigger a new search
k("n", "D", "A<c-u><esc>", { noremap = true, buffer = true })
