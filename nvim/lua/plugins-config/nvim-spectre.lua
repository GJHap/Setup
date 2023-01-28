local util = require('util')
local prequire = util.prequire

prequire('spectre', function(spectre)
   spectre.setup()

   prequire('spectre.state', function(spectre_state)
      local nnoremap = util.nnoremap
      nnoremap('<Leader>st', function()
         if spectre_state.bufnr ~= nil and #vim.fn.win_findbuf(spectre_state.bufnr) >= 1 then
            spectre.close()
         else
            spectre.open()
         end
      end, { desc = 'Find and Replace' })
   end)
end)
