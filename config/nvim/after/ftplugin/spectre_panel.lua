local k = vim.keymap.set

-- use <c-]> to exit, even when editing a keyword
k({ "n", "i" }, "<c-]>", "<esc><cmd>lua require('spectre').toggle()<cr>", { noremap = true, buffer = true })

-- when deleting the path, have it trigger a new search
k("n", "D", "A<c-u><esc>", { noremap = true, buffer = true })
