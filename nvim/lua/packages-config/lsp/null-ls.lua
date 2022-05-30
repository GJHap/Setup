local prequire = require('util').prequire

prequire('null-ls', function(null_ls)
   local opts = {}
   prequire('packages-config/lsp/null-ls-opts', function(_opts)
      opts = _opts
   end)

   null_ls.setup(opts)
end)
