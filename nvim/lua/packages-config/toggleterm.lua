local tnoremap = require('util').tnoremap

require('toggleterm').setup
{
   size = 10,
   open_mapping = '<C-\\>',
   direction = 'horizontal',
   shade_terminals = false
}

tnoremap('<esc>', [[<C-\><C-n>]])
