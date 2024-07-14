-- Dart & Flutter
return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  opts = {
    flutter_path = "/usr/bin/flutter/bin/flutter",
    dev_log = {
      enabled = false,
      notify_errors = false,
    },
    lsp = {
      color = {
        enabled = true,
        background = true,
      },
    },
  },
  keys = {
    { "<leader>cte", "<cmd>FlutterEmulators<cr>", desc = "Shows a list of emulators" },
    { "<leader>ctq", "<cmd>FlutterQuit<cr>", desc = "Ends a running session" },
    { "<leader>ctr", "<cmd>FlutterRun<cr>", desc = "Run the current project" },
    { "<leader>cto", "<cmd>FlutterOpenDevTools<cr>", desc = "Open Flutter DevTools" },
  },
}
