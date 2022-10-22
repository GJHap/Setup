local prequire = require('util').prequire

prequire('treesitter-context', function(treesitter_context)
   treesitter_context.setup()
end)
