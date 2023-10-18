local util = require('lspconfig.util')

local root_dir = util.find_git_ancestor(vim.loop.cwd())

return function(capabilities)
  return {
    cmd = { root_dir .. "/bin/srb", "tc", "--lsp" }
  }
end
