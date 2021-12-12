local lsp = require('lspconfig')

return {
  cmd = { "solargraph", "stdio" },
  init_options = {
    formatting = false,
  },
  root_dir = lsp.util.root_pattern(".solargraph.yml")
}
