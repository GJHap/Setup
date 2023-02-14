return {
   'nvim-neotest/neotest',
   lazy = true,
   init = function()
      local nnoremap = require('util').nnoremap
      nnoremap('<Leader>tc', function()
         require('neotest').run.run()
      end, { desc = 'Test - Run Current' })
      nnoremap('<Leader>td', function()
         require('neotest').run.run({ strategy = 'dap' })
      end, { desc = 'Test - Debug Current' })
      nnoremap('<Leader>tf', function()
         require('neotest').run.run(vim.fn.expand('%'))
      end, { desc = 'Test - Run File' })
      nnoremap('<Leader>ts', function()
         require('neotest').summary.toggle()
      end, { desc = 'Test - Toggle Summary' })
      nnoremap('<Leader>to', function()
         require('neotest').output.open()
      end, { desc = 'Test - Open Output' })
   end,
   config = function()
      require('neotest').setup({
         quickfix = {
            enabled = false,
         },
         adapters = {
            require('neotest-jest'),
         },
      })
   end,
   dependencies = {
      'haydenmeade/neotest-jest',
      'nvim-lua/plenary.nvim',
      require('plugins.treesitter'),
      'antoinemadec/FixCursorHold.nvim',
   },
}
