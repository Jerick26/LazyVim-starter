-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.relativenumber = false -- 相对行号
opt.tabstop = 4 -- Tab宽度
opt.shiftwidth = 4 -- 自动缩进宽度
-- vim.opt.expandtab = true -- Tab转空格
-- vim.opt.smartindent = false -- 智能缩进
-- vim.g.snacks_scroll = false -- 禁用 snacks.nvim 滚动增强（提升大文件性能）
-- vim.opt.wrap = false -- 不折行
-- vim.opt.ignorecase = true -- 搜索忽略大小写
opt.smartcase = true -- Don't ignore case with capitals
-- vim.opt.mouse = "a" -- Enable mouse mode
-- vim.opt.clipboard = "unnamedplus" -- 系统剪贴板
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
-- Reduce wait time for key sequences (e.g., mappings)
opt.timeoutlen = 500  -- Default is 1000 ms (adjust between 200-500 ms)
-- Ensure terminal key codes time out quickly
opt.ttimeoutlen = 10  -- Default is 50 ms (keep this low)
opt.tags = './tags;/'

vim.g.snacks_scroll = false -- 禁用 snacks.nvim 滚动增强（提升大文件性能）
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.g.autoformat = false
vim.diagnostic.enable(false)
