return {
   'famiu/bufdelete.nvim',
   lazy = true,
   init = function()
      local function close_buffers(close_current)
         local delete_buffer = require('bufdelete').bufdelete
         local open_bufs = vim.api.nvim_list_bufs()
         local current_buf = vim.api.nvim_get_current_buf()

         for _, buf in pairs(open_bufs) do
            local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
            local is_listed = vim.api.nvim_buf_get_option(buf, 'buflisted')
            local is_toggle_term = ft:match('^toggleterm$')

            if is_listed and not is_toggle_term and (close_current or buf ~= current_buf) then
               delete_buffer(buf)
            end
         end
      end

      local nnoremap = require('util').nnoremap
      nnoremap('<Leader>bq', function()
         local delete_buffer = require('bufdelete').bufdelete
         delete_buffer(vim.api.nvim_get_current_buf())
      end, { desc = 'Close Buffer' })
      nnoremap('<Leader>bo', function()
         close_buffers(false)
      end, { desc = 'Close Other Buffers' })
      nnoremap('<Leader>ba', function()
         close_buffers(true)
      end, { desc = 'Close All Buffers' })
   end,
}
