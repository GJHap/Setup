local function set_keymap(mode, lhs, rhs, opts)
   opts = opts or {}
   opts.silent = true

   vim.keymap.set(mode, lhs, rhs, opts)
end

local M = {}
M.nnoremap = function(lhs, rhs, opts)
   set_keymap('n', lhs, rhs, opts)
end

M.vnoremap = function(lhs, rhs, opts)
   set_keymap('v', lhs, rhs, opts)
end

M.inoremap = function(lhs, rhs, opts)
   set_keymap('i', lhs, rhs, opts)
end

M.tnoremap = function(lhs, rhs, opts)
   set_keymap('t', lhs, rhs, opts)
end

return M
