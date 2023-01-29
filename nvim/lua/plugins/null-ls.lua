return {
   'jose-elias-alvarez/null-ls.nvim',
   lazy = true,
   event = 'BufReadPre',
   config = function()
      local on_attach = require('plugins.config.lsp.on_attach')

      local null_ls = require('null-ls')
      null_ls.setup({
         sources = {
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.nixfmt,
         },
         on_attach = on_attach,
      })
   end,
}
