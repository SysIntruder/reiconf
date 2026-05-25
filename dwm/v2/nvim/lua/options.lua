-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Netrw
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 0
vim.g.netrw_keepdir = 1
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

-- Performance
vim.opt.timeoutlen = 500
vim.opt.updatetime = 500
vim.opt.synmaxcol = 500

-- Completion
vim.opt.autocomplete = true
vim.opt.autocompletedelay = 250
vim.opt.complete = "t"
vim.opt.completeopt = "noselect,noinsert,menu,menuone,popup,fuzzy"
vim.opt.wildmode = "noselect:lastused,full"
vim.opt.wildignore:append({ "*png", "*.jpg", "*.ico" })
vim.opt.wildcharm = "<C-z>"

-- Fold
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Behavior
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.path:append("**")
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.linebreak = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- UI
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes:2"
vim.opt.showmatch = true
vim.opt.winborder = "single"
vim.opt.pumborder = "single"
vim.opt.ruler = false
vim.opt.laststatus = 3
vim.opt.showtabline = 2

