-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  -- enabled = false,
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
