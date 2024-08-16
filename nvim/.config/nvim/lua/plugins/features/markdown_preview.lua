return {
  'toppair/peek.nvim',
  event = { 'VeryLazy' },
  build = 'deno task --quiet build:fast',
  config = function()
    require('peek').setup()
    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
  end,
  keys = {
    { '<leader>cmo', '<cmd>PeekOpen<cr>', desc = 'Open Markodown Preview' },
    { '<leader>cmc', '<cmd>PeekClose<cr>', desc = 'Close Markodown Preview' },
  },
}
