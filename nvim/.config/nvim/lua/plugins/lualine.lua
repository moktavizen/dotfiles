return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- enabled = false,
  event = 'VeryLazy',
  config = function()
    local colors = {
      blue = '#82aaff',
      green = '#c3e88d',
      black = '#212121',
      white = '#eeffff',
      red = '#f07178',
      violet = '#c792ea',
      grey = '#3e3e3e',
      light_grey = '#848484',
    }

    local split_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.light_grey, bg = colors.black },
      },

      insert = { a = { fg = colors.black, bg = colors.red, gui = 'bold' } },
      visual = { a = { fg = colors.black, bg = colors.green, gui = 'bold' } },
      replace = { a = { fg = colors.black, bg = colors.violet, gui = 'bold' } },

      inactive = {
        a = { fg = colors.light_grey, bg = colors.black },
        b = { fg = colors.light_grey, bg = colors.black },
        c = { fg = colors.light_grey, bg = colors.black },
      },
    }

    require('lualine').setup {
      options = {
        theme = split_theme,
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
