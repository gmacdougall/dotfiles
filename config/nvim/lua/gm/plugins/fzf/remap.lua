Mapper = require("nvim-mapper")
Mapper.map('n', '<leader>e', ":Files<CR>", {silent = true, noremap = true}, "fzf", "fzf_files", "Show all files")
