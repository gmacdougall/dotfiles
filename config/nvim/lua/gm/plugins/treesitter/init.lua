return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    -- shows treesitter context in end of parenthesis
    'haringsrob/nvim_context_vt',
    'RRethy/nvim-treesitter-textsubjects',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local treesitter = require('nvim-treesitter.configs')

    treesitter.setup({
      ensure_installed = {
        'fish',
        'bash',
        'css',
        'dockerfile',
        'go',
        'graphql',
        'html',
        'javascript',
        'json',
        'lua',
        'ruby',
        'rust',
        'scss',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      },
      highlight = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          scope_incremental = '<CR>',
          node_incremental = '<TAB>',
          node_decremental = '<S-TAB>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          -- The keymaps are defined in the configuration table, no way to get our Mapper in there !
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',

            -- xml attribute
            ['ax'] = '@attribute.outer',
            ['ix'] = '@attribute.inner',

            -- json
            ['ak'] = '@key.outer',
            ['ik'] = '@key.inner',
            ['av'] = '@value.outer',
            ['iv'] = '@value.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>fpp'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>fpP'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
      },
      textsubjects = {
        enable = true,
        keymaps = {
          ['.'] = 'textsubjects-smart',
          [';'] = 'textsubjects-container-outer',
        },
      },
    })
  end,
  build = function()
    vim.cmd([[TSUpdate]])
  end,
}
