return {
   'jackMort/ChatGPT.nvim',
   config = true,
   lazy = true,
   init = function()
      local util = require('util')
      local vnoremap = util.vnoremap
      local nnoremap = util.nnoremap

      vnoremap('<Leader>e', function()
         require('chatgpt').edit_with_instructions()
      end)

      nnoremap('<Leader>e', function()
         require('chatgpt').edit_with_instructions()
      end)
   end,
   opts = {
      api_key_cmd = 'gpg -d ' .. vim.fn.expand('$HOME') .. '/openai',
   },
   dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
   },
}
