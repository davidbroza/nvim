return {
  -- Telescope: Fuzzy finder for files, text, and more
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      -- Optional: faster searching
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      
      telescope.setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "truncate" },
          initial_mode = "normal",
        },
        pickers = {
          find_files = {
            hidden = false,
            follow = false,
            no_ignore = false,
            no_ignore_parent = false,
          },
          live_grep = {
            additional_args = function()
              return { "--hidden", "--glob", "!.git/*" }
            end,
          },
        },
      })
      
      -- Load fzf extension for better performance
      telescope.load_extension("fzf")
      
      -- Key mappings for Telescope
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({ 
          cwd = vim.fn.getcwd(),
          search_dirs = { vim.fn.getcwd() },
          hidden = false,
        })
      end, { desc = "Find files in current directory" })
      
      vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep({ 
          cwd = vim.fn.getcwd(),
          search_dirs = { vim.fn.getcwd() },
        })
      end, { desc = "Live grep in current directory" })
      
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    end,
  },
}