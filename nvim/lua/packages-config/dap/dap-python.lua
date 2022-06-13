local prequire = require('util').prequire

prequire('dap-python', function(dap_python)
  dap_python.setup('python')
end)
