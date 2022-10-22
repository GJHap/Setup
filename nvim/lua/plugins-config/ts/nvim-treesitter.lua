local prequire = require('util').prequire

prequire('nvim-treesitter.configs', function(treesitter)
   treesitter.setup({
      auto_install = true,
      highlight = {
         enable = true,
      },
      rainbow = {
         enable = true,
         extended_mode = true,
      },
      autotag = {
         enable = true,
      },
      textobjects = {
         select = {
            enable = true,
            lookahead = true,

            keymaps = {
               ['aa'] = '@attribute.outer',
               ['ia'] = '@attribute.inner',
               ['ab'] = '@block.outer',
               ['ib'] = '@block.inner',
               ['aC'] = '@class.outer',
               ['iC'] = '@class.inner',
               ['ac'] = '@conditional.outer',
               ['ic'] = '@conditional.inner',
               ['af'] = '@function.outer',
               ['if'] = '@function.inner',
               ['al'] = '@loop.outer',
               ['il'] = '@loop.inner',
               ['ap'] = '@parameter.outer',
               ['ip'] = '@parameter.inner',
            },
         },
      },
   })
end)
