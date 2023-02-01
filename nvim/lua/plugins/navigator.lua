return {
   'numToStr/Navigator.nvim',
   lazy = true,
   init = function()
      local nnoremap = require('util').nnoremap

      nnoremap('<C-h>', function()
         require('Navigator').left()
      end)
      nnoremap('<C-j>', function()
         require('Navigator').down()
      end)
      nnoremap('<C-k>', function()
         require('Navigator').up()
      end)
      nnoremap('<C-l>', function()
         require('Navigator').right()
      end)
   end,
   config = true,
}
