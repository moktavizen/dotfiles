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
  },
}
