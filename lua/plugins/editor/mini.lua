-- Mini plugins - text editing helpers

return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better text objects
    require('mini.ai').setup { n_lines = 500 }
    
    -- Text surround operations
    require('mini.surround').setup()
  end,
}
