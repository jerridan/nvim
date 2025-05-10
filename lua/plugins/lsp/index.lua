-- LSP plugins index file
-- This file imports all plugin configurations in the lsp directory

return {
  require("plugins.lsp.lazydev"),
  require("plugins.lsp.lspconfig"),
  require("plugins.lsp.conform"),
  require("plugins.lsp.lint"),
}
