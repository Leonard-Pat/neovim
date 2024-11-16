-- relative line numbers

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.clipboard:append("unnamedplus")

vim.opt.wrap = true

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- case sensitive when search has mixed case

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.scrolloff = 8

vim.opt.hlsearch = false

-- window split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- turn off swapfile
vim.opt.swapfile = false

vim.g.mapleader = " "
vim.g.maplocalleader = ","
