return {
   'anuvyklack/hydra.nvim',
   config = function()
      local Hydra = require('hydra')

      Hydra({
         name = 'BUFFER',
         body = '<Leader>b',
         config = {
            hint = false,
         },
         heads = {
            { 'l', ':bn <CR>', { desc = 'Next Buffer ' } },
            { 'h', ':bp <CR>', { desc = 'Previous Buffer' } },
         },
      })

      Hydra({
         name = 'WINDOW',
         body = '<C-w>',
         config = {
            hint = false,
         },
         heads = {
            { '<', '<C-w>5<', { desc = 'Shrink Window Width' } },
            { '>', '<C-w>5>', { desc = 'Grow Window Width' } },
            { '+', '<C-w>5+', { desc = 'Grow Window Height' } },
            { '-', '<C-w>5-', { desc = 'Shrink Window Height' } },
            { '=', '<C-w>=', { desc = 'Equalize Window Dimensions' } },
         },
      })
   end,
}
