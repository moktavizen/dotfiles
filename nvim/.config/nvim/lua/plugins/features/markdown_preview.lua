return {
  -- install without yarn or npm
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    { '<leader>cmp', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Toggle Markodown Preview' },
  },
}
