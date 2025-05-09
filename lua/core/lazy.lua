-- Core lazy file - setup plugin manager

-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Configure and load plugins
require('lazy').setup({
  -- Import all plugin specs from their dedicated files
  { import = 'plugins.ui' },
  { import = 'plugins.editor.index' },
  { import = 'plugins.lsp' },
  { import = 'plugins.coding.index' },


  -- You can still add plugins directly here if you prefer
  { 'tpope/vim-sleuth', enabled = false }, -- Detect tabstop and shiftwidth automatically
}, {
  ui = {
    -- If using Nerd Font, configure icons appropriately
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
