return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
  },
  opts = {
    -- add any options here
    -- Suggested setup:
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- Classic command-line
    cmdline = {
      view = 'cmdline',
      format = {
        -- Classic input
        input = {
          view = 'cmdline',
        },
      },
    },
    -- Opaque notifications
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
  },
}
