-- Mini.bufremove - better buffer deletion without closing windows
-- https://github.com/echasnovski/mini.bufremove

return {
  'echasnovski/mini.bufremove',
  version = '*',
  config = function()
    require('mini.bufremove').setup()
  end,
}