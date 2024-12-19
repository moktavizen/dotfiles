return {
  'ibhagwan/fzf-lua',
  -- enabled = false,
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- enabled = false,
  event = 'VimEnter',
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
      'max-perf',
      winopts = {
        backdrop = 100,
      },
      previewers = {
        bat = {
          theme = 'base16',
        },
      },
      fzf_opts = {
        ['--layout'] = 'default',
      },
    }
  end,
  keys = {
    { '<leader>sc', '<cmd>FzfLua highlights<cr>', desc = '[S]earch [C]olor highlights' },
    { '<leader>sh', '<cmd>FzfLua helptags<cr>', desc = '[S]earch [H]elp' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = '[S]earch [K]eymaps' },
    { '<leader>sf', '<cmd>FzfLua files<cr>', desc = '[S]earch [F]iles' },
    { '<leader>ss', '<cmd>FzfLua builtin<cr>', desc = '[S]earch [S]elect fzf' },
    { '<leader>sw', '<cmd>FzfLua grep_cword<cr>', desc = '[S]earch current [W]ord' },
    { '<leader>sg', '<cmd>FzfLua live_grep_native<cr>', desc = '[S]earch by [G]rep' },
    { '<leader>sd', '<cmd>FzfLua diagnostics_workspace<cr>', desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', '<cmd>FzfLua resume<cr>', desc = '[S]earch [R]esume' },
    { '<leader>s.', '<cmd>FzfLua oldfiles<cr>', desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader><leader>', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = '[ ] Find existing buffers' },
  },
}
