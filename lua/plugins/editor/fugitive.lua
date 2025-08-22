-- Git commands support via vim-fugitive

return {
  'tpope/vim-fugitive',
  dependencies = {
    -- GitHub support for fugitive
    'tpope/vim-rhubarb',
  },
  cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
  keys = {
    -- Open current file in GitHub (still useful for quick access)
    { '<leader>go', '<cmd>GBrowse<CR>', desc = 'Git open file in browser' },
  },
}
