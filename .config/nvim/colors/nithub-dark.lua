-- Neutral GitHub Dark Default Theme for Neovim
-- Ported directly from VS Code GitHub Dark Default specifications
-- With some tweaks to neutralize the base colors

vim.cmd('highlight clear')

vim.o.termguicolors = true
vim.g.colors_name = 'nithub-dark'

local c = {
  -- Canvas / Backgrounds
  bg_canvas = '#1e1e1e',
  bg_dark = '#161616',
  bg_highlight = '#262626',
  bg_dark_highlight = '#393939',
  bg_visual = '#555555',
  border = '#3e3e3e',

  -- Foregrounds
  fg = '#e9e9e9',
  fg_bright = '#ffffff',
  fg_muted = '#9d9d9d',
  fg_subtle = '#7E7E7E',
  border_focus = '#1f6feb',

  -- Syntax Colors
  red = '#ff7b72',
  red_bright = '#ffa198',
  red_bg = '#490202',
  orange = '#ffa657',
  yellow = '#d29922',
  yellow_bright = '#e3b341',
  yellow_match = '#9e6a03',
  green = '#3fb950',
  green_bright = '#7ee787',
  green_bg = '#04260f',
  green_bracket = '#1a3b25',
  blue = '#58a6ff',
  blue_bright = '#79c0ff',
  blue_light = '#a5d6ff',
  purple = '#bc8cff',
  purple_bright = '#d2a8ff',
  pink = '#ff9bce',
  diff_add = '#1a4a29',
  diff_change = '#533e12',
  diff_delete = '#6b2a2b',

  none = 'NONE',
}

local highlights = {

  --
  -- Standard UI Highlights
  --

  Normal = { fg = c.fg, bg = c.bg_canvas },
  NormalNC = { fg = c.fg, bg = c.bg_canvas },
  NormalFloat = { fg = c.fg, bg = c.bg_dark },
  FloatBorder = { fg = c.border, bg = c.bg_dark },
  FloatTitle = { fg = c.fg_bright, bg = c.bg_dark, bold = true },
  FloatFooter = { fg = c.fg_muted, bg = c.bg_dark },

  Cursor = { fg = c.bg_canvas, bg = c.blue },
  lCursor = { link = 'Cursor' },
  CursorIM = { link = 'Cursor' },
  TermCursor = { link = 'Cursor' },

  CursorLine = { bg = c.bg_highlight },
  CursorColumn = { bg = c.bg_highlight },
  ColorColumn = { bg = c.bg_highlight },

  LineNr = { fg = c.fg_subtle, bg = c.bg_canvas },
  LineNrAbove = { fg = c.fg_subtle, bg = c.bg_canvas },
  LineNrBelow = { fg = c.fg_subtle, bg = c.bg_canvas },
  CursorLineNr = { fg = c.fg, bold = true },

  SignColumn = { fg = c.fg_subtle, bg = c.bg_canvas },
  CursorLineSign = { bg = c.bg_canvas },
  FoldColumn = { fg = c.fg_subtle, bg = c.bg_canvas },
  CursorLineFold = { bg = c.bg_highlight },
  Folded = { fg = c.fg_muted, bg = c.bg_highlight },

  WinSeparator = { fg = c.border, bg = c.none },
  VertSplit = { fg = c.border, bg = c.none },

  StatusLine = { fg = c.fg_muted, bg = c.bg_canvas },
  StatusLineNC = { fg = c.fg_subtle, bg = c.bg_canvas },

  TabLine = { fg = c.fg_muted, bg = c.bg_canvas },
  TabLineFill = { bg = c.bg_canvas },
  TabLineSel = { fg = c.fg_bright, bg = c.bg_canvas, bold = true },

  Pmenu = { link = 'NormalFloat' },
  PmenuSel = { bg = c.bg_dark_highlight },
  PmenuMatch = { fg = c.blue, bold = true },
  PmenuMatchSel = { link = 'PmenuMatch' },
  PmenuBorder = { link = 'FloatBorder' },
  PmenuSbar = { bg = c.bg_dark },
  PmenuThumb = { bg = c.border },

  Search = { fg = c.fg_bright, bg = c.yellow_match },
  CurSearch = { fg = c.bg_canvas, bg = c.yellow_bright, bold = true },
  IncSearch = { fg = c.bg_canvas, bg = c.yellow_bright, bold = true },
  Substitute = { fg = c.bg_canvas, bg = c.red, bold = true },

  Visual = { bg = c.bg_visual },
  VisualNOS = { bg = c.bg_visual },

  MatchParen = { bg = c.green_bracket, fg = c.green_bright, bold = true },
  Conceal = { fg = c.fg_subtle },
  Whitespace = { fg = c.bg_visual },
  NonText = { fg = c.fg_subtle },
  SpecialKey = { fg = c.fg_subtle },
  EndOfBuffer = { fg = c.bg_canvas },

  Directory = { fg = c.fg },
  Title = { fg = c.blue_bright, bold = true },
  ErrorMsg = { fg = c.red_bright, bold = true },
  WarningMsg = { fg = c.yellow_bright },
  MoreMsg = { fg = c.blue_light, bold = true },
  ModeMsg = { fg = c.fg_bright, bold = true },
  Question = { fg = c.green_bright },
  QuickFixLine = { bg = c.bg_highlight, bold = true },

  --
  -- Diff & Git Highlighting
  --

  DiffAdd = { fg = c.green_bright, bg = c.green_bg },
  DiffChange = { fg = c.orange, bg = c.orange_bg },
  DiffDelete = { fg = c.red_bright, bg = c.red_bg },
  DiffText = { fg = c.fg_bright, bg = c.bg_visual, bold = true },

  Added = { fg = c.green },
  Changed = { fg = c.yellow },
  Removed = { fg = c.red_bright },

  --
  -- Standard Syntax Highlighting
  --

  Comment = { fg = c.fg_muted, italic = true },
  SpecialComment = { fg = c.fg_muted, italic = true },

  Constant = { fg = c.blue_bright },
  String = { fg = c.blue_light },
  Character = { fg = c.red },
  Number = { fg = c.blue_bright },
  Boolean = { fg = c.blue_bright },
  Float = { fg = c.blue_bright },

  Identifier = { fg = c.fg },
  Function = { fg = c.purple_bright },

  Statement = { fg = c.red },
  Conditional = { fg = c.red },
  Repeat = { fg = c.red },
  Label = { fg = c.red },
  Operator = { fg = c.red },
  Keyword = { fg = c.red },
  Exception = { fg = c.red },

  PreProc = { fg = c.red },
  Include = { fg = c.red },
  Define = { fg = c.red },
  Macro = { fg = c.purple_bright },
  PreCondit = { fg = c.red },

  Type = { fg = c.orange },
  StorageClass = { fg = c.red },
  Structure = { fg = c.orange },
  Typedef = { fg = c.orange },

  Special = { fg = c.red },
  SpecialChar = { fg = c.green_bright, bold = true },
  Tag = { fg = c.green_bright },
  Delimiter = { fg = c.fg },
  Debug = { fg = c.yellow_bright },

  Underlined = { underline = true },
  Bold = { bold = true },
  Italic = { italic = true },
  Ignore = { fg = c.fg_subtle },
  Error = { fg = c.red_bright, bold = true },
  Todo = { fg = c.blue_light, bold = true },

  --
  -- Treesitter Standard Captures
  --

  ['@comment'] = { link = 'Comment' },
  ['@comment.documentation'] = { fg = c.fg_muted, italic = true },
  ['@comment.error'] = { fg = c.red_bright, bold = true },
  ['@comment.warning'] = { fg = c.yellow_bright, bold = true },
  ['@comment.todo'] = { fg = c.blue_light, bold = true },
  ['@comment.note'] = { fg = c.blue_bright, bold = true },

  ['@constant'] = { fg = c.blue_bright },
  ['@constant.builtin'] = { fg = c.blue_bright },
  ['@constant.macro'] = { fg = c.blue_bright },

  ['@string'] = { fg = c.blue_light },
  ['@string.documentation'] = { fg = c.blue_light },
  ['@string.regexp'] = { fg = c.blue_light },
  ['@string.escape'] = { fg = c.green_bright, bold = true },
  ['@string.special'] = { fg = c.blue_light },
  ['@string.special.symbol'] = { fg = c.blue_bright },
  ['@string.special.url'] = { fg = c.blue, underline = true },
  ['@string.special.path'] = { fg = c.blue_light },

  ['@character'] = { fg = c.red },
  ['@character.special'] = { fg = c.red },

  ['@number'] = { fg = c.blue_bright },
  ['@number.float'] = { fg = c.blue_bright },
  ['@boolean'] = { fg = c.blue_bright },

  ['@variable'] = { fg = c.fg },
  ['@variable.builtin'] = { fg = c.blue_bright },
  ['@variable.parameter'] = { fg = c.fg },
  ['@variable.parameter.builtin'] = { fg = c.blue_bright },
  ['@variable.member'] = { fg = c.fg },

  ['@property'] = { fg = c.blue_bright },
  ['@attribute'] = { fg = c.orange },
  ['@attribute.builtin'] = { fg = c.blue_bright },

  ['@function'] = { fg = c.purple_bright },
  ['@function.builtin'] = { fg = c.purple_bright },
  ['@function.call'] = { fg = c.purple_bright },
  ['@function.macro'] = { fg = c.purple_bright },
  ['@function.method'] = { fg = c.purple_bright },
  ['@function.method.call'] = { fg = c.purple_bright },
  ['@constructor'] = { fg = c.purple_bright },

  ['@operator'] = { fg = c.red },

  ['@keyword'] = { fg = c.red },
  ['@keyword.coroutine'] = { fg = c.red },
  ['@keyword.function'] = { fg = c.red },
  ['@keyword.operator'] = { fg = c.red },
  ['@keyword.import'] = { fg = c.red },
  ['@keyword.type'] = { fg = c.red },
  ['@keyword.modifier'] = { fg = c.red },
  ['@keyword.repeat'] = { fg = c.red },
  ['@keyword.return'] = { fg = c.red },
  ['@keyword.debug'] = { fg = c.red },
  ['@keyword.exception'] = { fg = c.red },
  ['@keyword.conditional'] = { fg = c.red },
  ['@keyword.conditional.ternary'] = { fg = c.red },
  ['@keyword.directive'] = { fg = c.red },
  ['@keyword.directive.define'] = { fg = c.red },

  ['@type'] = { fg = c.orange },
  ['@type.builtin'] = { fg = c.red },
  ['@type.definition'] = { fg = c.orange },

  ['@module'] = { fg = c.orange },
  ['@module.builtin'] = { fg = c.orange },
  ['@label'] = { fg = c.blue_bright },

  ['@punctuation.delimiter'] = { fg = c.fg },
  ['@punctuation.bracket'] = { fg = c.fg },
  ['@punctuation.special'] = { fg = c.red },

  ['@tag'] = { fg = c.green_bright },
  ['@tag.builtin'] = { fg = c.green_bright },
  ['@tag.attribute'] = { fg = c.fg },
  ['@tag.delimiter'] = { fg = c.fg_muted },

  -- Treesitter Markup / Markdown

  ['@markup.strong'] = { fg = c.fg, bold = true },
  ['@markup.italic'] = { fg = c.fg, italic = true },
  ['@markup.strikethrough'] = { fg = c.fg_muted, strikethrough = true },
  ['@markup.underline'] = { underline = true },
  ['@markup.heading'] = { fg = c.blue_bright, bold = true },
  ['@markup.quote'] = { fg = c.green_bright },
  ['@markup.math'] = { fg = c.blue_light },
  ['@markup.link'] = { fg = c.blue, underline = true },
  ['@markup.link.label'] = { fg = c.blue_light },
  ['@markup.link.url'] = { fg = c.blue, underline = true },
  ['@markup.raw'] = { fg = c.blue_bright },
  ['@markup.raw.block'] = { fg = c.fg },
  ['@markup.list'] = { fg = c.orange },
  ['@markup.list.checked'] = { fg = c.green },
  ['@markup.list.unchecked'] = { fg = c.fg_muted },

  ['@diff.plus'] = { fg = c.green_bright, bg = c.green_bg },
  ['@diff.minus'] = { fg = c.red_bright, bg = c.red_bg },
  ['@diff.delta'] = { fg = c.orange, bg = c.orange_bg },

  --
  -- Diagnostics
  --

  DiagnosticError = { fg = c.red_bright },
  DiagnosticWarn = { fg = c.yellow_bright },
  DiagnosticInfo = { fg = c.blue_light },
  DiagnosticHint = { fg = c.blue_bright },
  DiagnosticOk = { fg = c.green_bright },

  DiagnosticFloatingError = { fg = c.red_bright, bg = c.bg_dark },
  DiagnosticFloatingWarn = { fg = c.yellow_bright, bg = c.bg_dark },
  DiagnosticFloatingInfo = { fg = c.blue_light, bg = c.bg_dark },
  DiagnosticFloatingHint = { fg = c.blue_bright, bg = c.bg_dark },
  DiagnosticFloatingOk = { fg = c.green_bright, bg = c.bg_dark },

  DiagnosticUnderlineError = { undercurl = true, sp = c.red_bright },
  DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow_bright },
  DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue_light },
  DiagnosticUnderlineHint = { undercurl = true, sp = c.blue_bright },
  DiagnosticUnderlineOk = { undercurl = true, sp = c.green_bright },

  --
  -- Plugins
  --

  -- mini.starter
  MiniStarterHeader = { link = 'DiagnosticOk' },
  MiniStarterFooter = { link = 'DiagnosticInfo' },
  MiniStarterItemPrefix = { link = 'Normal' },

  -- mini.icons
  MiniIconsRed = { fg = c.red },
  MiniIconsGreen = { fg = c.green_bright },
  MiniIconsYellow = { fg = c.yellow_bright },
  MiniIconsBlue = { fg = c.blue_bright },
  MiniIconsPurple = { fg = c.purple_bright },
  MiniIconsCyan = { fg = c.blue_light },
  MiniIconsGrey = { fg = c.fg_muted },
  MiniIconsOrange = { fg = c.orange },
  MiniIconsAzure = { fg = c.blue_bright },

  -- mini.pick
  MiniPickMatchCurrent = { link = 'PmenuSel' },
  MiniPickPreviewLine = { link = 'PmenuSel' },
  MiniPickPrompt = { link = 'NormalFloat' },
  MiniPickMatchRanges = { link = 'PmenuMatchSel' },

  -- mini.files
  MiniFilesCursorLine = { link = 'PmenuSel' },
  MiniFilesBorderModified = { fg = c.border_focus, bg = c.bg_dark },

  -- mini.diff
  MiniDiffSignAdd = { fg = c.diff_add },
  MiniDiffSignChange = { fg = c.diff_change },
  MiniDiffSignDelete = { fg = c.diff_delete },
}

for group, hl in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, hl)
end
