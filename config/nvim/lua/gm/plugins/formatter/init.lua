return {
  'mhartington/formatter.nvim',
  lazy = true,
  cmd = {
    "Format",
    "FormatLock",
    "FormatWrite",
    "FormatWriteLock",
  },
  config = function()
    local util = require("formatter.util")
    local formatter = require("formatter")
    local prettierd = {
      function()
        return {
          exe = "prettierd",
          args = {vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    }

    formatter.setup({
      filetype = {
        javascript = prettierd,
        typescript = prettierd,
        typescriptreact = prettierd,
      },
    })
  end,
}
