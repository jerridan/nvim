-- Main LSP configuration

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- LSP manager
    { 'williamboman/mason.nvim', opts = {} },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- LSP status updates
    { 'j-hui/fidget.nvim', opts = {} },

    -- Completion capabilities
    'saghen/blink.cmp',
  },
  config = function()
    require 'config.lsp'
  end,
}
