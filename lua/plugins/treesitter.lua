return {
  -- Treesitter: Better syntax highlighting and code understanding
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Install parsers for these languages
        ensure_installed = {
          "lua", "vim", "vimdoc", "query", -- Neovim essentials
          
          -- Python/Django
          "python", "htmldjango",
          
          -- Web Development
          "javascript", "typescript", "tsx",
          "html", "css", "scss", "json", "jsonc",
          
          -- Config files
          "yaml", "toml", "ini",
          
          -- Other useful languages
          "bash", "markdown", "sql", "dockerfile",
        },
        
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        
        highlight = {
          enable = true,
          -- Some built-in highlighting can be slow, disable for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        
        -- Enable indentation based on treesitter
        indent = {
          enable = true,
        },
      })
    end,
  },
}