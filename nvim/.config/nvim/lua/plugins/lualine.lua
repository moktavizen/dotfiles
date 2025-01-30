return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- enabled = false,
  event = 'VeryLazy',
  config = function()
    require('lualine').setup {
      options = {
        globalstatus = true,
        component_separators = '',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = { 'snacks_dashboard' } },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' } } },
        lualine_b = { 'filename' },
        lualine_c = { 'branch' },
        lualine_x = { 'searchcount', 'selectioncount' },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' } },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = { 'branch' },
        lualine_c = {},
        lualine_x = { 'searchcount', 'selectioncount' },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
