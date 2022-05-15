local on_attach = function()
   vim.diagnostic.config(
   {
      virtual_text = false,
      update_in_insert = true
   })
end

local lspconfig = require('lspconfig')
servers = { 'pyright', 'tsserver', 'eslint', 'cssls', 'html' }
for _,server in pairs(servers) do
   lspconfig[server].setup
   {
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = on_attach
   }
end

local nnoremap = require('util').nnoremap
nnoremap('<Leader>df', ':lua vim.diagnostic.open_float() <CR>')

