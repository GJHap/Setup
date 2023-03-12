return {
   'https://github.com/fedepujol/move.nvim',
   init = function()
      local util = require('util')
      local nnoremap = util.nnoremap
      nnoremap('<A-j>', ':MoveLine(1)<CR>')
      nnoremap('<A-k>', ':MoveLine(-1)<CR>')

      local vnoremap = util.vnoremap
      vnoremap('<A-j>', ':MoveBlock(1)<CR>')
      vnoremap('<A-k>', ':MoveBlock(-1)<CR>')
   end,
}
