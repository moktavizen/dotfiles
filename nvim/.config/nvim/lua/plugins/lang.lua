-- Plugins that affects language support
return {
  -- Auto install package for LSPs and related tools
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      -- Listed as dependencies to ensure they load first
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
    event = 'VeryLazy',
    config = function()
      -- NOTE: Step 1 - Install the LSP/formatter
      local needed_tools = {
        'lua_ls',
        'bashls',
        'emmet_language_server',
        'html',
        'cssls',
        'ts_ls',
        'stylua',
        'shfmt',
        'prettierd',
        'biome',
        'xmlformatter',
      }
      require('mason-tool-installer').setup({
        ensure_installed = needed_tools,
      })

      -- See https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
      vim.api.nvim_command('MasonToolsInstall')
      vim.api.nvim_create_autocmd('User', {
        desc = 'Start current buffer LSP after installing it',
        pattern = 'MasonToolsUpdateCompleted',
        callback = function()
          vim.schedule(function()
            vim.api.nvim_command('LspStart')
          end)
        end,
      })

      -- Cleanup unneeded tools
      local installed_tools = require('mason-registry').get_all_package_names()
      if #installed_tools > #needed_tools then
        vim.api.nvim_command('MasonToolsClean')
      end
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    config = function()
      -- NOTE: Step 2 - Configure the LSP if needed
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
          },
        },
      })

      -- NOTE: Step 3 - Enable the LSP
      vim.lsp.enable({
        'lua_ls',
        'bashls',
        'emmet_language_server',
        'html',
        'cssls',
        'ts_ls',
      })
    end,
  },

  -- Formatter
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      -- NOTE: Step 2 - Configure the formatter if needed
      formatters = {
        shfmt = {
          -- Google's shell style guide: shfmt -i 2 -ci -bn
          append_args = { '-i', '2', '-ci', '-bn' },
        },
        -- Sometimes a formatter has several conform-formatters, we can specify the name
        -- See `:h conform-formatters`
        ['biome-check'] = {
          append_args = { '--indent-style=space' },
        },
      },

      -- NOTE: Step 3 - Map the formatter
      formatters_by_ft = {
        lua = { 'stylua' },
        bash = { 'shfmt' },
        sh = { 'shfmt' },
        html = { 'prettierd' },
        css = { 'biome-check' },
        javascript = { 'biome-check' },
        typescript = { 'biome-check' },
        json = { 'biome-check' },
        xml = { 'xmlformatter' },
      },
      format_on_save = { lsp_format = 'fallback', timeout_ms = 500 },
    },
  },

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
}
