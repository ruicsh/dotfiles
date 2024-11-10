local k = vim.keymap.set

-- always open help panel on a vertical split, full height
-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/
vim.bo.bufhidden = "unload"
vim.cmd.wincmd("L")
vim.cmd.wincmd("=")

-- close help window with <c-q>
k("n", "<c-q>", "<c-w>q", { buffer = true, noremap = true, silent = true })
