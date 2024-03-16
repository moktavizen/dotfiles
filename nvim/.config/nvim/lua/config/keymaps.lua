-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- buffers
map("n", "<leader>bh", "<cmd>lua require('bufferline').go_to(1, true)<cr>", { desc = "Switch to Visible Buffer 1" })
map("n", "<leader>bj", "<cmd>lua require('bufferline').go_to(2, true)<cr>", { desc = "Switch to Visible Buffer 2" })
map("n", "<leader>bk", "<cmd>lua require('bufferline').go_to(3, true)<cr>", { desc = "Switch to Visible Buffer 3" })
map("n", "<leader>bl", "<cmd>lua require('bufferline').go_to(4, true)<cr>", { desc = "Switch to Visible Buffer 4" })
