return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = 'markdown',
  keys = {
    { '<leader>cmp', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Toggle Markodown Preview' },
  },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
}
