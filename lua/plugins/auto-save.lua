return {
    "907th/vim-auto-save",
    event = "BufEnter", -- 缓冲区打开时加载
    config = function()
        vim.g.auto_save = 1
        vim.g.auto_save_interval = 1 -- 每秒保存:cite[3]
    end,
}
