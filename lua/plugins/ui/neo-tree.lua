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
  lazy = false,  -- Load the plugin immediately instead of on-demand
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      follow_current_file = { 
        enabled = true,  -- Make neo-tree follow the current file
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
  init = function()
    -- Open Neo-tree on startup for any normal buffer (including directories)
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Check if we have a directory argument or no arguments
        local is_dir = false
        if vim.fn.argc() > 0 then
          local first_arg = vim.fn.argv()[1]
          if vim.fn.isdirectory(first_arg) == 1 then
            is_dir = true
          end
        end
        
        -- Open Neo-tree if we have no args or the first arg is a directory
        if vim.fn.argc() == 0 or is_dir then
          vim.cmd("Neotree show")
        end
      end
    })
    
    -- Open Neo-tree in new tabs
    vim.api.nvim_create_autocmd("TabNew", {
      callback = function()
        -- Use a timer to ensure this runs after the tab is fully created
        vim.defer_fn(function() 
          -- Only open if we're in a normal buffer (not in a terminal, etc.)
          if vim.bo.buftype == "" then
            vim.cmd("Neotree show")
          end
        end, 10)
      end
    })
  end,
}
