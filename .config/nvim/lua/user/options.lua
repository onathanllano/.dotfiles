local options = vim.opt

options.cursorline = true

-- Line numbers
options.relativenumber = true
options.number = true
options.numberwidth = 4

-- Tabs/Indentations
options.tabstop = 2
options.shiftwidth = 2
options.expandtab = true
options.autoindent = true

-- Line wrap
options.wrap = true

-- Search
options.hlsearch = true
options.ignorecase = true
options.smartcase = true

-- Clipboard
options.clipboard:append("unnamedplus")

-- Autocompletions
options.completeopt = "menu,menuone,noselect"

-- Apearance
options.termguicolors = true
options.cmdheight = 1
options.mouse = "a"
options.showtabline = 0

-- Misc
options.swapfile = false
options.timeoutlen = 1000
options.undofile = true
options.writebackup = false
options.backup = false

options.list = true
