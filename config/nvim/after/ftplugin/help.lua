local k = vim.keymap.set

-- always open help panel on a vertical split, full height
-- https://github.com/dmmulroy/kickstart.nix/blob/main/config/nvim/
vim.bo.bufhidden = "unload"
vim.cmd.wincmd("L")
vim.cmd.wincmd("=")

-- close help window with <c-bs>
k("n", "<c-bs>", "<c-w>q", { buffer = true, noremap = true, silent = true })

-- better navigation
-- https://vim.fandom.com/wiki/Learn_to_use_help#Simplify_help_navigation
k("n", "<cr>", "<c-]>", { buffer = true, noremap = true, silent = true })
k("n", "<bs>", "<c-T>", { buffer = true, noremap = true, silent = true })
