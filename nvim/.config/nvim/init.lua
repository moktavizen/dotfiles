--
-- Options
--

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.o.clipboard = 'unnamedplus'

vim.o.undofile = true
vim.o.swapfile = false

vim.o.wrap = false
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.scrolloff = 10

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.inccommand = 'split'
vim.o.updatetime = 250

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.spell = true
vim.o.spelllang = 'en_us'

vim.o.number = true
vim.o.numberwidth = 1
vim.o.statuscolumn = '%l %s%C'
vim.o.signcolumn = 'yes:1'

vim.o.laststatus = 3

vim.o.cursorline = true
vim.o.cursorlineopt = 'number'
-- vim.o.cursorcolumn = true

-- vim.o.winborder = 'rounded'
-- vim.o.winborder = '+,-,+,`,+,-,+,`'

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  float = true,
  severity_sort = true,
})

--
-- Plugins
--

vim.pack.add({ 'https://github.com/moktavizen/neutr.nvim' })
vim.cmd.colorscheme('neutr')

-- LSP & Linter
vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
})
-- Enable even if not in a project/workspace
vim.lsp.config('oxlint', {
  root_markers = {},
  workspace_required = false,
})
vim.lsp.enable({
  'lua_ls',
  'ts_ls',
  'oxlint',
})

-- Formatter
vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })
require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    markdown = { 'oxfmt' },
    html = { 'oxfmt' },
    css = { 'oxfmt' },
    javascript = { 'oxfmt' },
    typescript = { 'oxfmt' },
    json = { 'oxfmt' },
    jsonc = { 'oxfmt' },
  },
  format_on_save = { lsp_format = 'fallback', timeout_ms = 500 },
})

-- Syntax highlight
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
-- Auto install parser and start `nvim-treesitter`
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local ts = require('nvim-treesitter')
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not vim.tbl_contains(ts.get_available(), lang) then
      return
    end
    if not vim.tbl_contains(ts.get_installed(), lang) then
      ts.install(lang):wait()
    end
    vim.treesitter.start()
  end,
})

-- Code completion
vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') },
})
require('blink.cmp').setup({
  fuzzy = { implementation = 'rust' },
})

vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require('mini.diff').setup({
  view = {
    style = 'sign',
    signs = { add = '┃', change = '┃', delete = '▶' },
  },
})
require('mini.files').setup()

vim.pack.add({ 'https://github.com/folke/snacks.nvim' })
require('snacks').setup({
  styles = {
    float = { backdrop = 100 },
  },
  picker = {
    sources = {
      files = { hidden = true },
      grep = { hidden = true },
      buffers = { hidden = true },
      explorer = { hidden = true },
    },
  },
})

--
-- Keymaps
--

vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Remove search highlight' })

-- Only use this when making a colorscheme
-- map('n', '<C-I>', '<Cmd>Inspect<CR>', { desc = 'Inspect highlight group under cursor' })

vim.keymap.set('n', '<Leader>bb', '<Cmd>b #<CR>', { desc = 'Switch to other buffer' })

-- stylua: ignore start
vim.keymap.set({ 'n', 'v' }, '<Leader>ca', function() vim.lsp.buf.code_action() end, { desc = 'Code Action' })
vim.keymap.set('n', '<Leader>cr', function() vim.lsp.buf.rename() end, { desc = 'Rename' })
vim.keymap.set('n', '<leader>pU', function() vim.pack.update() end, { desc = ' Update plugins' })

vim.keymap.set('n', '<leader><space>', function() Snacks.picker.files() end, { desc = 'Find Files' })
vim.keymap.set('n', "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set({ 'n', 'x' }, '<leader>sw', function() Snacks.picker.grep_word() end, { desc = 'Visual selection or word' })
vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = 'Help Pages' })
vim.keymap.set('n', '<leader>sH', function() Snacks.picker.highlights() end, { desc = 'Highlights' })
-- stylua: ignore end

vim.keymap.set('n', '<leader>e', function()
  if not MiniFiles.close() then
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end
end, { desc = 'Toggle Floating File Explorer' })

--
-- Autocommands
--

-- From `:h lua-guide-autocommand-create`
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
  desc = 'Briefly highlight yanked text',
})
