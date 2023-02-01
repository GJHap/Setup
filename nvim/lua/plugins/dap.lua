local create_node_configuration = function()
   local dap = require('dap')

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
end

return {
   'mfussenegger/nvim-dap',
   lazy = true,
   init = function()
      local nnoremap = require('util').nnoremap
      nnoremap('<F5>', function()
         require('dap').continue()
      end, { desc = 'DAP - Continue' })
      nnoremap('<F10>', function()
         require('dap').step_over()
      end, { desc = 'DAP - Step Over' })
      nnoremap('<F11>', function()
         require('dap').step_into()
      end, { desc = 'DAP - Step Into' })
      nnoremap('<Leader>db', function()
         require('dap').toggle_breakpoint()
      end, { desc = 'DAP - Toggle Breakpoint' })
      nnoremap('<Leader>dB', function()
         require('dap').set_breakpoint(vim.fn.input('Condition: '))
      end, { desc = 'DAP - Conditional Breakpoint' })
      nnoremap('<Leader>dq', function()
         require('dap').terminate()
      end, { desc = 'DAP - Terminate Session' })
      nnoremap('<Leader>de', function()
         require('dap').set_exception_breakpoints({ 'all' })
      end, { desc = 'DAP - Enable break on exception' })
      nnoremap('<Leader>dd', function()
         require('dap').set_exception_breakpoints({})
      end, { desc = 'DAP - Disable break on exception' })

      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'Error', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'Error', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'Error', linehl = '', numhl = '' })
   end,
   config = function()
      create_node_configuration()
      require('dap-python')
      require('nvim-dap-virtual-text')
   end,
   dependencies = {
      'mfussenegger/nvim-dap-python',
      {
         'theHamsta/nvim-dap-virtual-text',
         dependencies = {
            require('plugins.treesitter'),
         },
      },
   },
}
