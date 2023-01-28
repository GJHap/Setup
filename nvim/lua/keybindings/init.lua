require('keybindings/buffer')
require('keybindings/window')

local util = require('util')
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
local inoremap = util.inoremap

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

local function move_line()
   inoremap('<A-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move Line Down' })
   nnoremap('<A-j>', ':m .+1<CR>==', { desc = 'Move Line Down' })
   vnoremap('<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move Line Down' })
   inoremap('<A-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move Line Up' })
   nnoremap('<A-k>', ':m .-2<CR>==', { desc = 'Move Line Up' })
   vnoremap('<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move Line Up' })
end

local function session()
   local fpath = vim.fn.getcwd() .. '/.session.vim'
   nnoremap('<Leader>sm', ':mksession! ' .. fpath .. '<CR>', { desc = 'Make Session' })
   nnoremap('<Leader>sl', ':source ' .. fpath .. '<CR>', { desc = 'Load Session' })
end

local function tab()
   nnoremap('<Leader>tl', ':tabnext <CR>', { desc = 'Next Tab' })
   nnoremap('<Leader>th', ':tabprevious <CR>', { desc = 'Previous Tab' })
   nnoremap('<Leader>ta', ':tabnew <CR>', { desc = 'Add Tab' })
   nnoremap('<Leader>tq', ':tabclose <CR>', { desc = 'Close Tab' })
end

general()
git()
move_line()
session()
tab()
