-- Tokyo Night colorscheme

return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Load before all other start plugins
  config = function()
    require('tokyonight').setup {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }
  end,
}
