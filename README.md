# Jerridan's Neovim Configuration

## Introduction

This is my personal Neovim configuration built on the foundation of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) but reorganized into a modular structure for better maintainability and easier customization.

Key features:
* Modular organization (vs. single-file)
* Carefully selected plugins for coding and productivity
* Sensible defaults with modern Neovim features
* Well-documented and easy to extend
* Automatic file saving to prevent data loss

## Structure

```
~/.config/nvim/
├── init.lua              # Main entry point
├── lua/
│   ├── core/             # Essential Neovim settings
│   │   ├── autocmds.lua  # Autocommands
│   │   ├── init.lua      # Core module loader
│   │   ├── keymaps.lua   # Key mappings
│   │   ├── lazy.lua      # Plugin manager setup
│   │   └── options.lua   # Neovim options
│   └── plugins/          # Plugin specifications by category
│       ├── coding.lua    # Code-related plugins
│       ├── editor.lua    # General editing plugins
│       ├── lsp.lua       # LSP configuration
│       └── ui.lua        # User interface plugins
└── after/                # Filetype-specific settings
```

## Installation

### Prerequisites

- Neovim 0.9.0+ (latest stable recommended)
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended)
- ripgrep (for telescope)
- Language servers (automatically installed via Mason)

### Install This Configuration

```bash
# Backup your existing configuration if needed
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repository
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim

# Start Neovim - plugins will install automatically
nvim
```

## Core Features

### Plugin Management

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management, providing:
- Lazy-loading for faster startup
- Automatic plugin installation
- Simple plugin specification

### Autosave Functionality

This configuration includes automatic file saving to prevent data loss:
- Files are automatically saved when:
  - You exit insert mode
  - Text is changed in normal mode
  - Neovim loses focus
- Only modified buffers are saved
- Silent operation (no notifications) to avoid workflow interruption

### LSP Support

Comprehensive LSP integration with:
- Automatic server installation via Mason
- Intelligent code completion
- Diagnostics, references, and definitions
- Code actions and refactoring

### Syntax and Treesitter

Rich syntax highlighting and code understanding with:
- Treesitter for better syntax highlighting
- Smart indentation
- Code folding based on syntax

### File Navigation and Search

Efficient file management with:
- Telescope for fuzzy finding
- File explorer
- Buffer management

## Language Server Configuration

This configuration uses the Language Server Protocol (LSP) to provide intelligent code features like autocompletion, diagnostics, and code navigation.

### Enabling Autocompletion for Additional Languages

1. Edit `lua/config/lsp/servers.lua` and uncomment or add server configurations:

```lua
return {
  -- Python
  pyright = {},
  
  -- TypeScript/JavaScript
  tsserver = {},
  
  -- Swift
  sourcekit = {},
  
  -- Rust
  rust_analyzer = {},
  
  -- C/C++
  clangd = {},
  
  -- Go
  gopls = {},
  
  -- Already configured for Lua
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}
```

2. Install the required language servers through Mason:
   - Open Neovim and run `:Mason`
   - Navigate to the desired language server (e.g., pyright, sourcekit-lsp)
   - Press `i` to install
   
   Or use the command line interface:
   ```
   :MasonInstall pyright sourcekit-lsp tsserver rust-analyzer clangd gopls
   ```

3. Restart Neovim for the changes to take effect

### Language-Specific Setup Notes

- **Python**: Requires `pyright` server
- **Swift**: Requires `sourcekit-lsp` server
- **TypeScript/JavaScript**: Requires `tsserver`
- **Rust**: Requires `rust-analyzer`
- **C/C++**: Requires `clangd`
- **Go**: Requires `gopls`

## Customization

You can extend this configuration by:

1. Modifying files in `lua/core/` for Neovim settings
2. Adding/modifying plugins in `lua/plugins/` 
3. Adding specialized settings in `after/`

## Key Mappings

For a comprehensive list of all key mappings in this configuration, please refer to the [KEYMAPS.md](./KEYMAPS.md) file.

Keymaps are defined in several locations:
- Core keymaps: `lua/core/keymaps.lua`
- Plugin-specific keymaps: Inside respective plugin configuration files in `lua/plugins/`

## Acknowledgements

This configuration is based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) but reorganized into a modular structure.