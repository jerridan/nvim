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
  enabled = true,  -- Re-enabled for buffer-based workflow
  cmd = 'Neotree',
  keys = {
    { '<leader>ee', ':Neotree toggle<CR>', desc = 'Toggle File Explorer', silent = true },
    { '<leader>ef', ':Neotree reveal<CR>', desc = 'Find current file in explorer', silent = true },
    { '<leader>er', ':Neotree refresh<CR>', desc = 'Refresh file explorer', silent = true },
    { '<leader>ew', function()
      -- Check if neo-tree is open
      local manager = require("neo-tree.sources.manager")
      local neo_tree_winid = nil
      for _, winid in ipairs(vim.api.nvim_list_wins()) do
        local bufnr = vim.api.nvim_win_get_buf(winid)
        local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
        if ft == 'neo-tree' then
          neo_tree_winid = winid
          break
        end
      end
      
      if neo_tree_winid then
        local current_winid = vim.api.nvim_get_current_win()
        if current_winid == neo_tree_winid then
          -- We're in neo-tree, jump to the main editing window
          vim.cmd('wincmd l')
        else
          -- We're in a main window, jump to neo-tree
          vim.api.nvim_set_current_win(neo_tree_winid)
        end
      else
        -- Neo-tree not open, open it and focus
        vim.cmd('Neotree show')
      end
    end, desc = 'Switch focus between explorer and editor', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- This is what toggles the visibility
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false, -- only works on Windows for hidden files/directories
      },
    },
  },
  init = function()
    -- Open Neo-tree on startup when starting with a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
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
  end,
}
