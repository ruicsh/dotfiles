local k = vim.keymap.set

-- sort
k("v", "<leader>so", "<esc><cmd>Sort<cr>", { desc = "[S]ort" })

-- search and replace
k("x", "fr", ":s/", { desc = "Find and replace within selection" })

-- indent
k("v", "<<", "<gv") -- keep visual selection after indenting
k("v", ">>", ">gv") -- keep visual selection after indenting

-- registers
k("v", "P", '"_dP') -- paste over currently selected text without yanking it
k("v", "X", '"_X') -- don't yank on delete char before cursor
k("v", "c", '"_c') -- change selection without putting it into register
k("v", "p", '"_dp') -- paste over currently selected text without yanking it
k("v", "x", '"_x') -- don't yank on delete char under cursor

-- misc
-- this remap also removes the default behavior of going down a line with <cr>
k("v", "<cr>", "<cmd>noh<cr>") -- remove search highlighting
