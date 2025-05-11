-- LSP server configurations

return {
  -- Example server configurations
  -- Uncomment and adjust as needed

  -- Python
  pyright = {},
  
  -- Swift
  sourcekit = {
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  },
  
  -- TypeScript
  ts_ls = {},

  -- clangd = {},
  -- gopls = {},
  -- rust_analyzer = {},

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
