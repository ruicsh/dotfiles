-- move selected lines
vim.keymap.set("v", "J", ":move '>+1<cr>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":move '<-2<cr>gv=gv", { desc = "Move selected lines up" })

-- sort
vim.keymap.set("v", "<leader>so", "<esc><cmd>Sort<cr>", { desc = "Sort" })

-- indent
vim.keymap.set("v", "<<", "<gv") -- keep visual selection after indenting
vim.keymap.set("v", ">>", ">gv") -- keep visual selection after indenting

-- registers
vim.keymap.set("v", "P", '"_dP') -- paste over currently selected text without yanking it
vim.keymap.set("v", "X", '"_X') -- don't yank on delete char before cursor
vim.keymap.set("v", "c", '"_c') -- change selection without putting it into register
vim.keymap.set("v", "p", '"_dp') -- paste over currently selected text without yanking it
vim.keymap.set("v", "x", '"_x') -- don't yank on delete char under cursor

-- misc
vim.keymap.set("v", "<cr>", ":noh<cr><cr>") -- remove search highlighting
