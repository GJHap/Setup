local prequire = require('util').prequire

prequire('hydra', function(Hydra)
   Hydra({
      name = 'WINDOW',
      body = '<C-w>',
      config = {
         hint = false,
      },
      heads = {
         { '<', '<C-w>5<' },
         { '>', '<C-w>5>' },
         { '+', '<C-w>5+' },
         { '-', '<C-w>5-' },
         { '=', '<C-w>=' },
      },
   })
end)
