local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Mouse
opt.mouse = "a"

-- Colors
opt.termguicolors = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Cursor 
opt.cursorline = true
opt.cursorlineopt = "line" -- or "line" for full highlight
opt.updatetime = 200
