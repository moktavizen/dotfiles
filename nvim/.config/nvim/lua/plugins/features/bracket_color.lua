return {
  'HiPhish/rainbow-delimiters.nvim',
  ft = 'dart',
  config = function()
    require('rainbow-delimiters.setup').setup {
      highlight = {
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
        'RainbowDelimiterOrange',
        'RainbowDelimiterYellow',
      },
    }
  end,
}
