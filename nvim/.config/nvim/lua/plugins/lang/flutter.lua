-- Dart & Flutter
return {
  'akinsho/flutter-tools.nvim',
  -- lazy = false,
  ft = 'dart',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  opts = {
    flutter_path = '/usr/bin/flutter/bin/flutter',
    dev_log = {
      enabled = false,
      notify_errors = true,
      open_cmd = 'FlutterLog',
    },
    lsp = {
      color = {
        enabled = true,
        background = true,
      },
    },
  },
  keys = {
    { '<leader>cte', '<cmd>FlutterEmulators<cr>', desc = 'Shows a list of emulators' },
    { '<leader>ctq', '<cmd>FlutterQuit<cr>', desc = 'Ends a running session' },
    { '<leader>ctr', '<cmd>FlutterRun<cr>', desc = 'Run the current project' },
    { '<leader>ctl', '<cmd>FlutterRun<cr>', desc = 'Open Dev Log' },
  },
}
