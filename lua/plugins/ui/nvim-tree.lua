-- Nvim-Tree file explorer

return {
  'nvim-tree/nvim-tree.lua',
  enabled = false, -- Disabled in favor of neo-tree
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    enabled = vim.g.have_nerd_font,
  },
  version = '*',
  config = function()
    require('nvim-tree').setup {
      -- renderer = {
      --   icons = {
      --     glyphs = {
      --       folder = {
      --         arrow_closed = '\u{f054}',
      --       },
      --     },
      --   },
      -- },
    }
  end,
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
  },
}
