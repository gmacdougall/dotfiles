local lsp = require('lspconfig')

return {
  filetypes = { "typescriptreact" },
  root_dir = lsp.util.root_pattern("tailwind.config.js"),
}
