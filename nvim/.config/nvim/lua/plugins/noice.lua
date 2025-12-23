-- UI tweaks for signature help, LSP progress, messages, search, etc
return {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  event = 'VeryLazy',
  opts = {
    lsp = {
      progress = {
        enabled = false,
      },
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
        input = {
          view = 'cmdline',
        },
      },
    },
    -- Opaque pop-ups
    views = {
      hover = {
        size = {
          max_width = 80,
          max_height = 6,
        },
        border = {
          padding = { 0, 1 },
        },
        win_options = {
          winblend = 0,
        },
      },
      mini = {
        border = {
          padding = { 0, 1 },
        },
        win_options = {
          winblend = 0,
        },
      },
    },
  },
}
