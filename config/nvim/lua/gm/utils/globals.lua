local functions = require('gm.utils.functions')

_G.reload = function()
  local counter = 0

  for moduleName in pairs(package.loaded) do
    if functions.starts_with(moduleName, 'gm.') then
      package.loaded[moduleName] = nil
      require(moduleName)
      counter = counter + 1
    end
  end
  print('Reloaded ' .. counter .. ' modules!')
end
