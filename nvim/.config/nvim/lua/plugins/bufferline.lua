-- Buffer Tabs
return {
  'akinsho/bufferline.nvim',
  -- enabled = false,
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VimEnter',
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<leader>bh', "<cmd>lua require('bufferline').go_to(1, true)<cr>", desc = 'Switch to Buffer 1' },
    { '<leader>bj', "<cmd>lua require('bufferline').go_to(2, true)<cr>", desc = 'Switch to Buffer 2' },
    { '<leader>bk', "<cmd>lua require('bufferline').go_to(3, true)<cr>", desc = 'Switch to Buffer 3' },
    { '<leader>bl', "<cmd>lua require('bufferline').go_to(4, true)<cr>", desc = 'Switch to Buffer 4' },
    { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Toggle Buffer Pin' },
    { '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<cr>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>x', '<cmd>bd<cr>', desc = 'Delete Buffer' },
    { '<leader>X', '<cmd>BufferLineCloseOthers<cr>', desc = 'Delete Other Buffers' },
  },
  opts = {
    options = {
      style_preset = 3, -- no-bold
      always_show_bufferline = true,
      indicator = { style = 'none' },
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'Explorer',
          highlight = 'BufferLineOffset',
          text_align = 'left',
          separator = true,
        },
      },
    },
  },
}
