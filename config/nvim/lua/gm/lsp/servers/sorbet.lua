local lsp = require('lspconfig')

return {
  cmd = { "srb", "tc", "--lsp", "--disable-watchman" },
  root_dir = lsp.util.root_pattern("sorbet"),
}
