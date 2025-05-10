-- Catppuccin colorscheme with theme toggle functionality

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = 'dark',
        percentage = 0.15,
      },
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        which_key = true,
        -- For more integrations, see the wiki:
        -- https://github.com/catppuccin/nvim#integrations
      },
    }

    -- Set the default colorscheme
    -- You can change this to your preferred theme
    vim.cmd.colorscheme 'kanagawa'

    -- Function to toggle between themes
    _G.toggle_theme = function()
      local current_theme = vim.g.colors_name
      if current_theme == 'kanagawa' then
        vim.cmd.colorscheme 'catppuccin'
        print 'Theme switched to Catppuccin'
      elseif current_theme == 'catppuccin' then
        vim.cmd.colorscheme 'tokyonight-night'
        print 'Theme switched to Tokyo Night'
      else
        vim.cmd.colorscheme 'kanagawa'
        print 'Theme switched to Kanagawa'
      end
    end

    -- Keymap to toggle between themes
    vim.keymap.set('n', '<leader>tt', _G.toggle_theme, { desc = '[T]oggle [T]heme' })
  end,
}
