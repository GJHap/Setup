local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require('lspconfig')

servers = { 'pyright', 'tsserver', 'eslint' }
for _,server in pairs(servers) do
   lspconfig[server].setup
   {
      capabilities = capabilities
   }  
end
