local prequire = require('util').prequire

prequire('nvim-ts-autotag', function(autotag)
   autotag.setup{}
end)
