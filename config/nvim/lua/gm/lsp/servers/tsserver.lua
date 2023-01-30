local lsp = require('lspconfig')

return function(on_attach)
  local bin_path = "typescript-language-server"
  return {
    cmd = {bin_path, "--stdio" },
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      -- formatting is delegated to prettier
      client.server_capabilities.document_formatting = false
    end,
    root_dir = lsp.util.root_pattern("tsconfig.json"),
  }
end
