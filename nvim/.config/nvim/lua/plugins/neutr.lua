return {
  'moktavizen/neutr.nvim',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'neutr'
  end,
  -- 'folke/tokyonight.nvim',
  -- priority = 1000,
  -- init = function()
  --   vim.cmd.colorscheme 'tokyonight-night'
  -- end,
}
