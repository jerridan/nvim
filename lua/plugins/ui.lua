-- UI related plugins

return {
  -- Colorscheme: Kanagawa
  {
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
  },
  -- Colorscheme: Tokyo Night
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Load before all other start plugins
    config = function()
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }
      -- Theme setting moved to the bottom of this file
    end,
  },

  -- Colorscheme: Catppuccin
  {
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
  },

  -- Display keybind help
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>tt', desc = 'Toggle Theme' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
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
  },

  -- Mini plugins collection - statusline
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Only load the statusline from mini for now
      -- Other mini modules will be in the 'editor' category
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- Custom statusline formatting
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  -- Highlight todo comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
