local js_formatters = { 'prettierd', 'prettier', stop_after_first = true }
if vim.env.LSP_DENO then
  js_formatters = { 'deno_fmt' }
end

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      javascript = js_formatters,
      javascriptreact = js_formatters,
      lua = { 'stylua' },
      typescript = js_formatters,
      typescriptreact = js_formatters,
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
