# Neovim Keymaps

This document provides a comprehensive list of all keymaps in my Neovim configuration.

## General

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<Esc>` | `:nohlsearch<CR>` | Clear search highlights |
| All | `<Space>` | | Leader key |
| Normal | `<leader>q` | `vim.diagnostic.setloclist` | Open diagnostic quickfix list |
| Terminal | `<Esc><Esc>` | `<C-\><C-n>` | Exit terminal mode |

## Window Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<C-h>` | `<C-w><C-h>` | Move focus to the left window |
| Normal | `<C-j>` | `<C-w><C-j>` | Move focus to the lower window |
| Normal | `<C-k>` | `<C-w><C-k>` | Move focus to the upper window |
| Normal | `<C-l>` | `<C-w><C-l>` | Move focus to the right window |

## Buffer Management (replaces tabs)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<Tab>` | `:BufferLineCycleNext<CR>` | Go to next buffer |
| Normal | `<S-Tab>` | `:BufferLineCyclePrev<CR>` | Go to previous buffer |
| Normal | `<leader>bn` | `:BufferLineCycleNext<CR>` | Go to next buffer |
| Normal | `<leader>bp` | `:BufferLineCyclePrev<CR>` | Go to previous buffer |
| Normal | `<leader>bc` | `:bdelete<CR>` | Close current buffer |
| Normal | `<leader>bo` | `:BufferLineCloseOthers<CR>` | Close other buffers |
| Normal | `<leader>bC` | `:BufferLineCloseRight<CR>` | Close buffers to the right |
| Normal | `<leader>bl` | `:BufferLineCloseLeft<CR>` | Close buffers to the left |
| Normal | `<leader>bP` | `:BufferLineTogglePin<CR>` | Toggle pin buffer |
| Normal | `<leader>b<Tab>` | `:BufferLinePick<CR>` | Pick buffer |

## Line Navigation

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<D-Left>` | `0` | Move to beginning of line |
| Insert | `<D-Left>` | `<Esc>0i` | Move to beginning of line |
| Normal | `<D-Right>` | `$` | Move to end of line |
| Insert | `<D-Right>` | `<Esc>$a` | Move to end of line |

## File Path Operations

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>ca` | | Copy all file contents to clipboard |
| Normal | `<leader>cd` | | Copy directory path to clipboard |
| Normal | `<leader>cf` | | Copy filename to clipboard |
| Normal | `<leader>cp` | | Copy full absolute path to clipboard |
| Normal | `<leader>cr` | | Copy relative path to clipboard |

## Telescope (Fuzzy Finder)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>/` | | Fuzzily search in current buffer |
| Normal | `<leader><leader>` | `telescope.builtin.buffers` | Find existing buffers |
| Normal | `<leader>s.` | `telescope.builtin.oldfiles` | Search Recent Files |
| Normal | `<leader>s/` | | Live Grep in Open Files |
| Normal | `<leader>sd` | `telescope.builtin.diagnostics` | Search Diagnostics |
| Normal | `<leader>sf` | `telescope.builtin.find_files` | Search Files |
| Normal | `<leader>sg` | `telescope.builtin.live_grep` | Search by Grep |
| Normal | `<leader>sh` | `telescope.builtin.help_tags` | Search Help |
| Normal | `<leader>sk` | `telescope.builtin.keymaps` | Search Keymaps |
| Normal | `<leader>sn` | | Search Neovim config files |
| Normal | `<leader>sr` | `telescope.builtin.resume` | Search Resume |
| Normal | `<leader>ss` | `telescope.builtin.builtin` | Search Select Telescope |
| Normal | `<leader>sw` | `telescope.builtin.grep_string` | Search current Word |
| Insert/Normal (Telescope) | `<CR>` | `select_tab` | Open selection in new tab |
| Normal (Telescope) | `<Space>` | `select_default` | Open selection in current window |

## LSP (Language Server Protocol)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>th` | | Toggle inlay hints |
| Normal | `gO` | `telescope.builtin.lsp_document_symbols` | Open document symbols |
| Normal, Visual | `gra` | `vim.lsp.buf.code_action` | Code action |
| Normal | `grd` | `telescope.builtin.lsp_definitions` | Go to definition |
| Normal | `grD` | `vim.lsp.buf.declaration` | Go to declaration |
| Normal | `gri` | `telescope.builtin.lsp_implementations` | Go to implementation |
| Normal | `grn` | `vim.lsp.buf.rename` | Rename symbol |
| Normal | `grr` | `telescope.builtin.lsp_references` | Go to references |
| Normal | `grt` | `telescope.builtin.lsp_type_definitions` | Go to type definition |
| Normal | `gW` | `telescope.builtin.lsp_dynamic_workspace_symbols` | Open workspace symbols |

## Code Formatting

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal, Visual | `<leader>f` | `conform.format` | Format buffer |

## UI and Appearance

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>tt` | | Toggle theme |

## File Explorer (neo-tree)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>ee` | `:Neotree toggle<CR>` | Toggle file explorer |
| Normal | `<leader>ef` | `:Neotree reveal<CR>` | Find current file in explorer |
| Normal | `<leader>er` | `:Neotree refresh<CR>` | Refresh file explorer |
| Normal | `<leader>ew` | | Switch focus between explorer and editor |

## Mini.nvim

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `sa` | `mini.surround` | Add surrounding (sa{motion}{char}) |
| Visual | `sa` | `mini.surround` | Add surrounding to visual selection |
| Normal | `sd` | `mini.surround` | Delete surrounding (sd{char}) |
| Normal | `sr` | `mini.surround` | Replace surrounding (sr{target}{replacement}) |

## Git

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>gb` | `gitsigns.blame_line` | Toggle git blame for current line |
| Normal | `<leader>gB` | `gitsigns.blame_line (full)` | Toggle git blame with full details |
| Normal | `<leader>gD` | `gitsigns.diffthis` | Open git diff view |
| Normal | `<leader>gk` | `vim-fugitive` | Git stage all changes and commit with message |
| Normal | `<leader>go` | `:GBrowse<CR>` | Open current file in GitHub |
| Normal | `<leader>gp` | `:Git push<CR>` | Push to remote repository |
| Normal | `<leader>gR` | `gitsigns.reset_buffer` | Reset (unstage) entire buffer |
| Normal | `<leader>gS` | `gitsigns.stage_buffer` | Stage entire buffer |
| Normal | `<leader>gw` | `gitsigns.toggle_word_diff` | Toggle word diff view |
| Normal | `<leader>gx` | `gitsigns.toggle_deleted` | Toggle deleted lines highlight |
| Normal | `<leader>gX` | `gitsigns.reset_buffer_index + reset_buffer` | Revert all changes in current file only |

## Git Hunks

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `<leader>ghd` | `gitsigns.preview_hunk` | Preview git hunk changes |
| Normal | `<leader>ghn` | `gitsigns.next_hunk` | Go to next git hunk |
| Normal | `<leader>ghp` | `gitsigns.prev_hunk` | Go to previous git hunk |
| Normal | `<leader>ghr` | `gitsigns.reset_hunk` | Reset (unstage) git hunk |
| Visual | `<leader>ghr` | `gitsigns.reset_hunk (selection)` | Reset (unstage) selected lines |
| Normal | `<leader>ghs` | `gitsigns.stage_hunk` | Stage git hunk |
| Visual | `<leader>ghs` | `gitsigns.stage_hunk (selection)` | Stage selected lines |
| Normal | `<leader>ghu` | `gitsigns.undo_stage_hunk` | Undo last staged hunk |