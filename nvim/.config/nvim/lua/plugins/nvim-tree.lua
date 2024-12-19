return {
  'nvim-tree/nvim-tree.lua',
  -- enabled = false,
  keys = {
    { '\\', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
  },
  opts = {
    update_focused_file = {
      enable = true,
      update_root = {
        enable = true,
      },
    },
  },
}
