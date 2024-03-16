return {
  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "hyprlang",
        "css",
        -- "dart", -- bug causing lags
      },
    },
    -- add hyprlang file detection
    vim.filetype.add({
      pattern = { [".*/hypr.*%.conf"] = "hyprlang" },
    }),
  },

  -- Dart & Flutter
  {
    "akinsho/flutter-tools.nvim",
    -- lazy = true,
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
}
