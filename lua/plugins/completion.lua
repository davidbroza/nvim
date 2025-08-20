return {
  -- Main completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Completion sources
      "hrsh7th/cmp-nvim-lsp",     -- LSP completions
      "hrsh7th/cmp-buffer",       -- Buffer text completions
      "hrsh7th/cmp-path",         -- File path completions
      "hrsh7th/cmp-cmdline",      -- Command line completions
    },
    config = function()
      local cmp = require("cmp")
      
      cmp.setup({
        
        mapping = cmp.mapping.preset.insert({
          -- Navigation
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          
          -- Scrolling in completion docs
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          
          -- Trigger completion
          ["<C-Space>"] = cmp.mapping.complete(),
          
          -- Close completion
          ["<C-e>"] = cmp.mapping.abort(),
          
          -- Confirm selection
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          
          -- Tab completion
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },  -- LSP completions first
          { name = "buffer", priority = 500 },     -- Buffer text
          { name = "path", priority = 250 },       -- File paths
        }),
        
        formatting = {
          format = function(entry, item)
            -- Add source indicators
            local source_names = {
              nvim_lsp = "[LSP]",
              buffer = "[Buffer]",
              path = "[Path]",
            }
            item.menu = source_names[entry.source.name] or ""
            return item
          end,
        },
        
        experimental = {
          ghost_text = true, -- Show ghost text for completion
        },
      })
      
      -- Setup completion for command line
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })
      
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
    end,
  },
}