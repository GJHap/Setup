local function getConfig(localPath)
   local basePath = 'efmls-configs.formatters'
   return require(basePath .. '.' .. localPath)
end

local stylua = getConfig('stylua')
local prettier = getConfig('prettier')
local nixfmt = getConfig('nixfmt')

return {
   lua = { stylua },
   typescript = { prettier },
   javascript = { prettier },
   typescriptreact = { prettier },
   javascriptreact = { prettier },
   yaml = { prettier },
   json = { prettier },
   html = { prettier },
   scss = { prettier },
   css = { prettier },
   markdown = { prettier },
   nix = { nixfmt },
}
