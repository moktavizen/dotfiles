return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'marko-cerovac/material.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'material'
  end,
  config = function()
    -- for true color
    vim.opt.termguicolors = true

    -- Show which line your cursor is on
    -- vim.opt.cursorline = true
    -- vim.opt.cursorcolumn = true

    vim.g.material_style = 'darker'
    local colors = require 'material.colors'

    require('material').setup {
      contrast = {
        terminal = true, -- Enable contrast for the built-in terminal
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        cursor_line = true, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable contrasted background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
      },
      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        'dap',
        'dashboard',
        'eyeliner',
        'fidget',
        'flash',
        'gitsigns',
        'harpoon',
        'hop',
        'illuminate',
        'indent-blankline',
        'lspsaga',
        'mini',
        'neogit',
        'neotest',
        'neo-tree',
        'neorg',
        'noice',
        'nvim-cmp',
        'nvim-navic',
        'nvim-tree',
        'nvim-web-devicons',
        'rainbow-delimiters',
        'sneak',
        'telescope',
        'trouble',
        'which-key',
        'nvim-notify',
      },
      -- If you want to override the default colors, set this to a function
      custom_colors = function(colors)
        colors.editor.cursor = colors.main.yellow -- set cursor caret to blue
        colors.editor.accent = colors.main.blue -- set accent to blue
      end,
      custom_highlights = {
        -- require enabling cursorline on top
        CursorLine = { bg = '#171717' },
        CursorColumn = { bg = '#171717' },
        MiniIndentscopeSymbol = { fg = colors.editor.line_numbers }, -- set indentscope color
        DashboardIcon = { fg = colors.main.blue },
        DashboardKey = { fg = colors.main.red },
        DashboardFooter = { fg = colors.main.purple },
        BufferLineFill = { bg = colors.editor.bg },
        -- BufferLineBackground = { bg = colors.editor.bg },
        -- BufferLineBufferSelected = { bg = colors.editor.bg_alt },
        -- BufferLineCloseButtonSelected = { bg = colors.editor.bg_alt },
        -- BufferlineSeparatorSelected = { bg = colors.editor.bg_alt },
        -- BufferlineIndicatorSelected = { bg = colors.editor.bg_alt },
      },
    }
  end,
}
