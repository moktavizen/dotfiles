-- UI tweaks for signature help, LSP progress, messages, search, etc
return {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  event = 'VeryLazy',
  opts = {
    lsp = {
      -- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
      },
    },
    -- Classic command-line
    cmdline = {
      view = 'cmdline',
      format = {
        input = false,
      },
    },
    -- Opaque pop-ups
    views = {
      hover = {
        border = {
          padding = { left = 1, right = 1 },
        },
        win_options = {
          winblend = 0,
        },
      },
      mini = {
        border = {
          padding = { left = 1, right = 1 },
        },
        win_options = {
          winblend = 0,
        },
      },
    },
  },
}
