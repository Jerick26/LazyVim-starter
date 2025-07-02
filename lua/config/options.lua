-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_scroll = false -- 禁用 snacks.nvim 滚动增强（提升大文件性能）:cite[2]

-- 基础设置
vim.opt.number = true -- 行号
vim.opt.relativenumber = false -- 相对行号
vim.opt.tabstop = 4 -- Tab宽度
vim.opt.shiftwidth = 4 -- 自动缩进宽度
vim.opt.expandtab = true -- Tab转空格
vim.opt.smartindent = false -- 智能缩进
vim.opt.wrap = false -- 不折行
vim.opt.ignorecase = true -- 搜索忽略大小写
vim.opt.smartcase = true -- 智能大小写
vim.opt.mouse = "a" -- 启用鼠标
vim.opt.clipboard = "unnamedplus" -- 系统剪贴板

vim.opt.termguicolors = true -- 真彩色支持
vim.opt.updatetime = 200 -- 更快的插件响应
vim.opt.splitright = true -- 右侧分屏
vim.opt.splitbelow = true -- 下方分屏

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.g.autoformat = false
vim.diagnostic.enable(false)
