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
            require('neotest-vitest'),
         },
      })
   end,
   dependencies = {
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-jest',
      'marilari88/neotest-vitest',
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      require('plugins.treesitter'),
   },
}
