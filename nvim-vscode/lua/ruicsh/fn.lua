vim.fn = vim.fn or {}

-- Takes a table of keys, returns a keymaps lazy config
vim.fn.get_lazy_keys_config = function(mappings, desc_prefix)
	return vim.tbl_map(function(mapping)
		local lhs = mapping[1]
		local rhs = mapping[2]
		local desc = desc_prefix and desc_prefix .. ": " .. mapping[3] or mapping[3]
		local opts = mapping[4]
		local mode = opts and opts.mode or "n"
		local expr = opts and opts.expr or false
		local remap = opts and opts.remap or false

		local unique = true
		if opts and opts.unique ~= nil then
			unique = opts.unique
		end

		return {
			lhs,
			rhs,
			mode = mode,
			noremap = true,
			unique = unique,
			desc = desc,
			expr = expr,
			remap = remap,
		}
	end, mappings)
end
