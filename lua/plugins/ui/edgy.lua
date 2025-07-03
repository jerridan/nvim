-- Edgy - Simplified for buffer-based workflow

return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = 'screen'
  end,
  opts = {
    left = {
      -- neo-tree file explorer in persistent sidebar
      {
        title = 'File Explorer',
        ft = 'neo-tree',
        size = { width = 35 },
        pinned = true,
        open = function()
          vim.cmd('Neotree show')
        end,
      },
    },
    bottom = {
      -- Terminal and other bottom windows
      {
        ft = 'toggleterm',
        size = { height = 0.4 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ''
        end,
      },
    },
    options = {
      left = { size = 35 },
      bottom = { size = 10 },
      right = { size = 30 },
      top = { size = 10 },
    },
    animate = {
      enabled = true,
      fps = 30,
      cps = 120,
    },
    -- Simplified settings for buffer workflow
    exit_when_last = false,
    close_when_all_hidden = false,
  },
}
