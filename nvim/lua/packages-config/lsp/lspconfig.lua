local on_attach = function(client, bufnr)
   vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = true,
   })

   require('packages-config/lsp/server-configs/auto-format')(client, bufnr)
end

local prequire = require('util').prequire
prequire('lspconfig', function(lspconfig)
   local servers = {}
   prequire('nvim-lsp-installer', function(lsp_install)
      lsp_install.setup({})
      servers = lsp_install.get_installed_servers()
   end)

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

   for _, server in pairs(servers) do
      local opts = {
         capabilities = capabilities,
         on_attach = on_attach,
      }

      lspconfig[server.name].setup(server_opts(server.name, opts))
   end
end)
