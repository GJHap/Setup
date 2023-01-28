local prequire = require('util').prequire

prequire('neotest', function(neotest)
   local adapters = {}
   prequire('neotest-jest', function(jest)
      table.insert(adapters, jest)
   end)

   neotest.setup({
      adapters = adapters,
   })

   local nnoremap = require('util').nnoremap
   nnoremap('<Leader>tc', function()
      neotest.run.run()
   end, { desc = 'Test - Run Current' })

   nnoremap('<Leader>td', function()
      neotest.run.run({ strategy = 'dap' })
   end, { desc = 'Test - Debug Current' })

   nnoremap('<Leader>tf', function()
      neotest.run.run(vim.fn.expand('%'))
   end, { desc = 'Test - Run File' })

   nnoremap('<Leader>ts', function()
      neotest.summary.toggle()
   end, { desc = 'Test - Toggle Summary' })

   nnoremap('<Leader>to', function()
      neotest.output.open()
   end, { desc = 'Test - Open Output' })
end)
