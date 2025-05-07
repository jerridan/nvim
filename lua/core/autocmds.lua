-- Core autocommands file

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autosave files when text changes or focus is lost
vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged', 'FocusLost' }, {
  desc = 'Auto-save files when text changes or focus changes',
  group = vim.api.nvim_create_augroup('autosave', { clear = true }),
  pattern = '*',
  command = 'silent! update',
})
