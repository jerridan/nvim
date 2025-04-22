-- Lua filetype specific settings

-- These settings will only apply to Lua files
local opt = vim.opt_local

-- Indentation settings
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Enable adding trailing commas for multiline tables
opt.formatoptions:append('t')
