local util = require('util')
local nnoremap = util.nnoremap

local function buffer()
   nnoremap('<Leader>|', ':vsplit <CR>', { desc = 'Split Column' })
   nnoremap('<Leader>-', ':split <CR>', { desc = 'Split Row' })
end

local function general()
   nnoremap('<Leader>hq', ':nohlsearch <CR>', { desc = 'Disable Search Highlight' })
end

local function session()
   local fpath = vim.fn.getcwd() .. '/.session.vim'
   nnoremap('<Leader>sm', ':mksession! ' .. fpath .. '<CR>', { desc = 'Make Session' })
   nnoremap('<Leader>sl', ':source ' .. fpath .. '<CR>', { desc = 'Load Session' })
end

local function tab()
   nnoremap('<Leader>ta', ':tabnew <CR>', { desc = 'Add Tab' })
   nnoremap('<Leader>tq', ':tabclose <CR>', { desc = 'Close Tab' })
   nnoremap('<Leader>tl', ':tabnext <CR>', { desc = 'Close Tab' })
   nnoremap('<Leader>th', ':tabprev <CR>', { desc = 'Close Tab' })
end

buffer()
general()
session()
tab()
