return {
  'nvim-neotest/neotest',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'haydenmeade/neotest-jest',
    'olimorris/neotest-rspec',
  },
  keys = {
    {
      '<leader>;r',
      function()
        require('neotest').run.run()
      end,
      desc = 'Run the nearest test',
    },
    {
      '<leader>;f',
      function()
        require('neotest').run.run(vim.fn.expand('%'))
      end,
      desc = 'Run the current file tests',
    },
    {
      '<leader>;k',
      function()
        require('neotest').run.stop()
      end,
      desc = 'Stop the nearest test',
    },
    {
      '<leader>;s',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle neotest summary window',
    },
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-jest')({
          jestCommand = 'jest --watch ',
        }),
        require('neotest-rspec'),
      },
    })
  end,
}
