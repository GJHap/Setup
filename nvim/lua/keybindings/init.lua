require('keybindings/buffer')
require('keybindings/window')

local util = require('util')
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
local inoremap = util.inoremap

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

local function tab()
   nnoremap('<Leader>tl', ':tabnext <CR>')
   nnoremap('<Leader>th', ':tabprevious <CR>')
   nnoremap('<Leader>ta', ':tabnew <CR>')
   nnoremap('<Leader>tq', ':tabclose <CR>')
end

general()
git()
move_line()
tab()
