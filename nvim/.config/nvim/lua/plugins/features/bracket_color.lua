return {
  'HiPhish/rainbow-delimiters.nvim',
  filetype = { 'dart', 'php' },
  config = function()
    require('rainbow-delimiters.setup').setup {
      highlight = {
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
      },
    }
  end,
}
