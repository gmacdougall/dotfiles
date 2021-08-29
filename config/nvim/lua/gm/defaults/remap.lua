-- reload
Mapper = require("nvim-mapper")
Mapper.map('n', '<leader><CR>', '<cmd>lua reload()<CR>', { noremap = true }, 'editor', 'reload', 'Reloads configuration')
