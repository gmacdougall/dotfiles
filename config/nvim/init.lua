require 'gm.plugins'

require 'gm.utils'
require 'gm.defaults'

require 'gm.theme'

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
