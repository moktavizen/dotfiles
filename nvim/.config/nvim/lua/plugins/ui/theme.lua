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
    vim.cmd.colorscheme 'material-darker'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
  config = function()
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
        colors.editor.cursor = colors.main.blue -- set cursor caret to blue
        colors.editor.accent = colors.main.blue -- set accent to blue
        colors.editor.contrast = colors.editor.bg -- removing LazyVim top darker bar
      end,
      custom_highlights = {
        MiniIndentscopeSymbol = { fg = colors.editor.line_numbers }, -- set indentscope color
      },
    }
  end,
}
