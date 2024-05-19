return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VimEnter',
  opts = {
    options = {
      theme = 'material-stealth',
      disabled_filetypes = { statusline = { 'dashboard' } },
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' } } },
      lualine_z = { { 'location', separator = { right = '' } } },
    },
    extensions = { 'nvim-tree', 'lazy' },
  },
}
