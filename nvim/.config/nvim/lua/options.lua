-- Sync system clipboard
-- Schedule the setting after `UiEnter` because it can increase startup-time
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.undofile = true
vim.o.swapfile = false

vim.o.number = true
vim.o.numberwidth = 1
vim.o.statuscolumn = '%l %s%C'
vim.o.signcolumn = 'yes:1'

vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.showmode = false

vim.o.cursorline = true
vim.o.cursorlineopt = 'number'
-- vim.o.cursorcolumn = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.wrap = false
vim.o.linebreak = true
vim.o.breakindent = true

vim.o.scrolloff = 10

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.inccommand = 'split'
vim.o.updatetime = 250

vim.o.spell = true
vim.o.spelllang = 'en_us'

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  float = true,
  severity_sort = true,
})
