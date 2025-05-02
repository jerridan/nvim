-- Editor enhancement plugins

return {
  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('config.telescope')
    end,
  },

  -- Treesitter for better syntax highlighting and code navigation
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        
        -- Navigation
        map('n', '<leader>gn', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Git Next hunk' })
        
        map('n', '<leader>gp', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Git Previous hunk' })
        
        -- Viewing changes
        map('n', '<leader>gd', gs.preview_hunk, { desc = 'Git Diff hunk' })
        map('n', '<leader>gb', function() gs.blame_line { full = false } end, { desc = 'Git Blame line' })
        map('n', '<leader>gB', function() gs.blame_line { full = true } end, { desc = 'Git Blame line (full)' })
        map('n', '<leader>gD', gs.diffthis, { desc = 'Git Diff this' })
        
        -- Actions
        map('n', '<leader>gs', gs.stage_hunk, { desc = 'Git Stage hunk' })
        map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Git Stage selected hunk' })
        map('n', '<leader>gr', gs.reset_hunk, { desc = 'Git Reset hunk' })
        map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Git Reset selected hunk' })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Git Undo stage hunk' })
        map('n', '<leader>gS', gs.stage_buffer, { desc = 'Git Stage buffer' })
        map('n', '<leader>gR', gs.reset_buffer, { desc = 'Git Reset buffer' })
        
        -- Additional features
        map('n', '<leader>gw', gs.toggle_word_diff, { desc = 'Git Word diff toggle' })
        map('n', '<leader>gx', gs.toggle_deleted, { desc = 'Git toggle deleted' })
        map('n', '<leader>gX', function() gs.reset_buffer_index(); gs.reset_buffer() end, { desc = 'Git revert all changes in current file' })
      end,
    },
  },

  -- Mini plugins - text editing helpers
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better text objects
      require('mini.ai').setup { n_lines = 500 }
      
      -- Text surround operations
      require('mini.surround').setup()
    end,
  },

  -- Smart line number toggling
  {
    'jeffkreeftmeijer/vim-numbertoggle',
  },

  -- Diff view for git changes
  {
    'sindrets/diffview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gv', '<cmd>DiffviewOpen<CR>', desc = 'Open Diffview (changed files)' },
      { '<leader>gh', '<cmd>DiffviewFileHistory<CR>', desc = 'Open File History' },
      { '<leader>gc', '<cmd>DiffviewClose<CR>', desc = 'Close Diffview' },
    },
    opts = {
      use_icons = vim.g.have_nerd_font,
      icons = {
        folder_closed = '',
        folder_open = '',
      },
      signs = {
        fold_closed = '',
        fold_open = '',
        done = '✓',
      },
      view = {
        default = {
          layout = 'diff2_horizontal',
        },
        merge_tool = {
          layout = 'diff3_horizontal',
          disable_diagnostics = true,
        },
        file_history = {
          layout = 'diff2_horizontal',
        },
      },
      file_panel = {
        listing_style = 'tree',
        tree_options = {
          flatten_dirs = true,
          folder_statuses = 'only_folded',
        },
        win_config = {
          position = 'left',
          width = 35,
        },
      },
    },
  },
}
