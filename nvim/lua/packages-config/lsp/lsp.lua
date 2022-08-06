local on_attach = require('packages-config/lsp/on_attach')
local prequire = require('util').prequire

prequire('mason', function(mason)
   mason.setup({})

   prequire('mason-lspconfig', function(mason_lspconfig)
      mason_lspconfig.setup()

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      prequire('cmp_nvim_lsp', function(cmp)
         capabilities = cmp.update_capabilities(capabilities)
      end)

      prequire('lspconfig', function(lspconfig)
         mason_lspconfig.setup_handlers({
            function(server_name)
               lspconfig[server_name].setup({
                  capabilities = capabilities,
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
                        workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                     },
                  },
               })
            end,
         })
      end)
   end)
end)
