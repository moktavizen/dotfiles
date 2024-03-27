return {
  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "hyprlang",
          "css",
          "php",
          -- "dart", -- tree-sitter-dart is slow and stuttery
        })
      end
    end,
    -- add hyprlang file detection
    vim.filetype.add({
      pattern = { [".*/hypr.*%.conf"] = "hyprlang" },
    }),
  },

  -- LSP, Linter, Formatter
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "phpactor" })
    end,
  },

  -- Markdown
  {
    "lukas-reineke/headlines.nvim",
    enabled = false, -- disable decoration on markdown file
  },

  -- Dart & Flutter
  {
    "akinsho/flutter-tools.nvim",
    -- lazy = false,
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    opts = {
      flutter_path = "/home/moktavizen/Documents/sdk/flutter/bin/flutter",
    },
  },
}
