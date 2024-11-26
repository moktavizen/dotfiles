-- nvim-tree recommendation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

return {
  'nvim-tree/nvim-tree.lua',
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
