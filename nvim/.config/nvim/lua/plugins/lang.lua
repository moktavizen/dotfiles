-- Plugins that affects language support
return {
  -- NOTE: Step 1 - Install the LSP/formatter using package manager
  -- `pacman -S typescript-language-server`
  -- `npm i -g vscode-langservers-extracted`
  -- See `:h lspconfig-all` and `:h conform-formatters`

  -- LSP
  {
    'neovim/nvim-lspconfig',
    -- Nvim team stance is user should not be responsible for lazy loading,
    -- its the plugin dev responsibility.
    lazy = false,
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
      },

      -- NOTE: Step 3 - Map the formatter
      formatters_by_ft = {
        lua = { 'stylua' },
        bash = { 'shfmt' },
        sh = { 'shfmt' },
        html = { 'oxfmt' },
        css = { 'oxfmt' },
        javascript = { 'oxfmt' },
        typescript = { 'oxfmt' },
        json = { 'oxfmt' },
        markdown = { 'oxfmt' },
      },
      format_on_save = { lsp_format = 'fallback', timeout_ms = 500 },
    },
  },

  -- Linter
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require('lint')
      lint.linters_by_ft = {
        javascript = { 'oxlint' },
      }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.bo.modifiable then
            lint.try_lint()
          end
        end,
      })
    end,
  },

  -- Syntax highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    -- README stated no lazy
    -- See https://github.com/nvim-treesitter/nvim-treesitter#installation
    lazy = false,
    build = ':TSUpdate',
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
}
