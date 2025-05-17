-- Core keymaps file - contains basic non-plugin key mappings

-- Set leader key (must be set before plugins are loaded)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Tab navigation
vim.keymap.set('n', '<leader>1', '1gt', { desc = 'Go to tab 1' })
vim.keymap.set('n', '<leader>2', '2gt', { desc = 'Go to tab 2' })
vim.keymap.set('n', '<leader>3', '3gt', { desc = 'Go to tab 3' })
vim.keymap.set('n', '<leader>4', '4gt', { desc = 'Go to tab 4' })
vim.keymap.set('n', '<leader>5', '5gt', { desc = 'Go to tab 5' })
vim.keymap.set('n', '<leader>6', '6gt', { desc = 'Go to tab 6' })
vim.keymap.set('n', '<leader>7', '7gt', { desc = 'Go to tab 7' })
vim.keymap.set('n', '<leader>8', '8gt', { desc = 'Go to tab 8' })
vim.keymap.set('n', '<leader>9', '9gt', { desc = 'Go to tab 9' })
vim.keymap.set('n', '<leader>0', ':tablast<CR>', { desc = 'Go to last tab' })

-- Navigate to next/previous tabs
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Go to previous tab' })

-- More convenient tab navigation with Tab key
vim.keymap.set('n', '<Tab>', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>', { desc = 'Previous tab' })

-- Tab management
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close current tab' })

-- Exit terminal mode in the builtin terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Line navigation with Cmd key
-- Normal mode: Move cursor to the beginning of the line.
vim.keymap.set('n', '<D-Left>', '0', { silent = true, desc = 'Move to beginning of line' })
-- Normal mode: Move cursor to the end of the line.
vim.keymap.set('n', '<D-Right>', '$', { silent = true, desc = 'Move to end of line' })

-- Insert mode: Move cursor to the beginning of the line.
vim.keymap.set('i', '<D-Left>', '<Esc>0i', { silent = true, desc = 'Move to beginning of line' })
-- Insert mode: Move cursor to the end of the line.
vim.keymap.set('i', '<D-Right>', '<Esc>$a', { silent = true, desc = 'Move to end of line' })

-- Copy full absolute path to clipboard
vim.keymap.set('n', '<leader>cp', function()
  local full_path = vim.fn.expand '%:p'
  vim.fn.setreg('+', full_path)
  print('Copied: ' .. full_path)
end, { desc = 'Copy full path to clipboard' })

-- Copy relative path to clipboard
vim.keymap.set('n', '<leader>cr', function()
  local rel_path = vim.fn.expand '%'
  vim.fn.setreg('+', rel_path)
  print('Copied: ' .. rel_path)
end, { desc = 'Copy relative path to clipboard' })

-- Copy just the filename to clipboard
vim.keymap.set('n', '<leader>cf', function()
  local filename = vim.fn.expand '%:t'
  vim.fn.setreg('+', filename)
  print('Copied: ' .. filename)
end, { desc = 'Copy filename to clipboard' })

-- Copy directory path to clipboard
vim.keymap.set('n', '<leader>cd', function()
  local dir_path = vim.fn.expand '%:h'
  vim.fn.setreg('+', dir_path)
  print('Copied: ' .. dir_path)
end, { desc = 'Copy directory path to clipboard' })
