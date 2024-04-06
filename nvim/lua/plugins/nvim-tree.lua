local nnoremap = require('util').nnoremap

return {
   'kyazdani42/nvim-tree.lua',
   lazy = true,
   init = function()
      nnoremap('<Leader>tt', function()
         require('nvim-tree.api').tree.toggle()
      end, { desc = 'Toggle File Tree' })
   end,
   config = true,
   opts = {
      respect_buf_cwd = true,
      update_focused_file = { enable = true },
      hijack_directories = { enable = false },
      view = {
         adaptive_size = true,
      },
      on_attach = function(bufnr)
         local api = require('nvim-tree.api')
         api.config.mappings.default_on_attach(bufnr)

         nnoremap('<Leader>-', api.node.open.horizontal, { buffer = bufnr })
         nnoremap('<Leader>|', api.node.open.vertical, { buffer = bufnr })
      end,
   },

   dependencies = { 'kyazdani42/nvim-web-devicons' },
}
