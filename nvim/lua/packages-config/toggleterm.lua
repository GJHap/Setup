local util = require('util')
local prequire = util.prequire
local tnoremap = util.tnoremap
local nnoremap = util.nnoremap

prequire('toggleterm', function(toggleterm)
   toggleterm.setup({
      shade_terminals = false,
   })

   nnoremap('<C-\\>', function()
      local tab = vim.api.nvim_get_current_tabpage()
      toggleterm.toggle(tab)
   end)
   tnoremap('<C-\\>', function()
      local tab = vim.api.nvim_get_current_tabpage()
      toggleterm.toggle(tab)
   end)
   tnoremap('<esc>', [[<C-\><C-n>]])
end)
