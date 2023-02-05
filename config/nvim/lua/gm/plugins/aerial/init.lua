return {
  "stevearc/aerial.nvim",
  config = function()
    local aerial = require("aerial")

    aerial.setup({
      on_attach = function(bufnr)
        local r = require("gm.utils.remaps")

        r.noremap("n", "{", "<cmd>AerialPrev<CR>", "Aerial previous item", { buffer = bufnr })
        r.noremap("n", "}", "<cmd>AerialNext<CR>", "Aerial next item", { buffer = bufnr })
      end,
    })
  end,

  keys = {
    { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Aerial" },
  },
  cmd = "AerialToggle",
}
