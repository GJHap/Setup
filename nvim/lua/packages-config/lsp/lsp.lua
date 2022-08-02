local on_attach = function(client, bufnr)
   vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = true,
   })

   require('packages-config/lsp/server-configs/auto-format')(client, bufnr)
end

local prequire = require('util').prequire
prequire('mason-lspconfig', function(mason_lspconfig)
   mason_lspconfig.setup({})

   local server_opts = function(_, opts)
      return opts
   end
   prequire('packages-config/lsp/lsp-server-opts', function(_server_opts)
      server_opts = _server_opts
   end)

   local capabilities = vim.lsp.protocol.make_client_capabilities()
   prequire('cmp_nvim_lsp', function(cmp)
      capabilities = cmp.update_capabilities(capabilities)
   end)

   prequire('lspconfig', function(lspconfig)
      mason_lspconfig.setup_handlers({
         function(server_name)
            local opts = {
               capabilities = capabilities,
               on_attach = on_attach,
            }
            lspconfig[server_name].setup(server_opts(server_name, opts))
         end,
      })
   end)
end)
