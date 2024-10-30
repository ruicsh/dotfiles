local k = vim.keymap

-- save/quit/exit
k.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
k.set("n", "<c-q>", "<c-w>q", { desc = "Close window" })

-- editing
k.set("n", "<c-a>", "gg<s-v>G", { desc = "Select [a]ll" })
k.set("n", "Y", "y$", { desc = "[Y]ank to end of line" })
k.set("n", "[<space>", "<cmd>call append(line('.') - 1, repeat([''], v:count1))<cr>", { desc = "Put empty line above" })
k.set("n", "]<space>", "<cmd>call append(line('.'),     repeat([''], v:count1))<cr>", { desc = "Put empty line below" })
k.set("n", "[p", "<cmd>pu!<cr>==", { desc = "Paste on new line above" })
k.set("n", "]p", "<cmd>pu<cr>==", { desc = "Paste on new line below" })
k.set("n", "U", "<C-r>", { desc = "Redo" })

-- buffers
k.set("n", "[b", "<cmd>bprev<cr>", { desc = "Buffers: Go to previous" })
k.set("n", "]b", "<cmd>bnext<cr>", { desc = "Buffers: Go to next" })
k.set("n", "<bs>", "<c-^>", { desc = "Buffers: Go to previous visited" })
k.set("n", "<s-bs>", "<c-^>", { desc = "Buffers: Go to previous visited" }) -- for compatibility with vscode
k.set("n", "<leader>bC", "<cmd>bufdo Bdelete<cr>", { desc = "Buffers: Close all" })
k.set("n", "<leader>bc", "<cmd>Bdelete<cr>", { desc = "Buffers: Close" })
k.set("n", "<leader>bo", "<cmd>bufdo bd<cr>", { desc = "Buffers: Close all other" })
k.set("n", "<leader>bx", "<cmd>Bdelete!<cr>", { desc = "Buffers: Exit" })

-- git
k.set("n", "<leader>dd", "<cmd>vertical Git<cr>", { desc = "Git: Status" })
k.set("n", "<leader>df", "<cmd>AdvancedGitSearch<cr>", { desc = "Git: Find" })

-- lsp - typescript
k.set("n", "<leader>to", "<cmd>TSToolsOrganizeImports<cr>", { desc = "[T]ypeScript: [o]rganize imports" })
k.set("n", "<leader>ts", "<cmd>TSToolsSortImports<cr>", { desc = "[T]ypeScript: [s]ort imports" })
k.set("n", "<leader>tu", "<cmd>TSToolsRemoveUnusedImports<cr>", { desc = "[T]ypeScript: Remove [u]nused imports" })
k.set("n", "<leader>td", "<cmd>TSToolsGoToSourceDefinition<cr>", { desc = "[T]ypeScript: Go to source [d]efinition" })
k.set("n", "<leader>tr", "<cmd>TSToolsRenameFile<cr>", { desc = "[T]ypeScript: [r]ename [f]ile" })

-- sort
k.set("n", "<leader>s'", "vi'<esc><cmd>Sort<cr>", { desc = "[S]ort: Inside [']" })
k.set("n", "<leader>s(", "vi(<esc><cmd>Sort<cr>", { desc = "[S]ort: Inside [(]" })
k.set("n", "<leader>s[", "vi[<esc><cmd>Sort<cr>", { desc = "[S]ort: Inside [[]" })
k.set("n", "<leader>s{", "vi{<esc><cmd>Sort<cr>", { desc = "[S]ort: Inside [{]" })
k.set("n", "<leader>s}", "V}k<esc><cmd>Sort<cr>}", { desc = "[S]ort: Paragrah" })
k.set("n", '<leader>s"', 'vi"<esc><cmd>Sort<cr>', { desc = '[So]rt: Inside ["]' })

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
k.set("n", "|", "<c-w>w", { desc = "Splits: Switch" })
k.set("n", "<c-w>|", "<c-w>v", { desc = "Splits: Open vertical" })
k.set("n", "<c-w>[", "<c-w>x<c-w>w", { desc = "Splits: Move file to the left" })
k.set("n", "<c-w>]", "<c-w>x<c-w>w", { desc = "Splits: Move file to the right" })

-- registers
k.set("n", "C", '"_C') -- change to end of line without putting it into register
k.set("n", "c", '"_c') -- change text without putting it into register
k.set("n", "cc", '"_cc') -- change line without putting it into register
k.set("n", "x", '"_x') -- don't yank on delete char under cursor
k.set("n", "X", '"_X') -- don't yank on delete char before cursor

-- folds
k.set("n", "zk", "zk%^") -- jump to start of previous fold

-- alternate file (projectionist)
k.set("n", "<leader>a", "<cmd>A<cr>", { desc = "Projectionist: Open [a]lternate file" })

-- misc
k.set("n", "{", "<cmd>keepj normal!{<cr>") -- don't include paragraph jumps on jumplist
k.set("n", "}", "<cmd>keepj normal!}<cr>") -- don't include paragraph jumps on jumplist
k.set("n", "<cr>", "<cmd>noh<cr><cr>", { silent = true }) -- remove search highlighting
k.set("n", "J", "mzJ`z") -- keep cursor in place when joining lines
k.set("n", "<c-\\>", "<cmd>terminal<cr>", { desc = "Open classic terminal" }) -- instead of using ToggleTerm
