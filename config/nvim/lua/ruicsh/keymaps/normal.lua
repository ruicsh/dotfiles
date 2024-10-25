local k = vim.keymap

-- save
k.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Quick save" })

-- editing
k.set("n", "dw", 'vb"_d', { desc = "[d]elete [w]ord backwards" })
k.set("n", "<c-a>", "gg<s-v>G", { desc = "Select [a]ll" })
k.set("n", "Y", "y$", { desc = "[Y]ank to end of line" })

-- buffers
k.set("n", "<tab>", "<c-^>", { desc = "Go back to previous visited tab" })
k.set("n", "<s-tab>", "<c-^>", { desc = "Go back to previous visited tab" }) -- for compatibility with vscode
k.set("n", "<leader>bC", "<cmd>bufdo Bdelete<cr>", { desc = "Close all tabs" })
k.set("n", "<leader>bc", "<cmd>Bdelete<cr>", { desc = "Close tab" })
k.set("n", "<leader>bo", "<cmd>bufdo bd<cr>", { desc = "Close all other tabs" })
k.set("n", "<leader>bx", "<cmd>Bdelete!<cr>", { desc = "Exit tab" })

-- git
k.set("n", "<leader>gg", "<cmd>vertical Git<cr>", { desc = "Git: Status" })

-- lsp - typescript
k.set("n", "<leader>toi", "<cmd>TSToolsOrganizeImports<cr>", { desc = "[T]ypeScript: [o]rganize [i]mports" })
k.set("n", "<leader>tsi", "<cmd>TSToolsSortImports<cr>", { desc = "[T]ypeScript: [s]ort [i]mports" })
k.set("n", "<leader>tui", "<cmd>TSToolsRemoveUnusedImports<cr>", { desc = "[T]ypeScript: Remove [u]nused [i]mports" })
k.set("n", "<leader>tcd", "<cmd>TSToolsGoToSourceDefinition<cr>", { desc = "[T]ypeScript: Go to source [d]efinition" })
k.set("n", "<leader>trf", "<cmd>TSToolsRenameFile<cr>", { desc = "[T]ypeScript: [r]ename [f]ile" })

-- sort
k.set("n", "<leader>so", "vi<esc><cmd>Sort<cr>", { desc = "[So]rt" })
k.set("n", "<leader>so(", "vi(<esc><cmd>Sort<cr>", { desc = "[So]rt: Inside [(]" })
k.set("n", "<leader>so[", "vi[<esc><cmd>Sort<cr>", { desc = "[So]rt: Inside [[]" })
k.set("n", "<leader>so{", "vi{<esc><cmd>Sort<cr>", { desc = "[So]rt: Inside [{]" })
k.set("n", "<leader>so'", "vi'<esc><cmd>Sort<cr>", { desc = "[So]rt: Inside [']" })
k.set("n", "<leader>so`", "vi`<esc><cmd>Sort<cr>", { desc = "[So]rt: Inside [`]" })
k.set("n", '<leader>so"', 'vi"<esc><cmd>Sort<cr>', { desc = '[So]rt: Inside ["]' })
k.set("n", "<leader>so}", "V}k<esc><cmd>Sort<cr>}", { desc = "[So]rt: Paragrah" })

-- center screen when moving
k.set("n", "<c-b>", "<c-b>zz") -- scrolling up (page up)
k.set("n", "<c-d>", "<c-d>zz") -- scrolling down (half page down)
k.set("n", "<c-f>", "<c-f>zz") -- scrolling down (page down)
k.set("n", "<c-i>", "<c-i>zz") -- moving to newer cursor position
k.set("n", "<c-o>", "<c-o>zz") -- moving to older cursor position
k.set("n", "<c-u>", "<c-u>zz") -- scrolling up (half page up)
k.set("n", "N", "Nzz") -- center screen when moving to previous match
k.set("n", "n", "Nzz") -- center screen when moving to next match

-- splits
k.set("n", "|", "<c-w>w", { desc = "Switch splits" })
k.set("n", "<c-w>[", "<c-w>x<c-w>w", { desc = "Move file to split on the left" })
k.set("n", "<c-w>]", "<c-w>x<c-w>w", { desc = "Move file to split on the right" })

-- registers
k.set("n", "C", '"_C') -- change to end of line without putting it into register
k.set("n", "c", '"_c') -- change text without putting it into register
k.set("n", "cc", '"_cc') -- change line without putting it into register
k.set("n", "x", '"_x') -- don't yank on delete char under cursor
k.set("n", "X", '"_X') -- don't yank on delete char before cursor

-- folds
k.set("n", "zk", "zk%^") -- jump to start of previous fold

-- alternate file (projectionist)
k.set("n", "<leader>a", "<cmd>A<cr>", { desc = "Open [A]lternate file" })

-- misc
k.set("n", "{", "<cmd>keepj normal!{<cr>") -- don't include paragraph jumps on jumplist
k.set("n", "}", "<cmd>keepj normal!}<cr>") -- don't include paragraph jumps on jumplist
k.set("n", "<cr>", "<cmd>noh<cr><cr>", { silent = true }) -- remove search highlighting
k.set("n", "<c-t>", "<cmd>terminal<cr>", { desc = "Open Terminal" })
k.set("n", "J", "mzJ`z") -- keep cursor in place when joining lines
