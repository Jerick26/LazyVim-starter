-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- 混合键位策略
map("n", "<leader>w", "<cmd>w<cr>", { desc = "保存" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "退出" })

-- 窗口管理
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "水平分屏" })
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "垂直分屏" })

-- enable auto format
-- map("n", "<leader>uf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Disable the default format on save" })
