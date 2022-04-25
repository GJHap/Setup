local nnoremap = require('util').nnoremap

require('trouble').setup
{
   action_keys =
   {
      open_split = 'sh',
      open_vsplit = 'sv'
   }
}

nnoremap('<Leader>lr', ':TroubleToggle lsp_references <CR>')
nnoremap('<Leader>ld', ':TroubleToggle lsp_definitions <CR>')
nnoremap('<Leader>lp', ':TroubleToggle document_diagnostics <CR>')

