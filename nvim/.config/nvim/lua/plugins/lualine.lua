-- UI tweaks for statusline
return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      globalstatus = true,
      component_separators = '',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        {
          'mode',
          padding = { left = 0, right = 1 },
        },
      },
      lualine_c = {
        '%t',
        -- stylua: ignore
        {
          function() return vim.bo.modified and '󰮯' or '' end,
          color = 'DiagnosticWarn',
          padding = 0,
        },
      },
      lualine_x = {
        -- Stolen from https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/plugins/ui.lua#L118-L123
        -- stylua: ignore
        {
          function() return require('noice').api.status.mode.get() end,
          cond = function() return package.loaded['noice'] and require('noice').api.status.mode.has() end,
          color = 'DiagnosticError',
        },
        'encoding',
        'filetype',
      },
      lualine_y = { 'searchcount', 'selectioncount', '%p%%' },
      lualine_z = {
        {
          '%l:%c',
          padding = { left = 1, right = 0 },
        },
      },
    },
  },
}
