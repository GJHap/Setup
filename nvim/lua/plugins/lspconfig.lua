return {
   'neovim/nvim-lspconfig',
   lazy = true,
   event = 'BufReadPre',
   config = function()
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
         ['efm'] = function(server_name)
            local languages = require('plugins.config.lsp.efm')
            lspconfig[server_name].setup({
               capabilities = capabilities,
               on_attach = on_attach,
               init_options = { documentFormatting = true, documentRangeFormatting = true },
               root_dir = vim.loop.cwd,
               filetypes = vim.tbl_keys(languages),
               settings = {
                  rootMarkers = { '.git/' },
                  lintDebounce = '500ms',
                  languages = languages,
               },
            })
         end,
         ['lua_ls'] = function(server_name)
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
