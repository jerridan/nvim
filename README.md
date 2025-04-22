# Jerridan's Neovim Configuration

## Introduction

This is my personal Neovim configuration built on the foundation of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) but reorganized into a modular structure for better maintainability and easier customization.

Key features:
* Modular organization (vs. single-file)
* Carefully selected plugins for coding and productivity
* Sensible defaults with modern Neovim features
* Well-documented and easy to extend

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

## Customization

You can extend this configuration by:

1. Modifying files in `lua/core/` for Neovim settings
2. Adding/modifying plugins in `lua/plugins/` 
3. Adding specialized settings in `after/`

## Key Mappings

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<Space>` | Leader key |
| Normal | `<Leader>ff` | Find files |
| Normal | `<Leader>fg` | Live grep |
| Normal | `<Leader>e` | File explorer |
| Normal | `gc` | Toggle comment |
| ... | ... | ... |

## Acknowledgements

This configuration is based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) but reorganized into a modular structure.