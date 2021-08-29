Mapper = require("nvim-mapper")
Mapper.map('n', '<leader>e', ":GFiles<CR>", {silent = true, noremap = true}, "fzf", "fzf_git_files", "Show all git files")
Mapper.map('n', '<leader>E', ":Files<CR>", {silent = true, noremap = true}, "fzf", "fzf_files", "Show git files")
