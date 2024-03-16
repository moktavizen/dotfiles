return {
  -- enable colorful bracket pairs (depends on installed treesitter)
  {
    "HiPhish/rainbow-delimiters.nvim",
    -- config = true, -- for some reason this gives an error
  },

  -- enable css color highlight
  {
    "brenoprata10/nvim-highlight-colors",
    -- lazy = true,
    config = true,
    -- "NvChad/nvim-colorizer.lua",
    -- config = true,
  },

  -- disable indent color
  {
    "echasnovski/mini.indentscope",
    enabled = false,
    -- opts = { -- disable indent animation
    --   draw = { animation = require("mini.indentscope").gen_animation.none() },
    -- },
  },
}
