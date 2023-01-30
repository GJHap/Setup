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
   config = function()
      local ok, wezterm = pcall(function()
         return require('Navigator.mux.wezterm'):new()
      end)

      require('Navigator').setup({
         mux = ok and wezterm or 'auto',
      })
   end,
}
