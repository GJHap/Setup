require('lspsaga').setup{}

local util = require('util')

local code_action = require('lspsaga.codeaction')
local rename = require('lspsaga.rename').rename
local show_line_diagnostics = require('lspsaga.diagnostic').show_line_diagnostics
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
nnoremap('<Leader>ca', code_action.code_action)
vnoremap('<Leader>ca', function()
   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', false, true, true), 'nx', false)
   code_action.range_code_action()
end)
nnoremap('<Leader>rr', rename)
nnoremap('<Leader>df', show_line_diagnostics)

