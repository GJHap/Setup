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
   end)

   nnoremap('<Leader>td', function()
      neotest.run.run({ strategy = 'dap' })
   end)

   nnoremap('<Leader>tf', function()
      neotest.run.run(vim.fn.expand('%'))
   end)

   nnoremap('<Leader>ts', function()
      neotest.summary.toggle()
   end)

   nnoremap('<Leader>to', function()
      neotest.output.open()
   end)
end)
