-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true -- Shows relative line numbers (great for Vim motions!)

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8
vim.opt.wrap = false

-- Behavior
vim.opt.mouse = "a" -- Enable mouse support (helpful while learning)
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.undofile = true -- Persistent undo
vim.opt.swapfile = false
vim.opt.backup = false

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Show whitespace characters (helpful for learning)
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", space = "·", trail = "•" }
