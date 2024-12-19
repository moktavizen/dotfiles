return {
  'christoomey/vim-tmux-navigator',
  -- enabled = false,
  lazy = false,
  keys = {
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Tmux window left' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Tmux window down' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Tmux window up' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Tmux window right' },
  },
}
