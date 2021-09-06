local Mapper = require("nvim-mapper")
local opts = {silent = true, noremap = true}

Mapper.map(
  'n',
  '<leader>e',
  "<cmd>lua require('telescope.builtin').find_files()<cr>",
  opts,
  "telescope",
  "find_files",
  "Show all files"
)

Mapper.map(
  'n',
  '<leader>ff',
  "<cmd>lua require('telescope.builtin').find_files()<cr>",
  opts,
  "telescope",
  "find_files (alt)",
  "Show all files new keybinding"
)

Mapper.map(
  'n',
  '<leader>fg',
  "<cmd>lua require('telescope.builtin').live_grep()<cr>",
  opts,
  "telescope",
  "live_grep",
  "grep through codebase"
)
