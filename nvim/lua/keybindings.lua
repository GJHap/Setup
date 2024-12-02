local util = require('util')
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap

local function buffer()
   nnoremap('<Leader>|', ':vsplit <CR>', { desc = 'Split Column' })
   nnoremap('<Leader>-', ':split <CR>', { desc = 'Split Row' })
end

local function comment()
   nnoremap('<Leader>cl', ':normal gcc<CR>')
   vnoremap('<Leader>cl', ':normal gcc<CR>')
end

local function general()
   nnoremap('<Leader>hq', ':nohlsearch <CR>', { desc = 'Disable Search Highlight' })
end

local function tab()
   nnoremap('<Leader>ta', ':tabnew <CR>', { desc = 'Add Tab' })
   nnoremap('<Leader>tq', ':tabclose <CR>', { desc = 'Close Tab' })
   nnoremap('<Leader>tl', ':tabnext <CR>', { desc = 'Close Tab' })
   nnoremap('<Leader>th', ':tabprev <CR>', { desc = 'Close Tab' })
end

buffer()
comment()
general()
tab()
