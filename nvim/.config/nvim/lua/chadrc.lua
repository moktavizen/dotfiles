local M = {}

M.base46 = {
  theme = 'material-darker',

  hl_add = {
    DashboardIcon = { fg = 'red' },
    DashboardKey = { fg = 'blue' },
    DashboardFooter = { fg = 'purple' },
  },

  hl_override = {
    TbFill = { bg = 'none' },
    CursorLine = { bg = 'darker_black' },
    CursorColumn = { bg = 'darker_black' },
  },

  changed_themes = {
    all = {
      base_30 = {
        statusline_bg = 'none',
      },
    },
  },
}

M.ui = {
  statusline = {
    separator_style = 'block',
  },
}

M.nvdash = {
  load_on_startup = false,
}

return M
