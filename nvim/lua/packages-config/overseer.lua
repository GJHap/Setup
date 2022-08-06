local util = require('util')
local prequire = util.prequire
local nnoremap = util.nnoremap

prequire('overseer', function(overseer)
   overseer.setup()

   nnoremap('<Leader>ot', overseer.toggle)
   nnoremap('<Leader>ol', overseer.load_task_bundle)
   nnoremap('<Leader>os', overseer.save_task_bundle)
   nnoremap('<Leader>od', overseer.delete_task_bundle)
end)
