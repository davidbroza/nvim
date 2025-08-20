return {
  -- Which-key: Shows available keybindings as you type
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({
        -- Your configuration here
      })
      
      -- Register key descriptions
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>ff", desc = "Find Files" },
        { "<leader>fg", desc = "Live Grep" },
        { "<leader>fb", desc = "Find Buffers" },
        { "<leader>fh", desc = "Help Tags" },
        { "<leader>fr", desc = "Recent Files" },
        { "<leader>b", group = "Buffers" },
        { "<leader>bd", desc = "Delete Buffer" },
        { "<leader>bo", desc = "Close Other Buffers" },
        { "<leader>br", desc = "Close Buffers Right" },
        { "<leader>bl", desc = "Close Buffers Left" },
        { "<leader>e", desc = "Toggle File Explorer" },
        { "<leader>w", desc = "Save File" },
        { "<leader>q", desc = "Quit" },
        { "<leader>x", desc = "Save and Quit" },
        { "<S-h>", desc = "Previous Buffer" },
        { "<S-l>", desc = "Next Buffer" },
      })
    end,
  },
}