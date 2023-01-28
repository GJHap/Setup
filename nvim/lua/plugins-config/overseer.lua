local util = require('util')
local prequire = util.prequire

prequire('overseer', function(overseer)
   overseer.setup()

   local nnoremap = util.nnoremap
   nnoremap('<Leader>ot', overseer.toggle, { desc = 'Toggle Task Runner' })
   nnoremap('<Leader>ol', overseer.load_task_bundle, { desc = 'Load Task' })
   nnoremap('<Leader>os', overseer.save_task_bundle, { desc = 'Save Task' })
   nnoremap('<Leader>od', overseer.delete_task_bundle, { desc = 'Delete Task' })
end)
