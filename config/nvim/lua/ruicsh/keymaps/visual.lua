local k = vim.keymap

-- -- move selected lines
-- k.set("v", "J", ":move '>+1<cr>gv=gv", { desc = "Move selected lines down" })
-- k.set("v", "K", ":move '<-2<cr>gv=gv", { desc = "Move selected lines up" })

-- sort
k.set("v", "<leader>so", "<esc><cmd>Sort<cr>", { desc = "[S]ort" })

-- indent
k.set("v", "<<", "<gv") -- keep visual selection after indenting
k.set("v", ">>", ">gv") -- keep visual selection after indenting

-- registers
k.set("v", "P", '"_dP') -- paste over currently selected text without yanking it
k.set("v", "X", '"_X') -- don't yank on delete char before cursor
k.set("v", "c", '"_c') -- change selection without putting it into register
k.set("v", "p", '"_dp') -- paste over currently selected text without yanking it
k.set("v", "x", '"_x') -- don't yank on delete char under cursor

-- misc
k.set("v", "<cr>", ":noh<cr><cr>") -- remove search highlighting
