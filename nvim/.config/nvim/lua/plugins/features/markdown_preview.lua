return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && bun install",
  keys = {
    { '<leader>cmp', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Toggle Markodown Preview' },
  },
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },

}
