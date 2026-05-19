local opt = vim.opt
local o = vim.o
local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

o.termguicolors = true
o.clipboard = "unnamedplus"
o.ruler = false
o.winborder = "single"

o.cursorline = true
o.cursorlineopt = "both"

o.scrolloff = 5
o.signcolumn = "yes"

o.expandtab = true
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

o.ignorecase = true
o.smartcase = true

o.number = true
o.relativenumber = true
o.numberwidth = 2

o.splitbelow = true
o.splitright = true

o.timeout = true
o.timeoutlen = 400

o.swapfile = false
o.backup = false
o.undofile = true
o.updatetime = 50

-- Fold settings
o.foldenable = true
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""
o.foldlevel = 99
o.foldnestmax = 4

-- Netrw settings
g.netrw_winsize = 25
g.netrw_browse_split = 0
g.netrw_keepdir = 1
g.netrw_localcopydircmd = "cp -r"
g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

g["loaded_node_provider"] = 0
g["loaded_python3_provider"] = 0
g["loaded_perl_provider"] = 0
g["loaded_ruby_provider"] = 0

-- Misc
g.ftplugin_sql_omni_key = "<C-j>"
