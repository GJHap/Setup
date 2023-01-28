local prequire = require('util').prequire

prequire('hydra', function(Hydra)
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
end)
