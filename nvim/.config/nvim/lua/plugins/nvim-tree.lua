return {
  'nvim-tree/nvim-tree.lua',
  -- enabled = false,
  keys = {
    { '\\', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
  },
  -- See https://github.com/ahmedkhalf/project.nvim#-features
  opts = {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  },
}
