local prequire = require('util').prequire

prequire('null-ls', function(null_ls)
   null_ls.setup(
   {
      sources =
      {
         null_ls.builtins.formatting.prettier,
         null_ls.builtins.formatting.stylua
      },
      on_attach = require('packages-config/lsp/server-configs/auto-format')
   })
end)
