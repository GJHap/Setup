local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local auto_format = function(client, bufnr)
   if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
         group = augroup,
         buffer = bufnr,
         callback = function()
            vim.lsp.buf.format({
               bufnr = bufnr,
               filter = function(client)
                  return client.name == 'efm'
               end,
            })
         end,
      })
   end
end

return function(client, bufnr)
   vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = true,
      signs = {
         text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
         },
         numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
         },
      },
   })

   vim.keymap.set('n', '<Leader>k', vim.lsp.buf.hover, { buffer = bufnr })
   vim.keymap.set('n', '<Leader>K', vim.lsp.buf.signature_help, { buffer = bufnr })
   vim.keymap.set('n', '<Leader>rr', vim.lsp.buf.rename, { buffer = bufnr })
   vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
   vim.keymap.set('n', '<Leader>df', function()
      vim.diagnostic.open_float({ border = 'single' })
   end, { buffer = bufnr })
   vim.keymap.set('v', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })

   auto_format(client, bufnr)
end
