-- MATERIAL-DARKER-HC
-- created on https://nvimcolors.com

-- Clear existing highlights and reset syntax
vim.cmd 'highlight clear'
vim.cmd 'syntax reset'

-- Basic UI elements
vim.cmd 'highlight Normal guibg=#212121 guifg=#eeffff'
vim.cmd 'highlight NonText  guifg=#303030'
vim.cmd 'highlight CursorLine guibg=#171717'
vim.cmd 'highlight LineNr guifg=#424242'
vim.cmd 'highlight CursorLineNr cterm=None gui=None guifg=#848484'
vim.cmd 'highlight SignColumn guibg=#212121'
vim.cmd 'highlight StatusLine gui=bold guibg=#212121 guifg=#848484'
vim.cmd 'highlight StatusLineNC gui=bold guibg=#212121 guifg=#535353'
vim.cmd 'highlight Directory guifg=#848484'
vim.cmd 'highlight Visual guibg=#353535'
vim.cmd 'highlight Search guibg=#ffcb6b guifg=#111111'
vim.cmd 'highlight CurSearch guibg=#c3e88d guifg=#111111'
vim.cmd 'highlight IncSearch gui=None guibg=#c3e88d guifg=#111111'
vim.cmd 'highlight MatchParen guibg=#ffcb6b guifg=#111111'
vim.cmd 'highlight Pmenu guibg=#1a1a1a guifg=#848484'
vim.cmd 'highlight PmenuSel guibg=#151515 guifg=#2979ff'
vim.cmd 'highlight PmenuSbar guibg=#363838 guifg=#1a1a1a'
vim.cmd 'highlight VertSplit guifg=#212121'
vim.cmd 'highlight MoreMsg guifg=#89ddff'
vim.cmd 'highlight Question guifg=#89ddff'
vim.cmd 'highlight Title cterm=None gui=None guifg=#eeffff'

-- Syntax highlighting
vim.cmd 'highlight Comment guifg=#545454 gui=italic'
vim.cmd 'highlight Constant guifg=#89ddff'
vim.cmd 'highlight Identifier guifg=#b2ccd6'
vim.cmd 'highlight Statement guifg=#89ddff'
vim.cmd 'highlight PreProc guifg=#89ddff'
vim.cmd 'highlight Type guifg=#ffcb6b gui=None'
vim.cmd 'highlight Special guifg=#89ddff'

-- Refined syntax highlighting
vim.cmd 'highlight String guifg=#c3e88d'
vim.cmd 'highlight Number guifg=#f78c6c'
vim.cmd 'highlight Boolean guifg=#ff9cac'
vim.cmd 'highlight Function guifg=#82aaff'
vim.cmd 'highlight Keyword guifg=#c792ea gui=italic'

-- Html syntax highlighting
vim.cmd 'highlight Tag guifg=#f07178'
vim.cmd 'highlight @tag.delimiter guifg=#89ddff'
vim.cmd 'highlight @tag.attribute guifg=#c792ea'

-- Messages
vim.cmd 'highlight ErrorMsg guifg=#f07178'
vim.cmd 'highlight Error guifg=#f07178'
vim.cmd 'highlight DiagnosticError guifg=#f07178'
vim.cmd 'highlight DiagnosticVirtualTextError guibg=#36292a guifg=#f07178'
vim.cmd 'highlight WarningMsg guifg=#ffcb6b'
vim.cmd 'highlight DiagnosticWarn guifg=#ffcb6b'
vim.cmd 'highlight DiagnosticVirtualTextWarn guibg=#373228 guifg=#ffcb6b'
vim.cmd 'highlight DiagnosticInfo guifg=#82aaff'
vim.cmd 'highlight DiagnosticVirtualTextInfo guibg=#2b2f37 guifg=#82aaff'
vim.cmd 'highlight DiagnosticHint guifg=#89ddff'
vim.cmd 'highlight DiagnosticVirtualTextHint guibg=#2b3437 guifg=#89ddff'
vim.cmd 'highlight DiagnosticOk guifg=#c3e88d'

-- Custom highlights

vim.cmd 'highlight Delimiter guifg=#89ddff' -- brackets
vim.cmd 'highlight NormalFloat guibg=#1a1a1a' -- floating windows
vim.cmd 'highlight WinSeparator guibg=#212121 guifg=#2a2a2a' -- separators

-- Common plugins

-- Telescope
vim.cmd 'highlight TelescopeSelection guibg=#353535' -- Telescope selection
vim.cmd 'highlight TelescopeNormal guibg=#1a1a1a guifg=#848484' -- Telescope default

-- nvim-tree
vim.cmd 'highlight NvimTreeNormal guibg=#1a1a1a guifg=#848484' -- nvim-tree default
vim.cmd 'highlight NvimTreeCursorLine guibg=#151515 guifg=#2979ff' -- nvim-tree cursor
vim.cmd 'highlight NvimTreeEndOfBuffer guibg=#1a1a1a' -- nvim-tree end
vim.cmd 'highlight NvimTreeRootFolder guifg=#848484' -- nvim-tree root folder

-- bufferline
vim.cmd 'highlight BufferLineOffset guibg=#1a1a1a guifg=#eeffff' -- bufferline offset

-- dashboard
vim.cmd 'highlight DashboardHeader guifg=#eeffff'
vim.cmd 'highlight DashboardDesc guifg=#eeffff'
vim.cmd 'highlight DashboardIcon guifg=#f07178'
vim.cmd 'highlight DashboardKey guifg=#82aaff'
vim.cmd 'highlight DashboardFooter guifg=#c792ea'

-- gitsigns
vim.cmd 'highlight Added guifg=#c3e88d'
vim.cmd 'highlight Changed guifg=#89ddff'
vim.cmd 'highlight Removed guifg=#f07178'

-- lazygit
vim.cmd 'highlight LazyGitFloat guibg=#1a1a1a guifg=#848484' -- fg bg
vim.cmd 'highlight LazyGitBorder guibg=#1a1a1a guifg=#848484' -- border
