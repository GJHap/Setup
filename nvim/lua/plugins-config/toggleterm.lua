local util = require('util')
local prequire = util.prequire

prequire('toggleterm', function(toggleterm)
   toggleterm.setup({
      shade_terminals = false,
   })

   local nnoremap = util.nnoremap
   nnoremap('<C-\\>', function()
      local tab = vim.api.nvim_get_current_tabpage()
      toggleterm.toggle(tab)
   end, { desc = 'Toggle Terminal' })

   local tnoremap = util.tnoremap
   tnoremap('<C-\\>', function()
      local tab = vim.api.nvim_get_current_tabpage()
      toggleterm.toggle(tab)
   end, { desc = 'Toggle Terminal' })
   tnoremap('<esc>', [[<C-\><C-n>]], { desc = 'Normal Mode (From Term Mode)' })
end)
