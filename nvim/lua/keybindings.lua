local util = require('util')
local nnoremap = util.nnoremap

local function buffer()
   nnoremap('<Leader>bc', ':vsplit <CR>', { desc = 'Split Column' })
   nnoremap('<Leader>br', ':split <CR>', { desc = 'Split Row' })
end

local function general()
   nnoremap('<Leader>hq', ':nohlsearch <CR>', { desc = 'Disable Search Highlight' })
end

local function git()
   nnoremap('<Leader>ga', ':Git add .<CR>', { desc = 'Git Add' })
   nnoremap('<Leader>gs', ':Git status <CR>', { desc = 'Git Status' })
   nnoremap('<Leader>gb', ':Git blame <CR>', { desc = 'Git Blame' })
   nnoremap('<Leader>gl', ':Git log <CR>', { desc = 'Git Log' })
   nnoremap('<Leader>gh', ':Git pull <CR>', { desc = 'Git Pull' })
   nnoremap('<Leader>gl', ':Git push <CR>', { desc = 'Git Push' })
   nnoremap('<Leader>gc', ':Git commit <CR>', { desc = 'Git Commit' })
end

local function session()
   local fpath = vim.fn.getcwd() .. '/.session.vim'
   nnoremap('<Leader>sm', ':mksession! ' .. fpath .. '<CR>', { desc = 'Make Session' })
   nnoremap('<Leader>sl', ':source ' .. fpath .. '<CR>', { desc = 'Load Session' })
end

local function tab()
   nnoremap('<Leader>ta', ':tabnew <CR>', { desc = 'Add Tab' })
   nnoremap('<Leader>tq', ':tabclose <CR>', { desc = 'Close Tab' })
end

buffer()
general()
git()
session()
tab()
