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
          "blade",
          -- "dart", -- tree-sitter-dart is slow and stuttery
        })
      end
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      ---@class ParserConfig
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      -- add additional file detection
      vim.filetype.add({
        pattern = {
          [".*hypr.*%.conf"] = "hyprlang",
          [".*blade%.php"] = "blade",
        },
      })
    end,
  },

  -- Install LSP, Linter, Formatter
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "intelephense",
        "blade-formatter",
      })
    end,
  },

  -- Set Formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        blade = { "blade-formatter" },
      },
      formatters = {
        ["blade-formatter"] = {
          prepend_args = { "--sort-tailwindcss-classes" },
        },
      },
    },
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
      flutter_path = "/usr/bin/flutter/bin/flutter",
    },
  },
}
