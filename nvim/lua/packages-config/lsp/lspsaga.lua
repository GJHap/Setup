local util = require('util')
local nnoremap = util.nnoremap
local vnoremap = util.vnoremap
local prequire = util.prequire

prequire('lspsaga', function(lspsaga)
   lspsaga.setup{}

   prequire('lspsaga.codeaction', function(code_action)
      nnoremap('<Leader>ca', code_action.code_action)
      vnoremap('<Leader>ca', function()
         vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', false, true, true), 'nx', false)
         code_action.range_code_action()
      end)
   end)

   prequire('lspsaga.rename', function(rename)
      nnoremap('<Leader>rr', rename.rename)
   end)

   prequire('lspsaga.diagnostic', function(show_line_diagnostics)
      nnoremap('<Leader>df', show_line_diagnostics.show_line_diagnostics)
   end)

   prequire('lspsaga.hover', function(hover)
      nnoremap('<Leader>k', hover.render_hover_doc)
   end)
end)
