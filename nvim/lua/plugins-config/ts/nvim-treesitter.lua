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
   })
end)
