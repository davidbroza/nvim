return {
  -- Neo-tree: Modern file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Basic Neo-tree setup
      require("neo-tree").setup({
        close_if_last_window = true, -- Close if it's the last window
        popup_border_style = "rounded",
        enable_git_status = true,
        filesystem = {
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer
          },
        },
      })
      
      -- Key mapping to toggle Neo-tree
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
    end,
  },
}