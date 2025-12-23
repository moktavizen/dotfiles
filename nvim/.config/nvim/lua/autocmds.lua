vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('on-lsp-attach', { clear = true }),
  callback = function(event)
    local highlight_augroup = vim.api.nvim_create_augroup('cursor-lsp-highlight', { clear = false })

    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd('LspDetach', {
      group = vim.api.nvim_create_augroup('on-lsp-detach', { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = 'cursor-lsp-highlight', buffer = event2.buf })
      end,
    })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Removes trailing whitespace on save',
  callback = function()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos('.', save_cursor)
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set zsh filetype to bash for better LSP/syntax support',
  pattern = 'zsh',
  command = 'set filetype=bash',
})

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
  desc = 'Insert newline when hitting Enter before closing tags',
  callback = function()
    vim.keymap.set('i', '<CR>', function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local next_chars = line:sub(col + 1, col + 2)
      return next_chars == '</' and '<CR><Esc>O' or '<CR>'
    end, { buffer = true, expr = true })
  end,
})
