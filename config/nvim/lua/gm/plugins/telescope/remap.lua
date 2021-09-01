local Mapper = require("nvim-mapper")

Mapper.map('n', '<leader>e', "<cmd>lua require('telescope.builtin').find_files()<cr>", {silent = true, noremap = true}, "telescope", "find_files", "Show all files")
Mapper.map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {silent = true, noremap = true}, "telescope", "find_files (alt)", "Show all files new keybinding")
Mapper.map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {silent = true, noremap = true}, "telescope", "live_grep", "grep through codebase")
