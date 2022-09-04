local function set_keymap(mode, lhs, rhs, opts)
   opts = opts or {}
   opts.silent = true

   vim.keymap.set(mode, lhs, rhs, opts)
end

local function nnoremap(lhs, rhs)
   set_keymap('n', lhs, rhs)
end

local function vnoremap(lhs, rhs)
   set_keymap('v', lhs, rhs)
end

local function inoremap(lhs, rhs, opts)
   set_keymap('i', lhs, rhs, opts)
end

local function tnoremap(lhs, rhs)
   set_keymap('t', lhs, rhs)
end

local function prequire(plugin, on_success)
   local success, _plugin = pcall(require, plugin)

   if success then
      on_success(_plugin)
   end
end

return {
   nnoremap = nnoremap,
   vnoremap = vnoremap,
   inoremap = inoremap,
   tnoremap = tnoremap,
   prequire = prequire,
}
