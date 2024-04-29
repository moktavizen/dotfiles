-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    update_focused_file = {
      enable = true,
      update_root = {
        enable = true,
      },
    },
  },
  keys = {
    { '\\', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle NvimTree' } },
  },
  -- 'nvim-neo-tree/neo-tree.nvim',
  -- version = '*',
  -- dependencies = {
  --   'nvim-lua/plenary.nvim',
  --   'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  --   'MunifTanjim/nui.nvim',
  -- },
  -- cmd = 'Neotree',
  -- keys = {
  --   { '\\', '<cmd>Neotree toggle reveal_force_cwd<cr>', { desc = 'Toggle NeoTree' } },
  -- },
  -- opts = {
  --   -- filesystem = {
  --   --   -- window = {
  --   --   --   mappings = {
  --   --   --     ['\\'] = 'close_window',
  --   --   --   },
  --   --   -- },
  --   --   follow_current_file = {
  --   --     enabled = true, -- auto cwd
  --   --   },
  --   use_libuv_file_watcher = true,
  --   -- },
  -- },
}
