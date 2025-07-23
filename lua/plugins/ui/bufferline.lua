-- Bufferline - Visual buffer bar (tab-like interface for buffers)

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = {
    options = {
      mode = 'buffers', -- Use buffers instead of tabs
      numbers = 'none',
      close_command = 'bdelete! %d',
      right_mouse_command = 'bdelete! %d',
      left_mouse_command = 'buffer %d',
      middle_mouse_command = nil,
      indicator = {
        icon = '▎',
        style = 'icon',
      },
      buffer_close_icon = '×',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15,
      truncate_names = true,
      tab_size = 18,
      diagnostics = 'nvim_lsp',
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match('error') and ' ' or ' '
        return ' ' .. icon .. count
      end,
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      persist_buffer_sort = true,
      separator_style = 'thin',
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
      sort_by = 'insert_order',
      -- Offset for neo-tree
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          text_align = 'center',
          separator = true,
        },
      },
      -- Prevent focusing neo-tree when closing buffers
      custom_filter = function(buf_number, buf_numbers)
        -- Don't show neo-tree in the buffer list
        local filetype = vim.bo[buf_number].filetype
        return filetype ~= 'neo-tree'
      end,
    },
  },
  keys = {
    -- Buffer navigation (replaces tab navigation)
    { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
    { '<leader>bn', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { '<leader>bp', '<cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', desc = 'Close other buffers' },
    { '<leader>bC', '<cmd>BufferLineCloseRight<CR>', desc = 'Close buffers to the right' },
    { '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', desc = 'Close buffers to the left' },
    -- Pin/unpin buffers
    { '<leader>bP', '<cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin buffer' },
    -- Pick a buffer
    { '<leader>b<Tab>', '<cmd>BufferLinePick<CR>', desc = 'Pick buffer' },
  },
}
