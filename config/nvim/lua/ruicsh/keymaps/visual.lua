-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selected lines up" })

-- indent
vim.keymap.set("v", "<", "<gv") -- keep visual selection after indenting
vim.keymap.set("v", ">", ">gv") -- keep visual selection after indenting

vim.keymap.set("v", "<cr>", ":noh<cr><cr>") -- remove search highlighting

-- registers
vim.keymap.set("v", "P", '"_dP') -- paste over currently selected text without yanking it
vim.keymap.set("v", "X", '"_X') -- don't yank on delete char before cursor
vim.keymap.set("v", "c", '"_c') -- change selection without putting it into register
vim.keymap.set("v", "p", '"_dp') -- paste over currently selected text without yanking it
vim.keymap.set("v", "x", '"_x') -- don't yank on delete char under cursor
