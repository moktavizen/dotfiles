local map = vim.keymap.set

map('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Remove search highlight' })

map('n', '<C-H>', '<C-W><C-H>', { desc = 'Move focus to the left window' })
map('n', '<C-L>', '<C-W><C-L>', { desc = 'Move focus to the right window' })
map('n', '<C-J>', '<C-W><C-J>', { desc = 'Move focus to the lower window' })
map('n', '<C-K>', '<C-W><C-K>', { desc = 'Move focus to the upper window' })

-- Only use this when making a colorscheme
-- map('n', '<C-I>', '<Cmd>Inspect<CR>', { desc = 'Inspect highlight group under cursor' })

map('n', '<Leader>ba', '<Cmd>b #<CR>', { desc = 'Switch to alternate buffer' })

map({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action' })
map('n', '<Leader>cr', vim.lsp.buf.rename, { desc = 'Rename' })

map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
