local k = vim.keymap.set

-- use <c-q to exit, even when editing a keyword
k({ "n", "i" }, "<c-q>", "<esc><cmd>lua require('spectre').toggle()<cr>", { noremap = true })

-- when deleting the path, have it trigger a new search
k("n", "D", "A<c-u><esc>", { noremap = true })
