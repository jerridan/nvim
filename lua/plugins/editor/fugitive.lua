-- Git commands support via vim-fugitive

return {
  'tpope/vim-fugitive',
  dependencies = {
    -- GitHub support for fugitive
    'tpope/vim-rhubarb',
  },
  cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
  keys = {
    { '<leader>gk', 
      function()
        -- Stage all changes
        vim.cmd('Git add -A')
        -- Prompt for commit message and commit
        vim.ui.input({ prompt = 'Commit message: ' }, function(msg)
          if msg then
            vim.cmd(string.format('Git commit -m "%s"', msg))
          end
        end)
      end, 
      desc = 'Git stage and commit with message' 
    },
    -- Add new keymap for GBrowse
    { '<leader>go', '<cmd>GBrowse<CR>', desc = 'Git open file in browser' },
  },
}
