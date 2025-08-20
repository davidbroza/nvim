vim.g.mapleader = " "

-- Basic mappings
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Save current buffer
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
--
-- Save from Insert mode with Ctrl+S
vim.keymap.set("i", "<C-s>", "<C-o>:w<CR>", { desc = "Save file from insert mode" })
vim.keymap.set("n", "<C-s>", "<C-o>:w<CR>", { desc = "Save file from insert mode" })
--
-- Save and quit
vim.keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })

-- Quit
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quite without saving" })

-- Buffer navigation
vim.keymap.set("n", "<leader><leader>", function()
  require("telescope.builtin").buffers()
end, { desc = "Search open buffers" })

-- Cycle through buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { desc = "Previous buffer" })

-- Close current buffer
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close current buffer" })

-- Clear search highlighting
vim.keymap.set("n", "<leader>h", ":noh<CR>", { desc = "Clear search highlighting" })

-- LSP keymaps (note: most are auto-configured in lsp.lua on LspAttach)
-- Manual diagnostics navigation for when LSP isn't attached
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics to location list" })

-- Window/panel navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right window" })
