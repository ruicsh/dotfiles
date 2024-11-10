local k = vim.keymap.set

-- use <c-s> to save the commit message
k("i", "<c-s>", "<esc><cmd>w<cr><c-w>q", { noremap = true })

vim.opt.spell = true -- set spellcheck on
vim.cmd("startinsert", { silent = true }) -- start on insert mode
