return {
   'neovim/nvim-lspconfig',
   lazy = true,
   event = 'BufReadPre',
   config = function()
      local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
      for type, icon in pairs(signs) do
         local hl = 'DiagnosticSign' .. type
         vim.fn.sign_define(hl, { text = icon, texthl = hl })
      end

      local on_attach = require('plugins.config.lsp.on_attach')
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason-lspconfig').setup_handlers({
         function(server_name)
            lspconfig[server_name].setup({
               capabilities = capabilities,
               handlers = {
                  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
                     border = 'single',
                  }),
               },
               on_attach = on_attach,
            })
         end,
         ['sumneko_lua'] = function(server_name)
            lspconfig[server_name].setup({
               capabilities = capabilities,
               on_attach = on_attach,
               settings = {
                  Lua = {
                     runtime = { version = 'LuaJIT' },
                     diagnostics = { globals = { 'vim' } },
                     workspace = {
                        library = vim.api.nvim_get_runtime_file('', true),
                        checkThirdParty = false,
                     },
                  },
               },
            })
         end,
      })
   end,
   dependencies = {
      require('plugins.mason-lspconfig'),
      require('plugins.cmp'),
   },
}
