-- [[ LEADER KEY ]]
vim.g.mapleader = " " -- set leader key to space
vim.g.maplocalleader = " " -- set local leader key to space

-- [[ NORMAL MODE ]]

-- faster save/quit
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and quit" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "[Q]uit" })

-- tabs
vim.keymap.set("n", "<bs>", "<c-^>", { desc = "Go back to previous visited tab" })
vim.keymap.set("n", "<s-bs>", "<c-^>", { desc = "Go back to previous visited tab" }) -- for compatibility with vscode
vim.keymap.set("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Go to tab in position 1" })
vim.keymap.set("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Go to tab in position 2" })
vim.keymap.set("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Go to tab in position 3" })
vim.keymap.set("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Go to tab in position 4" })
vim.keymap.set("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Go to tab in position 5" })
vim.keymap.set("n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Go to tab in position 6" })
vim.keymap.set("n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Go to tab in position 7" })
vim.keymap.set("n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Go to tab in position 8" })
vim.keymap.set("n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Go to tab in position 9" })
vim.keymap.set("n", "<leader>bC", "<cmd>bufdo bd<cr>", { desc = "Close all tabs" })
vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<cr>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Pick tab" })
vim.keymap.set("n", "[t", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous tab on bufferline" })
vim.keymap.set("n", "]t", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab on bufferline" })

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

-- misc
vim.keymap.set("n", "{", "<cmd>keepj normal!{<cr>") -- don't include paragraph jumps on jumplist
vim.keymap.set("n", "}", "<cmd>keepj normal!}<cr>") -- don't include paragraph jumps on jumplist
vim.keymap.set("n", "<cr>", "<cmd>noh<cr><cr>", { silent = true }) -- remove search highlighting

-- [[ INSERT MODE ]]

vim.keymap.set("i", "jj", "<esc>", { desc = "Exit insert mode" })

-- [[ VISUAL MODE ]]
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move lines" })

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

-- [[ ALL MODES ]]
local all_modes = { "n", "i", "v", "s", "o", "t" }

-- -- [[ disable arrow keys ]]
vim.keymap.set(all_modes, "<down>", "<nop>") -- disable down arrow key
vim.keymap.set(all_modes, "<left>", "<nop>") -- disable left arrow key
vim.keymap.set(all_modes, "<right>", "<nop>") -- disable right arrow key
vim.keymap.set(all_modes, "<up>", "<nop>") -- disable up arrow key

-- [[ VSCode only keymaps ]]
require("ruicsh/keymaps/vscode")
