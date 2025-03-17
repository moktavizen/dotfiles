return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- enabled = false,
  event = 'VeryLazy',
  opts = {
    options = {
      globalstatus = true,
      component_separators = '',
      section_separators = {
        left = '',
        right = '',
      },
      disabled_filetypes = {
        statusline = {
          'snacks_dashboard',
        },
      },
    },
    sections = {
      lualine_c = {
        'filename',
        'searchcount',
        'selectioncount',
      },
    },
  },
}
