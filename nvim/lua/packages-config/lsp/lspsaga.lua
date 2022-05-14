local nnoremap = require('util').nnoremap
local vnoremap = require('util').vnoremap

require('lspsaga').setup{}

nnoremap('<Leader>ca', ':Lspsaga code_action<CR>')
nnoremap('<Leader>rr', ':Lspsaga rename<CR>')
vnoremap('<Leader>ca', ":<c-u>Lspsaga range_code_action<cr>")
