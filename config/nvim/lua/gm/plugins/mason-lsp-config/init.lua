return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    local lsp_config = require("mason-lspconfig")
    lsp_config.setup()
  end,
  dependencies = {
    "neovim/nvim-lspconfig",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "williamboman/mason.nvim",
  },
}
