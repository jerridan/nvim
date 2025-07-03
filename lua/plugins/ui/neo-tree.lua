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
