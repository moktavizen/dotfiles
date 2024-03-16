return {
  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "css",
          "hyprlang",
        })
      end
    end,
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
