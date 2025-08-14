-- Plugins that affects language support
local tools = {
  lsp = {
    lua_ls = {
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    },
    bashls = {},
    emmet_language_server = {},
    html = {},
    cssls = {},
    ts_ls = {},
  },
  formatter = {
    stylua = {
      filetypes = { 'lua' },
    },
    shfmt = {
      filetypes = { 'bash', 'sh' },
      settings = {
        -- Google's shell style guide: shfmt -i 2 -ci -bn
        append_args = { '-i', '2', '-ci', '-bn' },
      },
    },
    prettierd = {
      filetypes = { 'html' },
    },
    biome = {
      -- Sometimes a formatter has several conform-formatters, we can specify the name
      -- See `:h conform-formatters`
      name = 'biome-check',
      filetypes = { 'css', 'javascript', 'typescript', 'json' },
      settings = {
        append_args = { '--indent-style=space' },
      },
    },
    xmlformatter = {
      filetypes = { 'xml' },
    },
  },
}

return {
  -- Syntax highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- README stated no lazy
    -- but if not lazy loaded, ts add 100ms additional startup time
    event = 'VeryLazy',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      auto_install = true, -- Requires `tree-sitter-cli`
      highlight = { enable = true },
    },
  },

  -- Completion
  {
    'saghen/blink.cmp',
    -- Release tag to download pre-built binaries instead of compiling from source
    version = '1.*',
    event = { 'InsertEnter', 'CmdLineEnter' },
    opts = {
      fuzzy = { implementation = 'rust' },
    },
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    config = function()
      for lsp_name, lsp_config in pairs(tools.lsp) do
        vim.lsp.config(lsp_name, lsp_config)
        vim.lsp.enable(lsp_name)
      end
    end,
  },

  -- Configures Lua LSP for Neovim config,
  -- used for completion, annotations and signatures of Neovim apis
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  -- Formatter
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = function()
      -- Map formatter tools to conform.nvim
      local formatters = {}
      local formatters_by_ft = {}
      for name, config in pairs(tools.formatter) do
        local formatter_name = config.name or name

        if config.settings then
          formatters[formatter_name] = config.settings
        end

        for _, ft in ipairs(config.filetypes or {}) do
          formatters_by_ft[ft] = formatters_by_ft[ft] or {}
          table.insert(formatters_by_ft[ft], formatter_name)
        end
      end
      return {
        format_on_save = function()
          return { timeout_ms = 500, lsp_format = 'fallback' }
        end,
        formatters = formatters,
        formatters_by_ft = formatters_by_ft,
      }
    end,
  },

  -- Package manager for LSPs and related tools
  {
    'mason-org/mason.nvim',
    keys = {
      { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' },
    },
    opts = {
      ui = { backdrop = 100 },
    },
  },

  -- Translate LSP name to package name
  {
    'mason-org/mason-lspconfig.nvim',
    -- Listed as dependencies to ensure they load first
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    event = 'VeryLazy',
    opts = {
      -- Don't auto enable LSPs so we can lazy-load them via `nvim-lspconfig`
      automatic_enable = false,
    },
  },

  -- Auto install package for LSPs and related tools
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
    event = 'VeryLazy',
    config = function()
      local needed_tools = vim.tbl_keys(vim.tbl_extend('force', tools.lsp, tools.formatter))
      require('mason-tool-installer').setup {
        ensure_installed = needed_tools,
      }

      -- See https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
      vim.api.nvim_command 'MasonToolsInstall'
      vim.api.nvim_create_autocmd('User', {
        desc = 'Start current buffer LSP after installing it',
        pattern = 'MasonToolsUpdateCompleted',
        callback = function()
          vim.schedule(function()
            vim.api.nvim_command 'LspStart'
          end)
        end,
      })

      -- Cleanup unneeded tools
      local installed_tools = require('mason-registry').get_all_package_names()
      if #installed_tools > #needed_tools then
        vim.api.nvim_command 'MasonToolsClean'
      end
    end,
  },
}
