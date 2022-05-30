local util = require('util')
local prequire = util.prequire
local tnoremap = util.tnoremap

prequire('toggleterm', function(toggleterm)
   toggleterm.setup
   {
      size = 10,
      open_mapping = '<C-\\>',
      direction = 'horizontal',
      shade_terminals = false
   }

   tnoremap('<esc>', [[<C-\><C-n>]])
end)
