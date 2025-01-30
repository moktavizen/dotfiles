return {
  enabled = true,
  'moktavizen/neutr.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'neutr'
    -- vim.cmd.colorscheme 'neutr-dev'
  end,
  -- 'folke/tokyonight.nvim',
  -- priority = 1000,
  -- init = function()
  --   vim.cmd.colorscheme 'tokyonight-night'
  -- end,
}
