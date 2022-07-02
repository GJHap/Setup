local util = require('util')
local prequire = util.prequire

prequire('hydra', function(Hydra)
   Hydra({
      name = 'BUFFER',
      body = '<Leader>b',
      config = {
         hint = false,
      },
      heads = {
         { 'l', ':bn <CR>' },
         { 'h', ':bp <CR>' },
      },
   })
end)

local nnoremap = util.nnoremap
nnoremap('<Leader>bc', ':vsplit <CR>')
nnoremap('<Leader>br', ':split <CR>')

local delete_buffer = function(bufnr)
   vim.api.nvim_buf_delete(bufnr, {})
end
prequire('bufdelete', function(bufdelete)
   delete_buffer = bufdelete.bufdelete
end)
nnoremap('<Leader>bq', function()
   delete_buffer(vim.api.nvim_get_current_buf())
end)

local function close_buffers(close_current)
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
nnoremap('<Leader>bo', function()
   close_buffers(false)
end)
nnoremap('<Leader>ba', function()
   close_buffers(true)
end)
