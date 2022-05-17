require('lspsaga').setup{}

local util = require('util')

local nnoremap = util.nnoremap
nnoremap('<Leader>ca', ':Lspsaga code_action <CR>')
nnoremap('<Leader>rr', ':Lspsaga rename <CR>')
nnoremap('<Leader>df', ':Lspsaga show_line_diagnostics <CR>')

local vnoremap = util.vnoremap
vnoremap('<Leader>ca', ':<C-u> Lspsaga range_code_action <CR>')
