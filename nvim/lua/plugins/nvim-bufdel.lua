bufdel = function()
   return require('bufdel')
end

return {
   'ojroques/nvim-bufdel',
   config = true,
   opts = {
      quit = false,
   },
   init = function()
      local nnoremap = require('util').nnoremap

      nnoremap('<Leader>bo', function()
         bufdel().delete_buffer_others()
      end)

      nnoremap('<Leader>ba', function()
         bufdel().delete_buffer_all()
      end)

      nnoremap('<Leader>bq', ':BufDel <CR>')
   end,
}
