-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  -- enabled = false,
  event = { 'VeryLazy' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
