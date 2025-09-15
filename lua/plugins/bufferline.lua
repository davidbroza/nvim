return {
  -- Bufferline: Shows open files as tabs at the top
  {
    "akinsho/bufferline.nvim", 
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- set to "tabs" to only show tabpages instead
          style_preset = require("bufferline").style_preset.default,
          themable = true,
          numbers = "none",
          close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
          right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
          left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
          middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
          indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
          },
          buffer_close_icon = '󰅖',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
          truncate_names = true, -- whether or not tab names should be truncated
          tab_size = 18,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true,
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
          separator_style = "slant",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
          sort_by = 'insert_after_current',
        }
      })
      
      -- Key mappings for buffer navigation
      vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
      vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
      vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
      vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
      vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", { desc = "Close buffers to right" })
      vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", { desc = "Close buffers to left" })
      
      -- Move buffers
      vim.keymap.set("n", "<A-<>", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
      vim.keymap.set("n", "<A->>", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
      
      -- Jump to buffer by number
      vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
      vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
      vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
      vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
      vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
    end,
  },
}
