-- MATERIAL-DARKER-HC
-- created on https://nvimcolors.com

-- Clear existing highlights and reset syntax
vim.cmd 'highlight clear'
vim.cmd 'syntax reset'

-- Basic UI elements
vim.cmd 'highlight Normal guibg=#212121 guifg=#d9d9d9'
vim.cmd 'highlight NonText  guifg=#303030'
vim.cmd 'highlight CursorLine guibg=#171717'
vim.cmd 'highlight LineNr guifg=#424242'
vim.cmd 'highlight CursorLineNr cterm=None gui=None guifg=#848484'
vim.cmd 'highlight SignColumn guibg=#212121 guifg=#424242'
vim.cmd 'highlight StatusLine gui=bold guibg=#212121 guifg=#848484'
vim.cmd 'highlight StatusLineNC gui=bold guibg=#212121 guifg=#535353'
vim.cmd 'highlight Directory guifg=#848484'
vim.cmd 'highlight Visual guibg=#383838'
vim.cmd 'highlight Search guibg=#ffcb6b guifg=#212121'
vim.cmd 'highlight CurSearch guibg=#f07178 guifg=#212121'
vim.cmd 'highlight IncSearch gui=None guibg=#f07178 guifg=#212121'
vim.cmd 'highlight MatchParen guifg=#ffcb6b'
vim.cmd 'highlight Pmenu guibg=#171717 guifg=#848484'
vim.cmd 'highlight PmenuSel guibg=#2b2f37 guifg=#82aaff'
vim.cmd 'highlight PmenuSbar guibg=#171717 guifg=#383838'
vim.cmd 'highlight VertSplit guifg=#212121'
vim.cmd 'highlight MoreMsg guifg=#89ddff'
vim.cmd 'highlight Question guifg=#89ddff'
vim.cmd 'highlight Title cterm=None gui=None guifg=#d9d9d9'

-- Syntax highlighting
vim.cmd 'highlight Comment guifg=#9c9c9c gui=italic'
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
vim.cmd 'highlight Error guibg=#36292a guifg=#f07178'
vim.cmd 'highlight DiagnosticError guifg=#f07178'
vim.cmd 'highlight DiagnosticVirtualTextError guibg=#36292a guifg=#f07178'
vim.cmd 'highlight WarningMsg guifg=#ffcb6b'
vim.cmd 'highlight DiagnosticWarn guifg=#ffcb6b'
vim.cmd 'highlight DiagnosticVirtualTextWarn guibg=#373228 guifg=#ffcb6b'
vim.cmd 'highlight DiagnosticInfo guifg=#89ddff'
vim.cmd 'highlight DiagnosticVirtualTextInfo guibg=#2b3437 guifg=#89ddff'
vim.cmd 'highlight DiagnosticHint guifg=#82aaff'
vim.cmd 'highlight DiagnosticVirtualTextHint guibg=#2b2f37 guifg=#82aaff'
vim.cmd 'highlight DiagnosticOk guifg=#c3e88d'

-- Additional highlights

vim.cmd 'highlight Delimiter guifg=#89ddff' -- brackets
vim.cmd 'highlight NormalFloat guibg=#171717 guifg=#848484' -- floating windows
vim.cmd 'highlight WinSeparator guibg=#212121 guifg=#2a2a2a' -- separators
vim.cmd 'highlight PmenuThumb guibg=#383838' -- completion scrollbar
vim.cmd 'highlight QuickFixLine guifg=#89ddff'
vim.cmd 'highlight SpecialKey guifg=#303030'
vim.cmd 'highlight Folded guibg=#424242 guifg=#848484'
vim.cmd 'highlight Conceal guifg=#9c9c9c'
vim.cmd 'highlight CursorColumn guibg=#171717'
vim.cmd 'highlight ColorColumn guibg=#212121'
vim.cmd 'highlight WinBar gui=bold guibg=#212121 guifg=#848484'
vim.cmd 'highlight WinBarNC gui=bold guibg=#212121 guifg=#535353'
vim.cmd 'highlight DiagnosticVirtualTextOk guibg=#14170e guifg=#c3e88d'
vim.cmd 'highlight DiagnosticUnderlineError guisp=#f07178'
vim.cmd 'highlight DiagnosticUnderlineWarn guisp=#ffcb6b'
vim.cmd 'highlight DiagnosticUnderlineInfo guisp=#89ddff'
vim.cmd 'highlight DiagnosticUnderlineHint guisp=#82aaff'
vim.cmd 'highlight DiagnosticUnderlineOk guisp=#c3e88d'

-- Common plugins

-- fzf
vim.cmd 'highlight FzfLuaNormal guibg=#212121 guifg=#848484'
vim.cmd 'highlight FzfLuaBorder guibg=#171717 guifg=#848484'
vim.cmd 'highlight FzfLuaPreviewNormal guibg=#171717 guifg=#848484'
vim.cmd 'highlight FzfLuaHeaderText guifg=#f78c6c'
vim.cmd 'highlight FzfLuaBufFlagCur guifg=#f78c6c'
vim.cmd 'highlight FzfLuaLiveSym guifg=#f78c6c'
vim.cmd 'highlight FzfLuaHeaderBind guifg=#ffcb6b'
vim.cmd 'highlight FzfLuaBufNr guifg=#ffcb6b'
vim.cmd 'highlight FzfLuaTabMarker guifg=#ffcb6b'
vim.cmd 'highlight FzfLuaPathLineNr guifg=#c3e88d'
vim.cmd 'highlight FzfLuaBufFlagAlt guifg=#89ddff'
vim.cmd 'highlight FzfLuaPathColNr guifg=#89ddff'
vim.cmd 'highlight FzfLuaTabTitle guifg=#82aaff'
vim.cmd 'highlight FzfLuaBufName guifg=#c792ea'

-- nvim-tree
vim.cmd 'highlight NvimTreeNormal guibg=#171717 guifg=#848484' -- nvim-tree default
vim.cmd 'highlight NvimTreeCursorLine guibg=#2b2f37 guifg=#82aaff' -- nvim-tree cursor
vim.cmd 'highlight NvimTreeEndOfBuffer guibg=#171717' -- nvim-tree end
vim.cmd 'highlight NvimTreeRootFolder guifg=#848484' -- nvim-tree root folder

-- bufferline
vim.cmd 'highlight BufferLineOffset guibg=#171717 guifg=#d9d9d9' -- bufferline offset

-- snacks
vim.cmd 'highlight SnacksIndentScope guifg=#424242'
vim.cmd 'highlight SnacksDashboardHeader guifg=#d9d9d9'
vim.cmd 'highlight SnacksDashboardDesc guifg=#c792ea'
vim.cmd 'highlight SnacksDashboardIcon guifg=#f07178'
vim.cmd 'highlight SnacksDashboardKey guifg=#82aaff'
vim.cmd 'highlight SnacksDashboardFooter guifg=#ffcb6b'
vim.cmd 'highlight SnacksDashboardSpecial guifg=#ffcb6b'

-- git
vim.cmd 'highlight Added guifg=#5e6c4a'
vim.cmd 'highlight Changed guifg=#5c75a9'
vim.cmd 'highlight Removed guifg=#6f3f42'
vim.cmd 'highlight DiffAdd guibg=#14170e'
vim.cmd 'highlight DiffChange guibg=#2b2f37'
vim.cmd 'highlight DiffDelete guibg=#36292a'
vim.cmd 'highlight DiffText guibg=#2b3437'
vim.cmd 'highlight GitsignsStagedAdd guifg=#5e6c4a'
vim.cmd 'highlight GitsignsStagedAddNr guifg=#5e6c4a'
vim.cmd 'highlight GitsignsStagedAddCul guifg=#5e6c4a'
vim.cmd 'highlight GitsignsStagedAddLn guibg=#14170e'
vim.cmd 'highlight GitsignsStagedChange guifg=#5c75a9'
vim.cmd 'highlight GitsignsStagedChangeNr guifg=#5c75a9'
vim.cmd 'highlight GitsignsStagedChangeCul guifg=#5c75a9'
vim.cmd 'highlight GitsignsStagedChangeLn guibg=#2b2f37'
vim.cmd 'highlight GitsignsStagedChangedelete guifg=#5c75a9'
vim.cmd 'highlight GitsignsStagedChangedeleteNr guifg=#5c75a9'
vim.cmd 'highlight GitsignsStagedChangedeleteCul guifg=#5c75a9'
vim.cmd 'highlight GitsignsStagedChangedeleteLn guibg=#2b2f37'
vim.cmd 'highlight GitsignsStagedDelete guifg=#6f3f42'
vim.cmd 'highlight GitsignsStagedDeleteNr guifg=#6f3f42'
vim.cmd 'highlight GitsignsStagedDeleteCul guifg=#6f3f42'
vim.cmd 'highlight GitsignsStagedTopdelete guifg=#6f3f42'
vim.cmd 'highlight GitsignsStagedTopdeleteNr guifg=#6f3f42'
vim.cmd 'highlight GitsignsStagedTopdeleteCul guifg=#6f3f42'
