return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>e',
      function()
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end
      end,
      desc = 'Toggle Floating File Explorer',
    },
  },
  init = function()
    -- Disable netrw in favor of `mini.files`
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function()
    -- Improves motion
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()

    -- Replaces nvim-web-devicons
    require('mini.icons').setup()
    MiniIcons.mock_nvim_web_devicons()

    -- Replaces gitsigns.nvim
    require('mini.diff').setup {
      view = {
        style = 'sign',
        signs = { add = '┃', change = '┃', delete = '┃' },
      },
    }

    -- Replaces netrw and nvim-tree
    require('mini.files').setup()

    -- Replaces nvim-autopairs
    require('mini.pairs').setup()

    -- Replaces vim-easy-align
    require('mini.align').setup()

    -- Replaces todo-comments
    require('mini.hipatterns').setup {
      highlighters = {
        fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
        hack = { pattern = 'HACK', group = 'MiniHipatternsHack' },
        todo = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
        note = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
      },
    }
  end,
}
