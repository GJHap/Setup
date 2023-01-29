local function set_keymap(mode, lhs, rhs, opts)
   opts = opts or {}
   opts.silent = true

   vim.keymap.set(mode, lhs, rhs, opts)
end

local function nnoremap(lhs, rhs, opts)
   set_keymap('n', lhs, rhs, opts)
end

local function vnoremap(lhs, rhs, opts)
   set_keymap('v', lhs, rhs, opts)
end

local function inoremap(lhs, rhs, opts)
   set_keymap('i', lhs, rhs, opts)
end

local function tnoremap(lhs, rhs, opts)
   set_keymap('t', lhs, rhs, opts)
end

return {
   nnoremap = nnoremap,
   vnoremap = vnoremap,
   inoremap = inoremap,
   tnoremap = tnoremap,
}
