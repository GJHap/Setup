local util = require('util')
local prequire = util.prequire
local nnoremap = util.nnoremap

prequire('spectre', function(spectre)
   spectre.setup()

   prequire('spectre.state', function(spectre_state)
      nnoremap('<Leader>st', function()
         if spectre_state.bufnr ~= nil and #vim.fn.win_findbuf(spectre_state.bufnr) >= 1 then
            spectre.close()
         else
            spectre.open()
         end
      end)
   end)
end)
