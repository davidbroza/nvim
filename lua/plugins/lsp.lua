return {
  -- Mason: LSP installer and manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },

  -- Mason LSP config: Bridges mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Lua
          "lua_ls",         -- Lua LSP (fixes vim warnings)
          
          -- Python
          "pyright",        -- Python LSP
          "ruff",           -- Python linting/formatting
          
          -- Web Development
          "ts_ls",          -- TypeScript/JavaScript LSP
          "html",           -- HTML LSP
          "cssls",          -- CSS LSP
          "tailwindcss",    -- Tailwind CSS LSP
          "emmet_ls",       -- HTML/CSS snippets
          
          -- JSON/YAML
          "jsonls",         -- JSON LSP
          "yamlls",         -- YAML LSP
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Lua LSP (fixes vim warnings)
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT"
            },
            diagnostics = {
              globals = { "vim" },  -- This fixes the "vim undefined" warnings
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
      
      -- Python LSPs
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            }
          }
        }
      })
      
      lspconfig.ruff.setup({})
      
      -- TypeScript/JavaScript LSP
      lspconfig.ts_ls.setup({
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "relative"
            }
          }
        }
      })
      
      -- HTML LSP
      lspconfig.html.setup({
        filetypes = { "html", "htmldjango" }, -- Include Django templates
      })
      
      -- CSS LSP
      lspconfig.cssls.setup({})
      
      -- Tailwind CSS LSP
      lspconfig.tailwindcss.setup({
        filetypes = {
          "html", "css", "scss", "javascript", "javascriptreact", 
          "typescript", "typescriptreact", "vue"
        }
      })
      
      -- Emmet for HTML/CSS snippets
      lspconfig.emmet_ls.setup({
        filetypes = {
          "html", "css", "scss", "javascript", "javascriptreact",
          "typescript", "typescriptreact", "htmldjango"
        }
      })
      
      -- JSON LSP
      lspconfig.jsonls.setup({})
      
      -- YAML LSP  
      lspconfig.yamlls.setup({})
      
      -- Global LSP settings
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
      })
      
      -- LSP attach function for keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          
          -- Navigation
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          
          -- Documentation and help
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          
          -- Code actions and refactoring
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
          
          -- Diagnostics
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        end,
      })
    end,
  },
}