-- LSP server configurations

return {
  -- Example server configurations
  -- Uncomment and adjust as needed

  -- Python
  pyright = {},

  -- TypeScript
  ts_ls = {},

  -- JSON
  jsonls = {
    settings = {
      json = {
        validate = { enable = true },
      },
    },
  },

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

  -- Note: Swift LSP (sourcekit) is configured manually in init.lua
  -- and not managed by Mason
}
