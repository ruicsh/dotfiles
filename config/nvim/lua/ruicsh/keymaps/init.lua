-- [[ LEADER KEY ]]
vim.g.mapleader = " " -- set leader key to space
vim.g.maplocalleader = " " -- set local leader key to space

-- [[ NORMAL MODE ]]

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Quick save" })

-- tabs
vim.keymap.set("n", "<tab>", "<c-^>", { desc = "Go back to previous visited tab" })
vim.keymap.set("n", "<s-tab>", "<c-^>", { desc = "Go back to previous visited tab" }) -- for compatibility with vscode
vim.keymap.set("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to tab in position 1" })
vim.keymap.set("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to tab in position 2" })
vim.keymap.set("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to tab in position 3" })
vim.keymap.set("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to tab in position 4" })
vim.keymap.set("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Go to tab in position 5" })
vim.keymap.set("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Go to tab in position 6" })
vim.keymap.set("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Go to tab in position 7" })
vim.keymap.set("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Go to tab in position 8" })
vim.keymap.set("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Go to tab in position 9" })
vim.keymap.set("n", "<leader>bC", "<cmd>bufdo Bdelete<cr>", { desc = "Close all tabs" })
vim.keymap.set("n", "<leader>bc", "<cmd>Bdelete<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Pick tab" })
vim.keymap.set("n", "<leader>bx", "<cmd>Bdelete!<cr>", { desc = "Exit tab" })
vim.keymap.set("n", "[t", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous tab" })
vim.keymap.set("n", "]t", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })

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

-- folds
vim.keymap.set("", "zk", "zk%^") -- jump to start of previous fold

-- misc
vim.keymap.set("n", "{", "<cmd>keepj normal!{<cr>") -- don't include paragraph jumps on jumplist
vim.keymap.set("n", "}", "<cmd>keepj normal!}<cr>") -- don't include paragraph jumps on jumplist
vim.keymap.set("n", "<cr>", "<cmd>noh<cr><cr>", { silent = true }) -- remove search highlighting
vim.keymap.set("n", "<c-\\>", "<cmd>terminal<cr>", { desc = "Open Terminal" })

-- [[ INSERT MODE ]]

-- navigation (alt-* keymaps from vim-rsi don't work on vscode)
vim.keymap.set("i", "<c-n>", "<c-o>j", { desc = "Jump down a line" })
vim.keymap.set("i", "<c-p>", "<c-o>k", { desc = "Jump up a line" })

-- disable these old insert mode navination mappings
vim.keymap.set("i", "<c-h>", "<nop>")
vim.keymap.set("i", "<c-j>", "<nop>")
vim.keymap.set("i", "<c-k>", "<nop>")
vim.keymap.set("i", "<c-l>", "<nop>")

-- [[ VISUAL MODE ]]

vim.keymap.set("v", "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move selected lines up" })

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

-- [[ COMMAND MODE ]]

-- [[ TERMINAL MODE ]]
vim.keymap.set("t", "<esc>", [[<c-\><c-n>]], { desc = "Terminal: Exit" })
vim.keymap.set("t", "<c-\\>", "<cmd>terminal<cr>", { desc = "Terminal: New" })

-- [[ VSCode only keymaps ]]
require("ruicsh/keymaps/vscode")
