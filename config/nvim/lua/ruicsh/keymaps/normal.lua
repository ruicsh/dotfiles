vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Quick save" })

-- buffers
vim.keymap.set("n", "<tab>", "<c-^>", { desc = "Go back to previous visited tab" })
vim.keymap.set("n", "<s-tab>", "<c-^>", { desc = "Go back to previous visited tab" }) -- for compatibility with vscode
vim.keymap.set("n", "<leader>bC", "<cmd>bufdo Bdelete<cr>", { desc = "Close all tabs" })
vim.keymap.set("n", "<leader>bc", "<cmd>Bdelete<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>bo", "<cmd>bufdo bd<cr>", { desc = "Close all other tabs" })
vim.keymap.set("n", "<leader>bx", "<cmd>Bdelete!<cr>", { desc = "Exit tab" })

-- center screen when moving
vim.keymap.set("n", "<c-b>", "<c-b>zz") -- scrolling up (page up)
vim.keymap.set("n", "<c-d>", "<c-d>zz") -- scrolling down (half page down)
vim.keymap.set("n", "<c-f>", "<c-f>zz") -- scrolling down (page down)
vim.keymap.set("n", "<c-i>", "<c-i>zz") -- moving to newer cursor position
vim.keymap.set("n", "<c-o>", "<c-o>zz") -- moving to older cursor position
vim.keymap.set("n", "<c-u>", "<c-u>zz") -- scrolling up (half page up)
vim.keymap.set("n", "N", "Nzz") -- center screen when moving to previous match
vim.keymap.set("n", "n", "Nzz") -- center screen when moving to next match

-- registers
vim.keymap.set("n", "C", '"_C') -- change to end of line without putting it into register
vim.keymap.set("n", "J", "mzJ`z") -- keep cursor in place when joining lines
vim.keymap.set("n", "c", '"_c') -- change text without putting it into register
vim.keymap.set("n", "cc", '"_cc') -- change line without putting it into register
vim.keymap.set("n", "x", '"_x') -- don't yank on delete char under cursor
vim.keymap.set("n", "X", '"_X') -- don't yank on delete char before cursor
vim.keymap.set("n", "Y", "y$", { desc = "[Y]ank to end of line" })

-- folds
vim.keymap.set("n", "zk", "zk%^") -- jump to start of previous fold

-- alternate file (projectionist)
vim.keymap.set("n", "<leader>a", "<cmd>A<cr>", { desc = "Open [A]lternate file" })

-- misc
vim.keymap.set("n", "{", "<cmd>keepj normal!{<cr>") -- don't include paragraph jumps on jumplist
vim.keymap.set("n", "}", "<cmd>keepj normal!}<cr>") -- don't include paragraph jumps on jumplist
vim.keymap.set("n", "<cr>", "<cmd>noh<cr><cr>", { silent = true }) -- remove search highlighting
vim.keymap.set("n", "<c-t>", "<cmd>terminal<cr>", { desc = "Open Terminal" })
