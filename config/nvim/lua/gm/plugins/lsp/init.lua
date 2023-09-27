return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
    "nvim-lua/lsp-status.nvim",
    "jose-elias-alvarez/typescript.nvim",
    "b0o/schemastore.nvim",
    "williamboman/mason-lspconfig.nvim",
    require("gm.plugins.mason"),
    require("gm.plugins.lsp_lines"),
    require("gm.plugins.aerial"),
  },
  config = function()
    require("neodev").setup({})

    local lspconfig = require("lspconfig")

    require("gm.plugins.lsp.null-ls")
    local remaps = require("gm.plugins.lsp.remaps")

    local presentLspStatus, lsp_status = pcall(require, "lsp-status")
    local presentCmpNvimLsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    local presentLspSignature, lsp_signature = pcall(require, "lsp_signature")
    local presentNavic, navic = pcall(require, "nvim-navic")
    local presentUfo = pcall(require, "ufo")
    local ufo = require("gm.plugins.ufo.setup")

    vim.lsp.set_log_level("error") -- 'trace', 'debug', 'info', 'warn', 'error'

    local function try_attach_navic(client, bufnr)
      if presentNavic then
        local filetype = vim.api.nvim_buf_get_option(bufnr or 0, "filetype")

        if client.server_capabilities.documentSymbolProvider then
          if client.name == "graphql" then
            if filetype == "typescript" or filetype == "typescriptreact" or filetype == "javascript" then
              return
            end
          end

          if client.name == "eslint" or client.name == "angularls" or client.name == "null-ls" then
            return
          end

          --[[ vim.notify("attach navic to " .. client.name) ]]
          navic.attach(client, bufnr)
        end
      end
    end

    local function on_attach(client, bufnr)
      -- print(client.name)
      -- require("gm.utils.functions").tprint_keys(client.server_capabilities)
      remaps.set_default_on_buffer(client, bufnr)

      if presentLspStatus then
        lsp_status.on_attach(client)
      end

      if presentLspSignature then
        lsp_signature.on_attach({ floating_window = false, timer_interval = 500 })
      end

      try_attach_navic(client, bufnr)

      if client.name == "tsserver" then
        -- let prettier format
        client.server_capabilities.document_formatting = false
        client.server_capabilities.documentFormattingProvider = false
      end
    end

    local signs = {
      { name = "DiagnosticSignError", text = "" },
      { name = "DiagnosticSignWarn", text = "" },
      { name = "DiagnosticSignHint", text = "" },
      { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
      virtual_text = true,
      -- enables lsp_lines but we want to start disabled
      virtual_lines = false,
      -- show signs
      signs = {
        active = signs,
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focus = false,
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    local capabilities

    if presentCmpNvimLsp then
      capabilities = cmp_lsp.default_capabilities()
    else
      capabilities = vim.lsp.protocol.make_client_capabilities()
    end

    if presentLspStatus then
      lsp_status.register_progress()
      capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
    end

    if presentUfo then
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
    end

    local servers = {
      -- bashls = {},
      -- cssls = {},
      -- dockerls = {},
      -- graphql = {},
      -- html = {},
      -- jsonls = require("gm.plugins.lsp.servers.jsonls")(capabilities),
      sorbet = {},
      -- yamlls = require("gm.plugins.lsp.servers.yamlls")(capabilities),
    }

    local default_lsp_config = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 200,
        allow_incremental_sync = true,
      },
    }

    local server_names = {}
    for server_name, _ in pairs(servers) do
      table.insert(server_names, server_name)
    end
    --[[ setupped by typescript package so we need to ensure installed by mason ]]
    table.insert(server_names, "tsserver")

    local present_mason, mason = pcall(require, "mason-lspconfig")
    if present_mason then
      mason.setup({ ensure_installed = server_names })
    end

    local present_typescript, typescript = pcall(require, "typescript")

    if vim.env.LSP_DENO then
      servers['denols'] = require('gm.plugins.lsp.servers.deno')
      if present_typescript then
        typescript.setup({
          server = {
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
            end,
            root_dir = lspconfig.util.root_pattern("tsconfig.json"),
            single_file_support = false,
          },
        })
      end
    else
      servers['eslint'] = require('gm.plugins.lsp.servers.eslint')
      if present_typescript then
        typescript.setup({
          server = {
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
            end,
          },
        })
      end
    end

    for server_name, server_config in pairs(servers) do
      local merged_config = vim.tbl_deep_extend("force", default_lsp_config, server_config)

      lspconfig[server_name].setup(merged_config)

      if server_name == "rust_analyzer" then
        local present_rust_tools, rust_tools = pcall(require, "rust-tools")

        if present_rust_tools then
          rust_tools.setup({ server = merged_config })
        end
      end
    end

    ufo.setupWithFallback()
  end,
}
