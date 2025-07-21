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
-- opt.clipboard = "unnamedplus"


vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
        ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
      },
    }


-- Cursor 
opt.cursorline = true
opt.cursorlineopt = "line" -- or "line" for full highlight
opt.updatetime = 200
