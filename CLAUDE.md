# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Overview

This is a modular Neovim configuration based on kickstart.nvim, organized into logical categories for maintainability. The configuration emphasizes automatic file saving, modern LSP features, and a streamlined development workflow.

## Key Development Commands

### Health and Diagnostics
- `:checkhealth` - Check Neovim installation and plugin health
- `:checkhealth kickstart` - Run configuration-specific health checks
- `:Mason` - Open Mason UI to manage language servers, formatters, and linters
- `:MasonInstall <server>` - Install specific language servers (e.g., `pyright`, `sourcekit-lsp`)

### Plugin Management (lazy.nvim)
- `:Lazy` - Open lazy.nvim plugin manager UI
- `:Lazy sync` - Update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy profile` - View plugin loading performance

### LSP and Development
- `:LspInfo` - Show attached language servers for current buffer
- `:LspRestart` - Restart LSP servers for current buffer
- `<leader>f` - Format current buffer using conform.nvim
- `<leader>q` - Open diagnostic quickfix list

## Architecture

### Core Structure
The configuration follows a strict modular pattern:

```
lua/
├── core/           # Essential Neovim configuration
│   ├── init.lua    # Loads all core modules
│   ├── options.lua # Vim options and settings
│   ├── keymaps.lua # Core key mappings
│   ├── autocmds.lua# Autocommands (including autosave)
│   └── lazy.lua    # Plugin manager bootstrap
├── plugins/        # Plugin specifications by category
│   ├── ui/         # User interface plugins (themes, statusline, etc.)
│   ├── editor/     # Editing tools (telescope, treesitter, git)
│   ├── lsp/        # Language Server Protocol configuration
│   └── coding/     # Code completion and snippets
└── config/         # Plugin-specific configurations
```

### Plugin Organization Pattern
Each plugin category has an `index.lua` file that imports all plugins in that category. This allows for clean modular loading in `core/lazy.lua`:

```lua
require('lazy').setup({
  { import = 'plugins.ui.index' },
  { import = 'plugins.editor.index' },
  { import = 'plugins.lsp.index' },
  { import = 'plugins.coding.index' },
})
```

### LSP Configuration System
- **Primary servers**: Configured in `lua/config/lsp/servers.lua`
- **Mason-managed**: Most language servers are automatically installed via Mason
- **Manual setup**: Swift's sourcekit-lsp is configured manually (not Mason-managed)
- **Active servers**: lua_ls, pyright, ts_ls (TypeScript)

## Key Features

### Automatic File Saving
The configuration includes robust autosave functionality (`lua/core/autocmds.lua`):
- Saves on `InsertLeave`, `TextChanged`, and `FocusLost` events
- Uses `silent! update` to only save modified buffers
- Prevents data loss during development

### Buffer-based Tab Management
Uses bufferline.nvim instead of traditional tabs:
- `<Tab>` / `<S-Tab>` - Navigate between buffers
- `<leader>bc` - Close current buffer
- `<leader>bo` - Close other buffers
- Buffer state is preserved across sessions

### Integrated Git Workflow
- Gitsigns for inline git information
- Fugitive for git operations
- Diffview for reviewing changes
- Organized under `<leader>g` prefix with sub-categories for hunks (`<leader>gh`)

### Theme System
Multiple colorschemes available:
- kanagawa (default)
- tokyonight
- catppuccin
- Switch via `<leader>tt`

## File Navigation Patterns

### Telescope Integration
Primary file/content discovery tool with these key bindings:
- `<leader>sf` - Find files
- `<leader>sg` - Live grep in project
- `<leader>s/` - Live grep in open files
- `<leader><leader>` - Switch between buffers
- `<leader>sn` - Search Neovim config files

### File Explorer
Neo-tree as the primary file explorer:
- `<leader>ee` - Toggle explorer
- `<leader>ef` - Reveal current file in explorer

## Language Server Management

### Adding New Language Support
1. Add server configuration to `lua/config/lsp/servers.lua`:
   ```lua
   server_name = {
     -- optional server-specific settings
   },
   ```
2. Install via Mason: `:MasonInstall server_name`
3. Restart Neovim or run `:LspRestart`

### Currently Configured Languages
- **Lua**: lua_ls (Neovim development optimized)
- **Python**: pyright
- **TypeScript/JavaScript**: ts_ls
- **Swift**: sourcekit-lsp (manually configured, not Mason-managed)

## Filetype-Specific Configuration
Located in `after/ftplugin/`:
- `json.lua` - 2-space indentation for JSON files
- `lua.lua` - Lua-specific settings
- `python.lua` - Python-specific settings
- `swift.lua` - Swift-specific settings

## Extension Guidelines

### Adding New Plugins
1. Create plugin file in appropriate `lua/plugins/*/` directory
2. Add require statement to corresponding `index.lua`
3. Follow existing patterns for lazy-loading and key mappings

### Customizing Keymaps
- Core mappings: `lua/core/keymaps.lua`
- Plugin-specific: Define within plugin configuration files
- Follow the `<leader>` prefix organization documented in `KEYMAPS.md`

### Theme Development
All themes are in `lua/plugins/ui/` and follow the same lazy.nvim specification pattern with proper priority settings for colorschemes.