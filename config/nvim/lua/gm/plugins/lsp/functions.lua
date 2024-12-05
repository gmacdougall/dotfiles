local M = {}

M.show_diagnostics = function(opts)
  opts = opts or {}
  vim.lsp.diagnostic.set_loclist({ open_loclist = false })
  require('telescope.builtin').loclist(opts)
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
M.lsp_install_servers = function()
  local function installLanguageServer(languageServer)
    vim.cmd('LspInstall ' .. languageServer)
  end

  installLanguageServer('denols')
  installLanguageServer('eslint')
  installLanguageServer('solargraph')
  installLanguageServer('tailwindcss')
  installLanguageServer('ts_ls')
end

return M
