# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a modern Neovim configuration using a modular Lua-based structure with plugin management:

- `init.lua` - Entry point that loads core configuration modules
- `lua/config/` - Core configuration modules
  - `options.lua` - Comprehensive Vim options and settings
  - `keymaps.lua` - Key mappings and shortcuts
  - `lazy.lua` - Lazy.nvim plugin manager setup
- `lua/plugins/` - Individual plugin configurations
  - `colorscheme.lua` - Tokyo Night theme
  - `file-explorer.lua` - Neo-tree file browser
  - `telescope.lua` - Fuzzy finder and search
  - `treesitter.lua` - Syntax highlighting and parsing
  - `statusline.lua` - Lualine status bar
  - `which-key.lua` - Keymap hints and documentation

## Plugin System Guide

### Plugin Manager: Lazy.nvim
- **Downloads** plugins from GitHub automatically
- **Manages dependencies** between plugins intelligently
- **Lazy loads** plugins only when needed for faster startup
- **Updates** and **manages** plugin lifecycles
- **Configuration**: Each file in `lua/plugins/` returns a plugin specification

### Active Plugins

**Tokyo Night (colorscheme)**
```lua
{
  "folke/tokyonight.nvim",
  lazy = false,        -- Load immediately
  priority = 1000,     -- Load before other plugins
}
```

**Neo-tree (file explorer)**
```lua
{
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {     -- Required plugins
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
  },
}
```

**Telescope (fuzzy finder)**
```lua
{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}
```

**Treesitter (syntax highlighting)**
- Enhanced parsing and highlighting
- Automatic language detection
- Smart text objects

**Lualine (statusline)**
- Git branch and status
- File information
- Mode indicators

**Which-key (keymap helper)**
- Interactive keymap guide
- Shows available commands as you type

## Key Mappings

Leader key: Space (`<leader>` = `<Space>`)

### Core Navigation
- `<leader>e` - Toggle Neo-tree file explorer
- `<C-h>` - Switch to file explorer (from editor)
- `<C-l>` - Switch to editor (from file explorer)

### File Operations
- `<leader>w` - Save current buffer
- `<C-s>` - Save file (works in normal and insert mode)
- `<leader>x` - Save and quit
- `<leader>q` - Quit without saving

### Finding and Navigation (Telescope)
- `<leader>ff` - Find files in project
- `<leader>fg` - Live grep (search text in files)
- `<leader>fb` - Find and switch between open buffers
- `<leader>fh` - Search help tags
- `<leader>fr` - Recent files
- `<leader><leader>` - Quick buffer search (alternative to `<leader>fb`)

### Text Manipulation
- `J` (visual mode) - Move selected lines down
- `K` (visual mode) - Move selected lines up

### Window Management
- `<C-w>s` - Split window horizontally
- `<C-w>v` - Split window vertically
- `<C-w>w` - Switch between windows
- `<C-w>q` - Close current window

### Legacy Mappings
- `<leader>pv` - Open default file explorer (vim.cmd.Ex)

## Essential Vim Learning Path

### Week 1: Master the Basics
**Movement (Normal Mode):**
```
h j k l    - Left, Down, Up, Right
w b        - Word forward/backward
0 $        - Line start/end
gg G       - File start/end
```

**Editing:**
```
i a        - Insert before/after cursor
o O        - New line below/above
x dd       - Delete character/line
u Ctrl+r   - Undo/redo
```

### Week 2: Vim Grammar
**Formula: [count] + verb + noun**

**Verbs (operators):**
```
d - delete    c - change    y - yank (copy)    v - visual select
```

**Nouns (text objects):**
```
w     - word          iw/aw - inner/around word
i"/a" - inside/around quotes    ip/ap - inner/around paragraph
```

**Examples:**
```
dw    - delete word          ci"   - change inside quotes
yap   - yank paragraph       v3w   - select 3 words
```

### Week 3: Advanced Movement
```
f{char}  - Find character forward    t{char} - Till character
/text    - Search forward            n/N     - Next/previous result
.        - Repeat last command (powerful!)
```

### Week 4: Your Plugin Workflow
1. **File Management**: Use `<leader>e` for Neo-tree, `<leader>ff` for quick file finding
2. **Buffer Navigation**: `<leader>fb` to switch between open files
3. **Text Search**: `<leader>fg` to search across all files
4. **Quick Actions**: Press `<Space>` and wait for Which-key hints

## Configuration Features

### Enhanced Options
- **Relative line numbers** - Shows distance from cursor (great for `3j`, `5k` jumps)
- **System clipboard** - Copy/paste works with system clipboard
- **Mouse support** - Click to position cursor (helpful while learning)
- **Persistent undo** - Undo history survives restarts
- **Smart search** - Case-insensitive unless uppercase used
- **Whitespace visualization** - See tabs and trailing spaces
- **Proper split behavior** - New splits open right and below

### Plugin Loading Strategy
- **Immediate**: Colorscheme (priority 1000)
- **VeryLazy**: Which-key (after startup)
- **On-demand**: Most plugins load when first used

## Development Workflow

### Adding New Plugins
1. Create `lua/plugins/new-plugin.lua`
2. Return plugin specification table:
```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup()
  end,
}
```
3. Restart Neovim - Lazy.nvim handles installation

### Plugin Management Commands
- `:Lazy` - Open plugin manager interface
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install missing, update existing plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy health` - Check plugin health

### Common Plugin Patterns
```lua
-- Simple setup
return {
  "plugin/name",
  config = function()
    require("plugin").setup()
  end,
}

-- With options
return {
  "plugin/name", 
  opts = {
    option = "value",
  },
}

-- Conditional loading
return {
  "plugin/name",
  keys = "<leader>x",     -- Load when key pressed
  cmd = "PluginCommand",  -- Load when command run
  ft = "lua",            -- Load for specific file types
}
```

## Learning Resources and Next Steps

### Built-in Help
- `:help` followed by any topic
- `vimtutor` - Run in terminal for interactive tutorial
- Which-key: Press `<Space>` and wait for command hints

### Progressive Learning Path
1. **Week 1-2**: Master basic movement and editing with your current setup
2. **Week 3-4**: Learn Vim grammar (verb + noun combinations)
3. **Month 2**: Explore splits, buffers, and advanced text objects
4. **Month 3+**: Add LSP, Git integration, and custom workflows

### Popular Plugin Additions to Consider
- **LSP**: `nvim-lspconfig`, `mason.nvim` for language servers
- **Completion**: `nvim-cmp` for intelligent auto-complete
- **Git**: `gitsigns.nvim` for Git integration
- **Debugging**: `nvim-dap` for debug adapters
- **Testing**: `neotest` for test runners

Remember: **Master the fundamentals first - plugins enhance workflow, they don't replace Vim knowledge!**

## Additional Documentation

- `docs/VIM-LEARNING-GUIDE.md` - Comprehensive Vim learning path with exercises
- `docs/HOW-PLUGINS-WORK.md` - Detailed explanation of the plugin system