return {
   'stevearc/overseer.nvim',
   lazy = true,
   init = function()
      local nnoremap = require('util').nnoremap
      nnoremap('<Leader>ot', function()
         require('overseer').toggle()
      end, { desc = 'Toggle Task Runner' })
      nnoremap('<Leader>ol', function()
         require('overseer').load_task_bundle()
      end, { desc = 'Load Task' })
      nnoremap('<Leader>os', function()
         require('overseer').save_task_bundle()
      end, { desc = 'Save Task' })
      nnoremap('<Leader>od', function()
         require('overseer').delete_task_bundle()
      end, { desc = 'Delete Task' })
   end,
   config = true,
}
