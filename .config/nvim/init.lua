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
vim.o.updatetime = 300

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

vim.o.laststatus = 1

vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

-- Uncomment these two line for pinpoint cursor
-- vim.o.cursorlineopt = 'both'
-- vim.o.cursorcolumn = true

vim.o.winborder = 'rounded'

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
vim.lsp.config('nil_ls', {
  settings = {
    formatting = {
      command = { 'nixfmt' },
    },
  },
})
-- Enable even if not in a project/workspace
vim.lsp.config('oxlint', {
  root_markers = {},
  workspace_required = false,
})
vim.lsp.config('qmlls', {
  cmd = { 'qmlls6' },
})
vim.lsp.enable({
  'lua_ls',
  'nil_ls',
  'emmet_language_server',
  'tsgo',
  'oxlint',
  'qmlls',
})

-- Formatter
vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })
require('conform').setup({
  formatters = {
    shfmt = {
      -- Google's shell style guide: shfmt -i 2 -ci -bn
      append_args = { '-i', '2', '-ci', '-bn' },
    },
  },

  formatters_by_ft = {
    lua = { 'stylua' },
    markdown = { 'oxfmt' },
    html = { 'oxfmt' },
    css = { 'oxfmt' },
    javascript = { 'oxfmt' },
    typescript = { 'oxfmt' },
    json = { 'oxfmt' },
    jsonc = { 'oxfmt' },
    bash = { 'shfmt' },
    sh = { 'shfmt' },
    toml = { 'taplo' },
  },
  format_on_save = { lsp_format = 'fallback', timeout_ms = 500 },
})

-- Syntax highlight
vim.pack.add({ 'https://github.com/arborist-ts/arborist.nvim' })
require('arborist').setup({
  install_popular = false,
})

-- Code completion
vim.pack.add({
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') },
})
require('blink.cmp').setup({
  fuzzy = { implementation = 'rust' },
})

-- QOL
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()
require('mini.align').setup()
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
  -- Yes, I know this dashboard is cringe
  dashboard = {
    sections = {
      { section = 'header' },
      { section = 'keys', gap = 1 },
    },
    preset = {
      header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡑⠄⣀⠀⠀⠰⡀⢢⣄⠀⡜⠽⣠⡄⠀⠸⢤⢷⠀⢀⡆⡰⠃⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣐⣕⠬⢳⡢⠤⢧⡦⣉⠳⢇⠹⡈⠓⣜⡇⢬⠠⣀⡶⠽⠑⠂⠉⠁⠢⡀⠀⠀⠀
⠀⠀⠀⠀⡀⣄⣠⣲⣍⣉⣉⣁⠀⠻⣵⡚⢴⡅⠢⡀⢓⠬⠀⠀⠙⠉⠳⣼⠑⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⡀⠀
⠀⢀⠠⠴⡄⣖⣀⣤⣤⣒⠹⢭⡙⣶⠈⠲⠄⠀⠆⡈⠪⣦⡀⠀⢘⡄⠀⡇⢸⠀⠀⡜⣜⠮⣧⢳⡣⠀⠀⢸⠀
⠀⠀⠀⠀⠛⠤⣿⠣⡌⡑⠋⠰⢈⠩⣃⠀⢰⠀⠀⢳⣄⢱⡟⠀⣸⠀⡸⢠⢸⠀⠀⠀⢲⠲⡔⡲⠀⠀⠀⢸⠀
⠀⠀⠀⢀⣔⣮⠩⠜⠛⠵⢄⠘⡣⡢⣈⡀⠘⣣⡀⠀⢫⡜⠈⠀⠙⢐⣷⣗⢸⠀⠀⢨⣩⡠⡍⡄⡄⠀⠀⢸⠀
⠹⣄⡴⡓⠂⠭⢀⡀⠅⠀⠰⢷⣦⣄⡨⠻⢦⡈⠣⠀⠀⠠⠄⠀⠃⠁⠈⠛⢻⠀⠀⠘⠘⠘⠘⠘⠐⠀⠀⡄⠀
⠀⠹⢹⡿⢿⣭⠧⠚⡈⡤⠔⠂⠀⠈⢉⣲⣤⠬⠁⠀⢀⣀⣼⠗⠀⠀⠀⢸⠀⣵⢤⣀⡀⠀⠀⠀⢀⣀⠌⣀⠀
⠀⢠⢖⢹⣙⠌⡐⠷⠛⣰⢁⢀⡴⠚⠋⠉⠀⣀⠐⠞⢉⢨⠜⠀⣴⠞⠀⠘⠀⠫⢆⠄⡹⡮⡉⢫⡸⠪⠂⠉⠉
⠰⠕⡓⡣⢳⢺⡼⢺⡽⢀⣦⢂⢒⠒⡆⡹⣩⠞⡠⣴⠛⡡⣂⡼⠱⢊⢐⡌⡤⡌⠂⠀⣷⢫⡼⢌⢳⡝⢷⠀⠀
⠈⠀⢹⠔⣩⣫⠼⡗⢵⣻⣰⣵⠗⡯⣰⠝⣡⠿⣣⡥⣛⠟⣣⠚⡠⡿⡚⣜⢆⡇⢳⠐⡞⡆⢛⡜⣥⠈⠂⠇⠀
⠀⠀⢑⠞⣩⣢⣣⣻⣿⡇⣳⡏⠳⡇⣲⣧⡒⠩⡢⢫⣛⠈⢏⠜⣰⣕⣟⡼⢺⡇⠿⡜⣰⡼⢡⢬⣹⡀⠀⠀⠀
⠀⠀⠐⠚⣙⢅⠶⣵⠎⣟⣧⣠⢿⢻⢿⠦⢤⣀⡀⢻⠀⠸⡱⣐⣠⡼⡾⠓⠒⡅⢸⡔⡙⠀⣍⣣⢿⠁⠀⠀⠀
⠀⠀⠐⠊⠉⢣⢫⡗⡸⡷⢃⠘⡟⠻⡚⡷⣦⠀⢹⡂⠀⠈⡔⠉⢀⡶⡟⢿⠟⢣⣸⣼⠁⡸⢌⢯⠲⡄⠀⠀⠀
⠀⠀⠀⠀⠈⠁⢸⠸⢳⢱⠀⠀⠘⠂⠈⠥⠜⠗⠰⠀⠀⠀⠁⠠⣜⠢⠬⠁⠐⢢⢯⠃⢱⢣⠇⠑⡆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠁⠜⠋⠛⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠐⠀⢦⡟⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⢸⠁⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣄⠀⠀⠀⠀⠀⠀⠀⠠⡀⡠⠀⠀⠀⠀⠀⠀⠀⠀⣸⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⢿⡢⡀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠄⠀⡠⢊⡇⠀⠀⠀⠀⠀ ⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠇⠘⢄⠀⠀⠘⠻⠭⠭⠭⠭⠋⠀⠀⡠⠊⢰⣿⠆⠀⠀⠀⠀ ⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣧⢠⡀⠈⢷⣄⠀⠀⠀⠀⠀⠀⠀⣠⠎⠀⠀⠜⣽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣯⠀⢺⣄⠈⢚⠑⠤⠤⠤⠤⢴⣾⠇⢀⡀⠀⠀⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      -- stylua: ignore
      keys = {
        { icon = ' ', key = 'f', desc = 'Find File',    action = ":lua Snacks.dashboard.pick('files')"     },
        { icon = ' ', key = 'g', desc = 'Find Text',    action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')"  },
      },
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
vim.keymap.set('n', '<leader>,', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
vim.keymap.set('n', "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set('n', '<leader>:', function() Snacks.picker.command_history() end, { desc = 'Command History' })
vim.keymap.set('n', '<leader>n', function() Snacks.picker.notifications() end, { desc = 'Notification History' })
vim.keymap.set({ 'n', 'x' }, '<leader>sw', function() Snacks.picker.grep_word() end, { desc = 'Visual selection or word' })
vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = 'Help Pages' })
vim.keymap.set('n', '<leader>sH', function() Snacks.picker.highlights() end, { desc = 'Highlights' })
vim.keymap.set('n', '<leader>sM', function() Snacks.picker.man() end, { desc = 'Man Pages' })
vim.keymap.set('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>sd', function() Snacks.picker.diagnostics() end, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>sq', function() Snacks.picker.qflist() end, { desc = 'Quickfix List' })
vim.keymap.set('n', 'gd', function() Snacks.picker.lsp_definitions() end, { desc = 'Goto Definition' })
vim.keymap.set('n', 'gD', function() Snacks.picker.lsp_declarations() end, { desc = 'Goto Declaration' })
vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end, { desc = 'References' })
vim.keymap.set('n', 'gI', function() Snacks.picker.lsp_implementations() end, { desc = 'Goto Implementation' })
vim.keymap.set('n', 'gy', function() Snacks.picker.lsp_type_definitions() end, { desc = 'Goto T[y]pe Definition' })
vim.keymap.set('n', '<leader>ss', function() Snacks.picker.lsp_symbols() end, { desc = 'LSP Symbols' })
vim.keymap.set('n', '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, { desc = 'LSP Workspace Symbols' })
-- stylua: ignore end

vim.keymap.set('n', '<leader>e', function()
  if not MiniFiles.close() then
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
  end
end, { desc = 'Toggle Floating File Explorer' })

--
-- Auto commands
--

-- From `:h lua-guide-autocommand-create`
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
  desc = 'Briefly highlight yanked text',
})

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end,
  desc = 'Remove trailing whitespace on save',
})

--
-- User commands
--

vim.api.nvim_create_user_command('Uindent', function(opts)
  local size = tonumber(opts.args)
  vim.o.tabstop = size
  vim.o.softtabstop = size
  vim.o.shiftwidth = size
  print('Indentation set to ' .. size)
end, { nargs = 1 })
