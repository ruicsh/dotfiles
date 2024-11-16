local k = vim.keymap.set

-- use <c-s> to save the commit message
k("i", "<c-s>", "<esc><cmd>w<cr><c-w>q", { noremap = true, buffer = true })
-- use <c-]> to close the commit message
k({ "n", "i" }, "<c-]>", "<cmd>q!<cr>", { noremap = true, buffer = true })

vim.opt.spell = true -- set spellcheck on
vim.cmd("startinsert", { silent = true }) -- start on insert mode
