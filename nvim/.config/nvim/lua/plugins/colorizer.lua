return {
  -- the only one that supports css variable
  'brenoprata10/nvim-highlight-colors',
  -- enabled = false,
  opts = {},

  -- 'uga-rosa/ccc.nvim',
  -- opts = {
  --   highlighter = {
  --     auto_enable = true,
  --     lsp = true,
  --   },
  -- },

  -- 'NvChad/nvim-colorizer.lua',
  -- config = function()
  --   require('colorizer').setup {
  --     filetypes = { '*' },
  --     user_default_options = {
  --       names = true, -- "Name" codes like Blue or blue
  --       RGB = true, -- #RGB hex codes
  --       RRGGBB = true, -- #RRGGBB hex codes
  --       RRGGBBAA = true, -- #RRGGBBAA hex codes
  --       AARRGGBB = true, -- 0xAARRGGBB hex codes
  --       rgb_fn = true, -- CSS rgb() and rgba() functions
  --       hsl_fn = true, -- CSS hsl() and hsla() functions
  --       css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  --       css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
  --       -- Highlighting mode.  'background'|'foreground'|'virtualtext'
  --       mode = 'background', -- Set the display mode
  --       -- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True is same as normal
  --       tailwind = true, -- Enable tailwind colors
  --       -- parsers can contain values used in |user_default_options|
  --       sass = { enable = true, parsers = { 'css' } }, -- Enable sass colors
  --       -- Virtualtext character to use
  --       virtualtext = '■',
  --       -- Display virtualtext inline with color
  --       virtualtext_inline = false,
  --       -- Virtualtext highlight mode: 'background'|'foreground'
  --       virtualtext_mode = 'foreground',
  --       -- update color values even if buffer is not focused
  --       -- example use: cmp_menu, cmp_docs
  --       always_update = false,
  --     },
  --     -- all the sub-options of filetypes apply to buftypes
  --     buftypes = {},
  --     -- Boolean | List of usercommands to enable
  --     user_commands = true, -- Enable all or some usercommands
  --   }
  -- end,
}
