-- Buffer Tabs
return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VimEnter',
  opts = {
    options = {
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'Explorer',
          text_align = 'left',
          separator = true,
        },
      },
      always_show_bufferline = true,
      -- separator_style = { '', '' },
      -- groups = {
      --   items = {
      --     require('bufferline.groups').builtin.pinned:with { icon = '' },
      --   },
      -- },
    },
  },
  keys = {
    { '<S-h>', '<cmd>bprevious<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>bnext<cr>', desc = 'Next Buffer' },
    { '<leader>bh', "<cmd>lua require('bufferline').go_to(1, true)<cr>", desc = 'Switch to Buffer 1' },
    { '<leader>bj', "<cmd>lua require('bufferline').go_to(2, true)<cr>", desc = 'Switch to Buffer 2' },
    { '<leader>bk', "<cmd>lua require('bufferline').go_to(3, true)<cr>", desc = 'Switch to Buffer 3' },
    { '<leader>bl', "<cmd>lua require('bufferline').go_to(4, true)<cr>", desc = 'Switch to Buffer 4' },
    { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Toggle Pin' },
    { '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<cr>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>bd', '<cmd>bd<cr>', desc = 'Delete Buffer' },
  },
}
