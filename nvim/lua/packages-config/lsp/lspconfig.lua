local on_attach = function(client, bufnr)
   vim.diagnostic.config(
   {
      virtual_text = false,
      update_in_insert = true
   })
end

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.setup{}
local servers = lsp_installer.get_installed_servers()

local status, server_opts = pcall(require, 'packages-config/lsp/server-opts')
if status then server_opts = server_opts else server_opts = function(_, opts) return opts end end

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _,server in pairs(servers) do
   local opts =
   {
      capabilities = capabilities,
      on_attach = on_attach
   }

   lspconfig[server.name].setup(server_opts(server.name, opts))
end

