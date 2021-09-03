-- reload
Mapper = require("nvim-mapper")
Mapper.map('n', '<leader><CR>', '<cmd>lua reload()<CR>', { noremap = true }, 'editor', 'reload', 'Reloads configuration')

Mapper.map('n', '<leader>1', ':BufferGoto1<CR>', { noremap = true, silent = true }, 'barbar', 'tab 1', 'Select tab 1 in bar')
Mapper.map('n', '<leader>2', ':BufferGoto2<CR>', { noremap = true, silent = true }, 'barbar', 'tab 2', 'Select tab 2 in bar')
Mapper.map('n', '<leader>3', ':BufferGoto3<CR>', { noremap = true, silent = true }, 'barbar', 'tab 3', 'Select tab 3 in bar')
Mapper.map('n', '<leader>4', ':BufferGoto4<CR>', { noremap = true, silent = true }, 'barbar', 'tab 4', 'Select tab 4 in bar')
Mapper.map('n', '<leader>5', ':BufferGoto5<CR>', { noremap = true, silent = true }, 'barbar', 'tab 5', 'Select tab 5 in bar')
Mapper.map('n', '<leader>6', ':BufferGoto6<CR>', { noremap = true, silent = true }, 'barbar', 'tab 6', 'Select tab 6 in bar')
Mapper.map('n', '<leader>7', ':BufferGoto7<CR>', { noremap = true, silent = true }, 'barbar', 'tab 7', 'Select tab 7 in bar')
Mapper.map('n', '<leader>8', ':BufferGoto8<CR>', { noremap = true, silent = true }, 'barbar', 'tab 8', 'Select tab 8 in bar')
Mapper.map('n', '<leader>9', ':BufferLast<CR>', { noremap = true, silent = true }, 'barbar', 'tab 9', 'Select tab 9 in bar')

Mapper.map('n', '<C-c>', ':BufferClose<CR>', { noremap = true, silent = true }, 'barbar', 'Close buffer', 'Close the current buffer')
