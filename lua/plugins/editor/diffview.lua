-- Diff view for git changes

return {
  'sindrets/diffview.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gv', '<cmd>DiffviewOpen<CR>', desc = 'Open Diffview (changed files)' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<CR>', desc = 'Open File History' },
    { '<leader>gc', '<cmd>DiffviewClose<CR>', desc = 'Close Diffview' },
  },
  opts = {
    use_icons = vim.g.have_nerd_font,
    icons = {
      folder_closed = '',
      folder_open = '',
    },
    signs = {
      fold_closed = '',
      fold_open = '',
      done = '✓',
    },
    view = {
      default = {
        layout = 'diff2_horizontal',
      },
      merge_tool = {
        layout = 'diff3_horizontal',
        disable_diagnostics = true,
      },
      file_history = {
        layout = 'diff2_horizontal',
      },
    },
    file_panel = {
      listing_style = 'tree',
      tree_options = {
        flatten_dirs = true,
        folder_statuses = 'only_folded',
      },
      win_config = {
        position = 'left',
        width = 35,
      },
    },
  },
}
