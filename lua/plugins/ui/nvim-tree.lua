-- Nvim-Tree file explorer - disabled in favor of neo-tree

return {
  'nvim-tree/nvim-tree.lua',
  enabled = false, -- Disabled in favor of neo-tree
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    enabled = vim.g.have_nerd_font,
  },
  version = '*',
}
