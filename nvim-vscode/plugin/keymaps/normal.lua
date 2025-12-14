-- Normal mode keymaps `:h normal-index`

-- Setup {{{
--
local function k(lhs, rhs, opts)
	local options = vim.tbl_extend("force", { unique = true }, opts or {})
	vim.keymap.set("n", lhs, rhs, options)
end

-- Remove any delay for these keys
local disable_keys = { "<space>", "<leader>" }
for _, key in ipairs(disable_keys) do
	k(key, "<nop>", { unique = false })
end
--
-- }}}

-- Navigation {{{
--
-- More deterministic short distance jumps
-- https://nanotipsforvim.prose.sh/vertical-navigation-%E2%80%93-without-relative-line-numbers
-- Always jump on visual lines, not actual lines. `:h gj`
-- Always jump to the start of the line. `:h g0`
k("{", "m'6gkg0", { desc = "Jump up 6 lines" })
k("}", "m'6gjg0", { desc = "Jump down 6 lines" })

-- Jump back and forward in jump list
k("[[", "<c-o>", { desc = "Jump back" }) -- `:h <c-o>`
k("]]", "<c-i>", { desc = "Jump forward" }) -- `:h <c-i>`

-- For small jumps, use visual lines. `:h gk`
k("k", [[v:count > 0 ? "k" : "gk"]], { expr = true })
k("j", [[v:count > 0 ? "j" : "gj"]], { expr = true })

-- Jump to mark `:h map-backtick`
k("'", "`", { desc = "Jump to mark position" })

--
-- }}}

-- Editing {{{
--
k("U", "<c-r>", { desc = "Redo" }) -- `:h ctrl-r`

-- Keep same logic from `y/c/d` on `v`
k("V", "v$") -- Select until end of line
k("vv", "V") -- Enter visual line wise mode `:h V`

-- Keep cursor in place when joining lines
k("J", "mzJ`z:delmarks z<cr>")

-- Don't store on register when changing text or deleting a character.
local black_hole_commands = { "C", "c", "cc", "x", "X" }
for _, key in pairs(black_hole_commands) do
	k(key, '"_' .. key) -- `:h "_`
end

-- Don't store empty lines in register.
-- https://nanotipsforvim.prose.sh/keeping-your-register-clean-from-dd
k("dd", function()
	return vim.fn.getline(".") == "" and '"_dd' or "dd"
end, { expr = true })

-- http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/
k("cn", "*``cgn", { desc = "Change word (forward)" }) -- `:h gn`
k("cN", "*``cgN", { desc = "Change word (backward)" }) -- `:h gN`

--
-- }}}

-- vim: foldmethod=marker:foldmarker={{{,}}}:foldlevel=0:foldenable
