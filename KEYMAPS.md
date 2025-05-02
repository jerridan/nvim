# Neovim Keymaps

This document provides a comprehensive list of all keymaps in my Neovim configuration.

## General

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| All | `<Space>` | | Leader key |
| Normal | `<Esc>` | `:nohlsearch<CR>` | Clear search highlights |
| Normal | `<leader>q` | `vim.diagnostic.setloclist` | Open diagnostic quickfix list |
| Normal | `<leader>t` | `:tabnew<CR>` | Open a new tab |
| Terminal | `<Esc><Esc>` | `<C-\><C-n>` | Exit terminal mode |

## Window Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<C-h>` | `<C-w><C-h>` | Move focus to the left window |
| Normal | `<C-l>` | `<C-w><C-l>` | Move focus to the right window |
| Normal | `<C-j>` | `<C-w><C-j>` | Move focus to the lower window |
| Normal | `<C-k>` | `<C-w><C-k>` | Move focus to the upper window |

## Line Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<D-Left>` | `0` | Move to beginning of line |
| Normal | `<D-Right>` | `$` | Move to end of line |
| Insert | `<D-Left>` | `<Esc>0i` | Move to beginning of line |
| Insert | `<D-Right>` | `<Esc>$a` | Move to end of line |

## File Path Operations

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>cp` | | Copy full absolute path to clipboard |
| Normal | `<leader>cr` | | Copy relative path to clipboard |
| Normal | `<leader>cf` | | Copy filename to clipboard |
| Normal | `<leader>cd` | | Copy directory path to clipboard |

## Telescope (Fuzzy Finder)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>sh` | `telescope.builtin.help_tags` | Search Help |
| Normal | `<leader>sk` | `telescope.builtin.keymaps` | Search Keymaps |
| Normal | `<leader>sf` | `telescope.builtin.find_files` | Search Files |
| Normal | `<leader>ss` | `telescope.builtin.builtin` | Search Select Telescope |
| Normal | `<leader>sw` | `telescope.builtin.grep_string` | Search current Word |
| Normal | `<leader>sg` | `telescope.builtin.live_grep` | Search by Grep |
| Normal | `<leader>sd` | `telescope.builtin.diagnostics` | Search Diagnostics |
| Normal | `<leader>sr` | `telescope.builtin.resume` | Search Resume |
| Normal | `<leader>s.` | `telescope.builtin.oldfiles` | Search Recent Files |
| Normal | `<leader><leader>` | `telescope.builtin.buffers` | Find existing buffers |
| Normal | `<leader>/` | | Fuzzily search in current buffer |
| Normal | `<leader>s/` | | Live Grep in Open Files |
| Normal | `<leader>sn` | | Search Neovim config files |

## LSP (Language Server Protocol)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `grn` | `vim.lsp.buf.rename` | Rename symbol |
| Normal, Visual | `gra` | `vim.lsp.buf.code_action` | Code action |
| Normal | `grr` | `telescope.builtin.lsp_references` | Go to references |
| Normal | `gri` | `telescope.builtin.lsp_implementations` | Go to implementation |
| Normal | `grd` | `telescope.builtin.lsp_definitions` | Go to definition |
| Normal | `grD` | `vim.lsp.buf.declaration` | Go to declaration |
| Normal | `gO` | `telescope.builtin.lsp_document_symbols` | Open document symbols |
| Normal | `gW` | `telescope.builtin.lsp_dynamic_workspace_symbols` | Open workspace symbols |
| Normal | `grt` | `telescope.builtin.lsp_type_definitions` | Go to type definition |
| Normal | `<leader>th` | | Toggle inlay hints |

## Code Formatting

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal, Visual | `<leader>f` | | Format buffer |

## UI and Appearance

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>tt` | | Toggle theme |
| Normal | `<leader>e` | `:NvimTreeToggle<CR>` | Toggle file explorer |
