-- Git integration with gitsigns

return {
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
}
