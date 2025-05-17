-- Neo-tree - file system browser
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    open_files_in_tabs = true, -- This setting will make Neo-tree open files in tabs
    window = {
      mappings = {
        ["o"] = "open_with_window_picker",
        ["<cr>"] = "open_tab_drop",  -- Changed default open behavior to use tab
        ["t"] = "open_tab_drop",    -- Explicitly open in tab
        ["s"] = "open_split",       -- Still allow split if needed
        ["v"] = "open_vsplit",      -- Still allow vsplit if needed
      },
    },
  },
}
