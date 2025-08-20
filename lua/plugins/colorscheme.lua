return {
  -- Tokyo Night colorscheme - popular and easy on the eyes
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}