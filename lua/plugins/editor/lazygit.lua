-- LazyGit integration for better git workflow

return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    { '<leader>gf', '<cmd>LazyGitFilterCurrentFile<cr>', desc = 'LazyGit (current file)' },
  },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    
    -- Check if lazygit is installed
    if vim.fn.executable('lazygit') == 0 then
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          vim.notify(
            'LazyGit is not installed!\n\n' ..
            'Install it with one of these commands:\n' ..
            '  macOS:    brew install lazygit\n' ..
            '  Ubuntu:   sudo apt install lazygit\n' ..
            '  Arch:     sudo pacman -S lazygit\n\n' ..
            'Or visit: https://github.com/jesseduffield/lazygit',
            vim.log.levels.WARN,
            { title = 'LazyGit Not Found' }
          )
        end,
      })
    end
  end,
}