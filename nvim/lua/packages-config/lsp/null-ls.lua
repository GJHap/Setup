local status, opts = pcall(require, 'packages-config/lsp/null-ls-opts')

if status then opts = opts else opts = {} end

require('null-ls').setup(opts)
