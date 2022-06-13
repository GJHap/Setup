local prequire = require('util').prequire

prequire('nvim-dap-virtual-text', function(dap_virt_text)
  dap_virt_text.setup()
end)
