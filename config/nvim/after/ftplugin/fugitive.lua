local k = vim.keymap.set

local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, buffer = bufnr }

k("n", "<leader>hp", "<cmd>Git push<cr>", opts)
k("n", "<leader>ho", "<cmd>Git push --set-upstream origin HEAD<cr>", opts)
