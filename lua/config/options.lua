-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- remove transparency in floating windows
vim.opt.pumblend = 0

-- In init.lua:
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Number of spaces for auto-indent
vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while editing
vim.opt.smartindent = true -- Smart autoindenting when starting a new line

-- Optional but recommended related settings:
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.breakindent = true -- Maintain indent when wrapping lines

vim.opt.exrc = true -- Enable reading of .vimrc, .exrc, .gvimrc and .nvimrc in the current directory

vim.g.ai_cmp = false
