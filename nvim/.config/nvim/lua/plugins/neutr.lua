-- Colorscheme
return {
  -- 'moktavizen/neutr.nvim',
  dir = '~/Documents/repos/neutr.nvim/',
  dependencies = { 'echasnovski/mini.colors' },
  priority = 1000,
  opts = {
    -- hue = 284,
    -- bg_chroma = 0.03,
    -- fg_hue_mix = 100,
  },
  config = function()
    vim.cmd 'colorscheme neutr'
  end,
}
