return {
  -- enable css color highlight
  {
    "brenoprata10/nvim-highlight-colors",
    -- lazy = true,
    ft = "css",
    config = true,
  },

  -- disable indent animation
  {
    "echasnovski/mini.indentscope",
    -- enabled = false,
    opts = {
      draw = { animation = require("mini.indentscope").gen_animation.none() },
    },
  },
}
