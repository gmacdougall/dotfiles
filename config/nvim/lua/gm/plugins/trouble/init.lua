return {
  "folke/trouble.nvim",
  init = function()
    local r = require("gm.utils.remaps")
    r.noremap("n", "<leader>t", "<cmd>TroubleToggle<cr>", { silent = true })
  end,
  config = function()
    local trouble = require("trouble")

    trouble.setup({
    })
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
