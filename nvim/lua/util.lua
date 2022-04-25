local function set_keymap(mode, lhs, rhs, opts)
   vim.keymap.set(mode, lhs, rhs, opts)
end

function nnoremap(lhs, rhs)
   set_keymap('n', lhs, rhs, { noremap = true })
end

function vnoremap(lhs, rhs)
   set_keymap('v', lhs, rhs, { noremap = true })
end

function inoremap(lhs, rhs, opts)
   opts = opts or {}
   opts['noremap'] = true

   set_keymap('i', lhs, rhs, opts)
end

return
{
   nnoremap = nnoremap,
   vnoremap = vnoremap,
   inoremap = inoremap
}
