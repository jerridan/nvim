-- Mini statusline

return {
  'echasnovski/mini.nvim',
  config = function()
    -- Only load the statusline from mini for now
    -- Other mini modules are in the 'editor' category
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- Custom statusline formatting
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
