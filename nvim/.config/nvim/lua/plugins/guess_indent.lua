return {
  'NMAC427/guess-indent.nvim',
  event = { 'InsertEnter' },
  config = function()
    require('guess-indent').setup({})

    vim.cmd('GuessIndent')
  end,
}
