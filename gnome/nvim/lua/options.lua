local opt = vim.opt
local o = vim.o
local g = vim.g

-- Leaderkey
g.mapleader = " "
g.maplocalleader = " "

-- Colorscheme support
o.termguicolors = true

-- Statusline
o.laststatus = 3
o.showmode = false

-- Clipboard
o.clipboard = "unnamed,unnamedplus"

-- Cursorline
o.cursorline = true
o.cursorlineopt = "both"

-- Indent
o.expandtab = true
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- Search pattern
o.ignorecase = true
o.smartcase = true

-- Enable mouse
o.mouse = "a"

-- Line Number
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false

-- Sign column
o.signcolumn = "yes"

-- Split behavior
o.splitbelow = true
o.splitright = true

-- Cmd timeout
o.timeout = true
o.timeoutlen = 400

-- Enable time travel in files
o.undofile = true

-- Swap file update time
o.updatetime = 250

-- Add char into whichwrap
opt.whichwrap:append("<>[]hl")

-- Fold settings
o.foldenable = true
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""
o.foldlevel = 99
o.foldnestmax = 4

-- Netrw settings
g.netrw_keepdir = 1
g.netrw_localcopydircmd = "cp -r"

-- Disable provider
g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0
