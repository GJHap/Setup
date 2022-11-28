local prequire = require('util').prequire

prequire('dap', function(dap)
   dap.adapters.node2 = {
      type = 'executable',
      command = 'node-debug2-adapter',
   }

   local node2 = {
      type = 'node2',
      sourceMaps = true,
      skipFiles = { '<node_internals>/**', '**/node_modules/**' },
   }
   local node_attach = vim.tbl_extend('error', node2, {
      name = 'Attach to process',
      request = 'attach',
      processId = require('dap.utils').pick_process,
   })
   local node_launch = vim.tbl_extend('error', node2, {
      name = 'Launch',
      request = 'launch',
      cwd = '${workspaceFolder}',
      protocol = 'inspector',
      console = 'integratedTerminal',
   })

   dap.configurations.javascript = {
      vim.tbl_extend('error', node_launch, {
         program = '${file}',
      }),
      node_attach,
   }

   dap.configurations.typescript = {
      vim.tbl_extend('error', node_launch, {
         runtimeArgs = { '-r', 'ts-node/register' },
         runtimeExecutable = 'node',
         args = { '--inspect', '${file}' },
      }),
      node_attach,
   }
end)
