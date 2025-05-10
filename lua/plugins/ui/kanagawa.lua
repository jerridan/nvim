-- Kanagawa colorscheme

return {
  'rebelot/kanagawa.nvim',
  priority = 1000,
  config = function()
    require('kanagawa').setup {
      compile = false,
      undercurl = true,
      commentStyle = { italic = false },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      theme = 'wave', -- options: wave, dragon, lotus
      background = {
        dark = 'wave',
        light = 'lotus',
      },
      colors = {},
      overrides = function()
        return {}
      end,
    }
  end,
}
