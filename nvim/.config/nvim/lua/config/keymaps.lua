-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- buffers
map("n", "<leader>bh", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Switch to Visible Buffer 1" })
map("n", "<leader>bj", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Switch to Visible Buffer 2" })
map("n", "<leader>bk", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Switch to Visible Buffer 3" })
map("n", "<leader>bl", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Switch to Visible Buffer 4" })
