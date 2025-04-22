-- LSP server configurations

return {
  -- Example server configurations
  -- Uncomment and adjust as needed

  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- ts_ls = {},

  -- Lua language server
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- Uncomment to disable specific warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
}
