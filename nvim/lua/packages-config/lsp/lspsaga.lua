local nnoremap = require('util').nnoremap

require('lspsaga').setup{}

nnoremap('<Leader>ca', ':Lspsaga code_action<CR>')
nnoremap('<Leader>rr', ':Lspsaga rename<CR>')

