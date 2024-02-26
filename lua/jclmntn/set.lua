vim.opt.nu = true
vim.opt.relativenumber = true

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.opt.smartindent = true

vim.opt.colorcolumn = "80"
vim.g.mapleader = " "

vim.api.nvim_create_autocmd({"BufReadPre"}, {pattern = "*.md", command = "setlocal tw=100"})
