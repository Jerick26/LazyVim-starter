-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- 混合键位策略 (保留 LazyVim 高效操作 + amix 肌肉记忆)
map("n", "<leader>w", "<cmd>w<cr>", { desc = "保存" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "退出" })

-- 窗口管理 (保留 LazyVim 优势)
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "垂直分屏" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "水平分屏" })
map("n", "<C-h>", "<C-w>h", { desc = "左窗口" }) -- LazyVim 快速导航
map("n", "<C-j>", "<C-w>j", { desc = "下窗口" })
map("n", "<C-k>", "<C-w>k", { desc = "上窗口" })
map("n", "<C-l>", "<C-w>l", { desc = "右窗口" })

-- Buffer 管理 (混合方案)
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "下一个 Buffer" })
map("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "上一个 Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "关闭 Buffer" }) -- LazyVim 风格

-- 添加 amix 实用键位
map("n", "<leader>cd", ":cd %:p:h<CR>", { desc = "切换到文件目录" })
map("n", "<leader>sc", ":nohl<CR>", { desc = "清除搜索高亮" }) -- 保留 amix 习惯
