local util = require('util')
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
local inoremap = util.inoremap

local function buffer()
   nnoremap('<Leader>bl', ':bn <CR>')
   nnoremap('<Leader>bh', ':bp <CR>')
   nnoremap('<Leader>bq', ':bd <CR>')
   nnoremap('<Leader>bc', ':vsplit <CR>')
   nnoremap('<Leader>br', ':split <CR>')

   local function close_buffers(close_current)
      local open_bufs = vim.api.nvim_list_bufs()
      local current_buf = vim.api.nvim_get_current_buf()

      for _, buf in pairs(open_bufs) do
         local ft = vim.api.nvim_buf_get_option(buf, 'filetype')

         if not ft:match('^toggleterm$') and (close_current or buf ~= current_buf) then
            vim.api.nvim_buf_delete(buf, {})
         end
      end
   end
   nnoremap('<Leader>bo', function()
      close_buffers(false)
   end)
   nnoremap('<Leader>ba', function()
      close_buffers(true)
   end)
end

local function general()
   nnoremap('<Leader>hq', ':nohlsearch <CR>')
end

local function git()
   nnoremap('<Leader>ga', ':Git add .<CR>')
   nnoremap('<Leader>gs', ':Git status <CR>')
   nnoremap('<Leader>gb', ':Git blame <CR>')
   nnoremap('<Leader>gl', ':Git log <CR>')
   nnoremap('<Leader>gh', ':Git pull <CR>')
   nnoremap('<Leader>gl', ':Git push <CR>')
   nnoremap('<Leader>gc', ':Git commit <CR>')
end

local function move_line()
   inoremap('<A-j>', '<Esc>:m .+1<CR>==gi')
   nnoremap('<A-j>', ':m .+1<CR>==')
   vnoremap('<A-j>', ":m '>+1<CR>gv=gv")
   inoremap('<A-k>', '<Esc>:m .-2<CR>==gi')
   nnoremap('<A-k>', ':m .-2<CR>==')
   vnoremap('<A-k>', ":m '<-2<CR>gv=gv")
end

local function session()
   local fpath = vim.fn.getcwd() .. '/.session.vim'
   nnoremap('<Leader>sm', ':mksession! ' .. fpath .. '<CR>')
   nnoremap('<Leader>sl', ':source ' .. fpath .. '<CR>')
end

local function tab()
   nnoremap('<Leader>tl', ':tabnext <CR>')
   nnoremap('<Leader>th', ':tabprevious <CR>')
   nnoremap('<Leader>ta', ':tabnew <CR>')
   nnoremap('<Leader>tq', ':tabclose <CR>')
end

buffer()
general()
git()
move_line()
session()
tab()
