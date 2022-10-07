local prequire = require('util').prequire

prequire('tokyonight', function(tokyonight)
   tokyonight.setup({
      style = 'night',
   })

   vim.cmd.colorscheme('tokyonight')
end)
