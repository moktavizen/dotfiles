return {
  'marko-cerovac/material.nvim',
  enabled = false,
  init = function()
    vim.cmd 'colorscheme material'
  end,
  config = function()
    vim.g.material_style = 'darker'
    require('material').setup {

      contrast = {
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        cursor_line = true, -- Enable darker background for the cursor line
        lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
        non_current_windows = false, -- Enable contrasted background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
      },

      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "coc",
        -- "colorful-winsep",
        -- "dap",
        -- "dashboard",
        -- "eyeliner",
        -- "fidget",
        -- "flash",
        'gitsigns',
        -- "harpoon",
        -- "hop",
        -- "illuminate",
        'indent-blankline',
        -- "lspsaga",
        'mini',
        -- "neogit",
        -- "neotest",
        -- "neo-tree",
        -- "neorg",
        -- "noice",
        'nvim-cmp',
        -- "nvim-navic",
        'nvim-tree',
        'nvim-web-devicons',
        -- "rainbow-delimiters",
        -- "sneak",
        'telescope',
        -- "trouble",
        'which-key',
        -- "nvim-notify",
      },
    }
  end,
}
