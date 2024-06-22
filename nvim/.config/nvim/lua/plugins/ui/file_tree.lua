-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- nvim-tree recommendation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    { '\\', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
  },
  opts = {
    renderer = {
      root_folder_label = false, -- hide root directory at the top
    },
    update_focused_file = {
      enable = true,
      update_root = {
        enable = true,
      },
    },
  },
}
